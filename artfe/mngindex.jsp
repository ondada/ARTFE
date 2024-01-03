<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>



<link rel="stylesheet" href="css/login.css">
  
  <div class="login-form">
    <form action="loginOk.jsp" method=post name="login">
    <h2><b>관리자 옵션</b></h2>
    <br><br><br>
	<div class="mngmode" align="center">
	<a href="allUser.jsp"><font color="#514FF0" style="font-size:20px; font-weight:500;" >회원정보관리</font></a><br><br><br>
	<a href="allEvent.jsp"><font color="#514FF0" style="font-size:20px; font-weight:500;">행사상품 정보관리</font></a><br><br><br>
	<a href="allTicket.jsp"><font color="#514FF0" style="font-size:20px; font-weight:500;">예매정보관리</font></a><br><br><br><br><br>
	<a href="logout.jsp"><font color="gray" style="font-size:18px; font-weight:500;">관리자 로그아웃</font></a><br><br><br><br>
</div>
</form></div>
  

  
  <br><br>


<script type="text/javascript">

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.login.id.value == "") 
	{
		alert("아이디를 입력해주세요. ");
		document.insert.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("비밀번호를 입력해주세요. ");
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