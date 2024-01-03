<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
 <%@include file="header.jsp" %>
<html>
<head>

<title>ARTFE</title>

<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="css/insertOk.css">
</head>

<body>
<%

	try {
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String	pw = request.getParameter("pw");
	String	name = request.getParameter("name");

	String YY = request.getParameter("YY");
	String MM = request.getParameter("MM");
	String DD = request.getParameter("DD");
	String birth = YY + "-" + MM + "-" + DD;

	String address = request.getParameter("address");

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;	
	
	String	email = request.getParameter("email");

 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update user set u_pw=?, u_name=?, ";
	 jsql = jsql + "u_birth=?, u_address=?, u_phone=?, ";
	 jsql = jsql + "u_email=? where u_id=? ";

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,pw);
	 pstmt.setString(2,name);
	 pstmt.setString(3,birth);
	 pstmt.setString(4,address);
	 pstmt.setString(5,phone);
	 pstmt.setString(6,email);
	 pstmt.setString(7,id);

	 pstmt.executeUpdate();


     //  �� ���� �κ� ������ DB�� ������Ų �ش� ���ڵ������� ��ȸ�� ��, 
	 //  �ش� ������ ���������� ������ִ� �ڵ忡 �ش��
	 String jsql2 = "select * from user where u_id=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()�Լ��� ó�� �����ϸ�, ù��° ���ڵ�(��, ������Ų ���ڵ�)�� ����Ű�� ��

	
%>

  <div class="login-form2">
    <form action="loginOk.jsp" method=post name="login">
<center><br>
     <p style="font-size:24px;"><b>ȸ������ ������ �Ϸ�Ǿ����ϴ�.</b></p>
    <br><br>
	<div class="usertb" style="width:600px; margin:10px auto;">

 <table>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">���̵�</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_id")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">��й�ȣ</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_pw")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_name")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�������</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_birth")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">��ȭ��ȣ</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_phone")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�ּ�</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_address")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�̸���</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_email")%></td>
		</tr>
		
  </tr>
</table>
</div>

<br><br>

     <input type="button" class="mainbtn2" value="ȸ������Ȯ��" onClick="location.href='allUser.jsp'" style="cursor:pointer"> 
  
</center>
</form>
  
  <br><br><br><br>
</div>

<%@include file="footer.jsp" %>
<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.login.id.value == "") 
	{
		alert("���̵� �Է����ּ���. ");
		document.login.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���. ");
		document.login.pw.focus();
		return false;			
	}

			login.submit();
}

	</script>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>