<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>



<link rel="stylesheet" href="css/login.css">
  
  <div class="login-form">
    <form action="loginOk.jsp" method=post name="login">
    <h2><b>������ �ɼ�</b></h2>
    <br><br><br>
	<div class="mngmode" align="center">
	<a href="allUser.jsp"><font color="#514FF0" style="font-size:20px; font-weight:500;" >ȸ����������</font></a><br><br><br>
	<a href="allEvent.jsp"><font color="#514FF0" style="font-size:20px; font-weight:500;">����ǰ ��������</font></a><br><br><br>
	<a href="allTicket.jsp"><font color="#514FF0" style="font-size:20px; font-weight:500;">������������</font></a><br><br><br><br><br>
	<a href="logout.jsp"><font color="gray" style="font-size:18px; font-weight:500;">������ �α׾ƿ�</font></a><br><br><br><br>
</div>
</form></div>
  

  
  <br><br>


<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.login.id.value == "") 
	{
		alert("���̵� �Է����ּ���. ");
		document.insert.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���. ");
		document.insert.pw.focus();
		return false;			
	}

			login.submit();
}

	</script>

  <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>