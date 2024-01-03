<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>주문 완료</title></head>
<body>
<center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  //  접속 DB는 project
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //  세션번호를 가져옴
	// String caseNo = request.getParameter("case");

	String jsql = "delete from tempcart where ctNo=?";    //  tempcart 테이블을 사용함에 유의!
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	
    pstmt.executeUpdate();
%>

<br><br>
<font size=6 color=blue><b>[상품 주문 완료]</b></font><p>
	상품 주문이 완료되었습니다.<br><br>
	주문하신 상품은 주문 완료 후 2일 이내에 배송될 예정입니다.<br><br>
	남서울 멀티쇼핑몰(주)을 이용해 주셔서 감사합니다!

<%
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>