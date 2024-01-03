<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/login.css">

<body>
  <div class="login-form">
    <form action="loginOk.jsp" method=post name="login">
    <center><h2><b>로그인</b></h2></center>
    <br>
        	<p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>아이디</b></p>
            <input type="text" id="id" name="id" class="text-field" placeholder="아이디를 입력해 주세요" style="margin-bottom:16px; border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;">	<br>
            <p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>비밀번호</b></p>
            <input type="password" id="password" name="pw" class="text-field" placeholder="비밀번호를 입력해 주세요" onkeydown="onEnterSubmit()"style="border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
                <div class="links">
		<font color="gray" style="font-size:15px">
            <a href="findId.jsp" style="font-size:15px; color:gray;">아이디 찾기</a> &nbsp|&nbsp <a href="findPw.jsp"  style="font-size:15px; color:gray;">비밀번호 찾기</a>
			</font></div><br>
				<input type="button" class="submit-btn" value="로그인" style="margin-top:10px; font-size:16px; font-family: Pretendard Variable, sans-serif; cursor:pointer;" onClick="checkValue()" > <br>
				 <a href="insert.jsp" style><input type="button" class="submit-btn" value="회원가입" style="font-size:16px; background-color:white; color:#514FF0; border:1px solid #514FF0; border-radius: 5px; font-family: Pretendard Variable, sans-serif; cursor:pointer;"> </a>

</form>
        
</div>
  


    <br><br>

  <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>

<script type="text/javascript">

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.login.id.value == "") 
	{
		alert("아이디가 입력되지 않았습니다.");
		document.login.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("비밀번호가 입력되지 않았습니다.");
		document.login.pw.focus();
		return false;			
	}

			login.submit();
}

	</script>

</body>
</html>