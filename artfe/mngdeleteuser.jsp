<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<html><head><title>ARTFE</title>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/deleteuser.css">
<link rel="icon" href="images/logo.png">

</head>
<body>
<%
	try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


     //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺��� ��ȸ��
	 String key = request.getParameter("id");   
	 String jsql = "select * from user where u_id = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);


  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String id = rs.getString("u_id");
   	 String pw = rs.getString("u_pw");
	 String name = rs.getString("u_name");
	 Date birth = rs.getDate("u_birth");
	 String address = rs.getString("u_address");
	 String phone = rs.getString("u_phone");
	 String email = rs.getString("u_email");
%>
<div id="wrap">
	<div class="userform">
    <form action="mngdeleteuserResult.jsp" method=post name="login">
	<center>
	<h2><b>������ ȸ�������� �����Ͻðڽ��ϱ�?</b></h2>
    <br>
    <br><br><br>
	
	<div class="usertb">
	<table width="1000" height="100" cellpadding="50" style="">
	<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:20px; font-weight:500;"><b>���̵�</b></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:20px; font-weight:500;"><b>��й�ȣ</b></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:	20px; font-weight:500;"><b>�̸�</b></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:20px; font-weight:500;"><b>�������</b></td>	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:20px; font-weight:500;"><b>�޴�����ȣ</b></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:20px; font-weight:500;"><b>�ּ�</b></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:20px; font-weight:500;"><b>�̸���</b></td>
	</tr>	

     <tr>                     <!--  �������� ��Ÿ�� ������ ��ũ�κп� ȸ�� ���̵� �Բ� �Ѱ��� -->
 	  <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"><%=pw%></td>
	  <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"><%=name%></td>
	  <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"><%=birth%></td>
	  <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"><%=phone%></td>
 	  <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"><%=address%></td> 
	  <td align=center style="padding-top: 20px; padding:20px 0px; font-weight:400; border-bottom:1px solid #dedede;"><%=email%></td> 
  </tr>
</table>
</div>
<br><br>

 <a href="mngdeleteuserResult.jsp?id=<%=id%>"><input type="button" class="userdelete" value="ȸ�� ����" onClick="checkValue()" style="cursor:pointer"></a> &nbsp;&nbsp;
  <a href="allUser.jsp"><input type="reset" class="userdeleteno" value="���" onClick="location.href='allUser.jsp'" style="cursor:pointer"> </a>
  <br><br><br><br>
  <br><br>
  </center>
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