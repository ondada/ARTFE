<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>관심내역</title>


 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:blue; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>

</head>
<body>
<%
	//  로그인 성공시(loginOK.jsp의 42~51행 부분)에 부여한 "sid" 속성의 속성값은 
	//  "특정회원의 ID"를 나타내며,  이 속성값이 null인지 아닌지로 로그인 여부를 확인함. 
	//  (로그인이 안된 경우, 이 값은 null값을 가짐)
	//  => loginOK.jsp의 43행에서, session.setAttribute("sid", id); 로  이미 설정해 놓았음.
	//  따라서, 이러한 ID값을 가져오기 위해서는 (String)session.getAttribute("sid"); 를 이용하면 됨!
	String sid = (String)session.getAttribute("sid");  
	%>

<%
 	 	request.setCharacterEncoding("euc-kr");


	String likeNo = session.getId();
	String e_no =  request.getParameter("e_no");

	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String jsql = "insert into booklike (likeNo, e_no)  VALUES  (?, ?)"; 

	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, likeNo);
	pstmt.setString(2, e_no);

	 pstmt.executeUpdate();

	 response.sendRedirect("mpLike.jsp"); /*
		// (72~76행):  특정회원이 로그인 해 있는 동안에(특정 세션번호),  동일한 상품을 
		// 장바구니 테이블에 이미 담았었는지 아닌지를 확인하기 위해서 select문을 이용함!

		//  (1) 담고자 하는 상품레코드가 이미 장바구니테이블(cart)에 존재하는 경우(76~87행 부분) :
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시키는 것이 아니라, 
		//           이미 존재하는 상품레코드에 상품수량만을 갱신(update)시킨다.
		//  (2) 담고자 하는 상품레코드가 장바구니테이블(cart)에 존재하지 않는 경우(88~97행 부분):
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시킨다.


   	if(rs.next())   // 동일 상품이 이미 장바구니에 존재한다면 수량만을 추가시킴.
		{		               // 즉, update문을 사용하여 이미 존재하는 상품데이터의 수량부분만을 갱신시킴.
			int sum = rs.getInt("ctQty") + ctQty;  //  이미 기존에 있는 수량에다 새로 추가시킬 수량을 합산함.

			String jsql2 = "update cart set ctQty=? where ctNo=? and prdNo=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, prdNo);

			pstmt2.executeUpdate();
		}
		else  // 동일 상품이 장바구니에 존재하지 않는다면, 새로운 상품레코드를 장바구니 테이블에 추가시킴
		{
			String jsql3 = "insert into cart (ctNo, prdNo, ctQty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,prdNo);
			pstmt3.setInt(3,ctQty);	

			pstmt3.executeUpdate();
		}  //  76행~97행 if-else문의 끝
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch문 닫기		

     //  장바구니에 상품을 등록 또는 갱신시킨 후, 장바구니 내역을 보여주도록 showCart.jsp를 호출함.   
	    response.sendRedirect("showCart.jsp");   //  <jsp:forward page="showCart.jsp"/> 와 동일한 의미
}  // 24~104행 if-else문의 끝	                                     
*/%>
</body>
</html>