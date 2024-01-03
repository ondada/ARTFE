<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="css/insertOk.css">
</head>

<body>
<%

	try {
	request.setCharacterEncoding("euc-kr");



	String bNo = request.getParameter("bNo");
	String	u_id = request.getParameter("u_id");
	String	r_date = request.getParameter("r_date");
	String r_name = request.getParameter("r_name");
	String b_time = request.getParameter("b_time");
	String b_date = request.getParameter("b_date");

	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String r_address = address1 + " " + address2 +  " " +address3;

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String	r_phone = phone1 + "-"+ phone2 + "-" + phone3;



 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 

 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update bookinfo set u_id=?, ";
	 jsql = jsql + "r_date=?, r_name=?, b_time=?, b_date=?, ";
	 jsql = jsql + "r_address=?, r_phone=? where bNo=? ";

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,u_id);
	 pstmt.setString(2,r_date);
	 pstmt.setString(3,r_name);
	 pstmt.setString(4,b_time);
	 pstmt.setString(5,b_date);
	 pstmt.setString(6,r_address);
	 pstmt.setString(7,r_phone);
	 pstmt.setString(8,bNo);

	 pstmt.executeUpdate();


     //  이 이후 부분 내용은 DB상에 수정시킨 해당 레코드정보를 조회한 후, 
	 //  해당 내용을 웹브라우저로 출력해주는 코드에 해당됨
	 String jsql2 = "select * from bookinfo where bNo=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,bNo);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()함수를 처음 수행하면, 첫번째 레코드(즉, 수정시킨 레코드)를 가리키게 됨

	
%>

  
  <div class="userform">
    <form action="loginOk.jsp" method=post name="login">
<center><br>
     <p style="font-size:24px;"><b>예매정보 수정이 완료되었습니다.</b></p>
    <br><br>
		<div class="usertb" style="width:600px; margin:10px auto;">
	<table>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">예매번호</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("bNo")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">아이디</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_id")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">예매자명</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_name")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">예매일</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_date")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">관람일</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("b_date")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">선택회차</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("b_time")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">배송지</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_address")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">휴대전화</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_phone")%></td>
		</tr>
		
  </tr>
</table>
</div>
<br><br>

     <input type="button" class="mainbtn2" value="예매정보확인" onClick="location.href='allTicket.jsp'" style="cursor:pointer"> 
</center>
  

</form>
  
  <br><br><br><br>
  

</div>



<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div><%@include file="footer.jsp" %>
</body>
</html>