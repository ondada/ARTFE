<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>


<link rel="stylesheet" href="css/login.css">
  
  <div class="login-form">
    <form action="mngloginOk.jsp" method=post name="mnglogin">
     <center><h2><b>관리자 로그인</b></h2></center>
<br>
        	<p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>아이디</b></p>
            <input type="text" id="id" name="id" class="text-field" placeholder="아이디를 입력해 주세요" style="margin-bottom:16px; border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;">	<br>
            <p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>비밀번호</b></p>
            <input type="password" id="password" name="pw" class="text-field" placeholder="비밀번호를 입력해 주세요" onkeydown="onEnterSubmit()"style="margin-bottom:16px; border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
                <input type="button" class="submit-btn" value="로그인" onClick="checkValue()" style="cursor:pointer; font-size:16px; font-family: Pretendard Variable, sans-serif;"> 
</form>
</div>
  

  
  <br><br><br><br>
  


<script type="text/javascript">

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.mnglogin.id.value == "") 
	{
		alert("아이디를 입력해주세요. ");
		document.mnglogin.id.focus();
		return false;			
	}			

	if (document.mnglogin.pw.value == "") 
	{
		alert("비밀번호를 입력해주세요. ");
		document.mnglogin.pw.focus();
		return false;			
	}

			mnglogin.submit();
}

	</script>
   <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>