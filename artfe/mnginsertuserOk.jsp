<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="stylesheet" href="css/insertOk.css">
<link rel="icon" href="images/logo.png">

</head>

<body>
  
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");            //  로그인폼(login.jsp)에서 입력한 ID를 넘겨받음

    String pw = request.getParameter("pw");
	String pw2 = request.getParameter("pw2");

	String name = request.getParameter("name");

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String	phone = phone1 + "-"+ phone2 + "-" + phone3;

	String	YY = request.getParameter("YY");
	String	MM = request.getParameter("MM");
	String	DD = request.getParameter("DD");
	String	birth = YY + "-" +MM + "-" + DD;

	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String address = address1 + " " + address2 +  " " +address3;

	String email = request.getParameter("email");


		

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO user (u_id, u_pw, u_name, u_birth,";
	 jsql = jsql + "u_phone, u_address, u_email) VALUES (?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,pw);
	 pstmt.setString(3,name);
	 pstmt.setString(4,birth);
	 pstmt.setString(5,phone);
	 pstmt.setString(6,address);
	 pstmt.setString(7,email);

	 pstmt.executeUpdate();
  } catch(Exception e) { 
		out.println(e);
}


	
%>




 <div class="login-form2">
	<form action="main.jsp">
    <center><br>
  <p style="font-size:24px;"><b>회원 등록이 완료되었습니다.</b></p>

    <br><br>
<table>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">아이디</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=id%></td></tr>

		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">비밀번호</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=pw%></td></tr>

		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">이름</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;" ><%=name%></td></tr>

		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">생년월일</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;" ><%=birth%></td></tr>

		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">휴대폰번호</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;" ><%=phone%></td></tr>
	
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">주소</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;" ><%=address%></td></tr>

		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">이메일</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;" ><%=email%></td></tr>
</table>
<br><br>
<input type="button" class="mainbtn2" value="회원정보확인" onClick="location.href='allUser.jsp'" style="cursor:pointer"> 
    </center>
</form>
      
       
  
  <br><br>
 
</div>
</center>
</div><%@include file="footer.jsp" %>
</body>
</html>