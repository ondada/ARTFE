<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>



<link rel="stylesheet" href="css/order.css">
<script language="javascript" src="js_package.js"> 
</script>

<body>

<%
	//  로그인 성공시(loginOK.jsp의 42~51행 부분)에 부여한 "sid" 속성의 속성값은 
	//  "특정회원의 ID"를 나타내며,  이 속성값이 null인지 아닌지로 로그인 여부를 확인함. 
	//  (로그인이 안된 경우, 이 값은 null값을 가짐)
	//  => loginOK.jsp의 43행에서, session.setAttribute("sid", id); 로  이미 설정해 놓았음.
	//  따라서, 이러한 ID값을 가져오기 위해서는 (String)session.getAttribute("sid"); 를 이용하면 됨!

if (sid == null)    //  로그인 하지 않은 상태에서, 장바구니를 보려고 하는 경우의 처리(24~34행)
{                             //   =>  먼저 로그인을 하도록 유도함 
%>
<center>
<br><br><br> 
<font style="font-size:10pt;font-family:맑은 고딕">
		<br><br><br><br><br> <b>로그인이 필요합니다</b> <br><br><br><br>
		<font style="font-color:red" ><a href="login.jsp"> <input type="button" class="submit-btn" value="로그인 페이지로 이동" onClick="checkValue()" style="cursor:pointer"> </a></font>
<br><br><br><br><br><br><br><br><br><br><br><br>
</font>
  <%@include file="footer.jsp" %>
</center>
<%
}
else    //  이미 로그인되어 있는 경우,  장바구니 보기 처리 부분(35행~끝 까지)
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String ctNo = session.getId();  //세션 번호를 장바구니 번호(ctNo)로서 이용하기 위해 ctNo에 저장
 	                                                          // session.getId()함수의 리턴값(결과값)은  세션번호(세션ID)임.

        // [세션과 관련한 내용 부연 설명] :
        // 클라이언트가 서버에 접속하게 되면 서버로부터 세션번호(난수형태의 식별번호)를 부여받음.
        //  => 부여받은 세션번호를 프로그램상에서 가져오려면 session.getId()를 사용함.
        // 부여받은 세션번호는 로그인 된 상태 동안(세션이 유지되는 동안) 그대로 보존된다.
        // 만일, 동일한 ID로 서버에 재접속하게 되더라도 또 새로운 세션번호를 부여받음.
        // => 따라서, 이러한 세션을 이용하면, 장바구니의 개념이 그대로 표현가능해 질 수 있다. 

         
		 //  장바구니테이블(cart 테이블)을 구성하는 각 필드가 ctNo, prdNo, ctQty임에 주목!
		String e_no = request.getParameter("e_no"); // 상품번호
		int b_qty = Integer.parseInt(request.getParameter("b_qty")); //  주문수량(장바구니에 담을 상품수량)


		// (72~76행):  특정회원이 로그인 해 있는 동안에(특정 세션번호),  동일한 상품을 
		// 장바구니 테이블에 이미 담았었는지 아닌지를 확인하기 위해서 select문을 이용함!

		//  (1) 담고자 하는 상품레코드가 이미 장바구니테이블(cart)에 존재하는 경우(76~87행 부분) :
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시키는 것이 아니라, 
		//           이미 존재하는 상품레코드에 상품수량만을 갱신(update)시킨다.
		//  (2) 담고자 하는 상품레코드가 장바구니테이블(cart)에 존재하지 않는 경우(88~97행 부분):
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시킨다.
		String jsql = "select * from cart where ctNo = ? and e_no = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ctNo);
		pstmt.setString(2, e_no);
		ResultSet rs = pstmt.executeQuery(); 

	   	if(rs.next())   // 동일 상품이 이미 장바구니에 존재한다면 수량만을 추가시킴.
		{		               // 즉, update문을 사용하여 이미 존재하는 상품데이터의 수량부분만을 갱신시킴.
			int sum = rs.getInt("b_qty") + b_qty;  //  이미 기존에 있는 수량에다 새로 추가시킬 수량을 합산함.

			String jsql2 = "update cart set b_qty=? where ctNo=? and e_no=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, e_no);

			pstmt2.executeUpdate();
		}
		else  // 동일 상품이 장바구니에 존재하지 않는다면, 새로운 상품레코드를 장바구니 테이블에 추가시킴
		{
			String jsql3 = "insert into cart (ctNo, e_no, b_qty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,e_no);
			pstmt3.setInt(3,b_qty);	

			pstmt3.executeUpdate();
		}  //  76행~97행 if-else문의 끝
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch문 닫기		

     //  장바구니에 상품을 등록 또는 갱신시킨 후, 장바구니 내역을 보여주도록 showCart.jsp를 호출함.   
	    response.sendRedirect("mpCart.jsp");   //  <jsp:forward page="showCart.jsp"/> 와 동일한 의미
}  // 24~104행 if-else문의 끝	                                     
%>
</body>
</html>
