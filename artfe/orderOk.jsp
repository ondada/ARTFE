<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>    
<html>
<head>
<title>주문 처리 완료</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:gray; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>

</head>

<%
//   cart 테이블이 아니라, tempcart 테이블을 사용하고 (61행 참조),
//   deleteAllCart.jsp?case=1가 아니라, deleteTempCart.jsp를 사용한다(108행 참조)는 점을 제외하면,
//   directOrderOK.jsp는 orderOK.jsp와 모든 코드가 동일함에 유의할 것!

try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";    // 접속 DB는 project
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");

	String ctNo = session.getId();   //  세션번호(장바구니번호) 를 ctNo에 저장
    String	sid = (String)session.getAttribute("sid");  //   접속 ID 값을 가져와서 변수 myid에 저장.
                                                                                            //  주문자정보를 위해 추후 필요함.
	String u_id = request.getParameter("u_id");
	String r_name = request.getParameter("r_name");

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String	r_phone = phone1 + "-"+ phone2 + "-" + phone3;

	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String r_address = address1 + " " + address2 +  " " +address3;

	String r_grade = request.getParameter("r_grade");
	String r_pay = request.getParameter("r_pay");
	String 	r_date = request.getParameter("r_date");	
	String amount = request.getParameter("r_amount");

	String b_time = request.getParameter("b_time");
	String b_date = request.getParameter("b_date");

	String delivery = request.getParameter("delivery");    


// 새로운 주문번호(ordNo)를 부여하기 위해, 주문테이블에 있는 마지막 주문번호를 가져옴.
// 주문이 들어올 때마다 주문번호는 1씩 증가하므로, MAX(ordNo)은 ordNo의 최대값, 즉 
//  마지막 주문번호를 의미함.
	String jsql = "select MAX(bNo) from bookinfo";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery(); 

	int bNo;
	if(rs.next())                             // 주문번호가 orderinfo 테이블에 존재한다면,  "이전 주문번호" + 1 을 수행
		bNo = rs.getInt(1) + 1;       //  rs.getInt(1)의 의미:   rs.next()가 가리키고 있는 레코드의 첫번째 필드에 
		                                             //  해당하는 필드값을 의미함 
		                                             //  이 경우, rs.getInt(1)는  rs.getInt("MAX(ordNo)")와 동일한 의미가 됨.
  												     //  => mysql상에서 sql문을 실행하여 왜 동일의미가 되는지 꼭 확인해 볼 것!
	else                     
		bNo = 1;   // 주문번호가 존재하지 않는다면, 주문번호를 1부터 시작하도록 함
	                         // (아직 단 한건의 주문도 접수받지 않은 상태라면, 주문번호가 존재하지 않을 수도 있음) 

	String jsql2 = "select e_no, b_qty from tempcart where ctNo = ?";   //  tempcart 테이블을 사용하고 있음에 유의!
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, ctNo);		

	ResultSet rs2 = pstmt2.executeQuery(); 

//  tempcart 테이블에 있는 내역들을 읽어와서,
//  주문상품 테이블(ordProduct)에 주문번호(ordNo), 상품번호(prdNo), 주문수량(ordQty)을 저장시킴!
	while(rs2.next())   // 주문상품테이블(orderProduct)에 주문번호(ordNo), 상품번호(prdNo), 
	{			                    // 주문수량(ordQty)을 저장하기 위해 tempcart 테이블로부터
	                                //  prdNo과 ctQty를 가져온다.
			String e_no = rs2.getString("e_no");	//  tempcart 테이블로부터 상품번호 추출
    		int b_qty = rs2.getInt("b_qty");	                //  tempcart 테이블로부터 주문수량 추출 

			String jsql3 = "INSERT INTO bookproduct (bNo, e_no, bookQty) VALUES (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, Integer.toString(bNo));
			pstmt3.setString(2, e_no);
			pstmt3.setInt(3, b_qty);

			pstmt3.executeUpdate();
	 }

//  주문정보 테이블(ordInfo)에 저장시킬 필드들을 저장 
	String jsql4 = "INSERT INTO bookinfo (bNo, u_id, r_date, r_phone,  r_address, r_name, b_date, b_time, delivery)  VALUES(?,?,?,?,?,?,?,?,?)";

Date date = new Date();
		System.out.println("포맷 지정 전 : " + date);
		
        
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm"); 
        	//원하는 데이터 포맷 지정
		String oDate = simpleDateFormat.format(date); 

	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, Integer.toString(bNo));
	pstmt4.setString(2, sid);
	pstmt4.setString(3, oDate);
	pstmt4.setString(4, r_phone);
    pstmt4.setString(5, r_address);
	pstmt4.setString(6, r_name);
	pstmt4.setString(7, b_date);
	pstmt4.setString(8, b_time);
	pstmt4.setString(9, delivery);

	pstmt4.executeUpdate();

//  주문정보와 관련된 일체의 정보들을 각각 orderproduct 테이블과 orderinfo 테이블에 
//  저장시킨 후, tempcart 테이블 비우기를 수행함.

	 response.sendRedirect("mpbookinfo.jsp");    //  forward 액션태그를 사용해도 동일함

   }  catch(Exception e)  {
        out.println(e);
} 
%>



</body>
</html> 