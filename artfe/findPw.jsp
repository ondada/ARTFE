<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">
<link rel="icon" href="images/logo.png">
</head>

 <div class="login-form">
 <center>
	<h2><b>비밀번호 찾기</b></h2>
    <form action="findPwResult.jsp" name="findpw" method=post>
<br>
				<p style="margin-top:20px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">이름</span>
            <input type="text" id="name" name="name" class="text-field" placeholder = "이름을 입력하세요">	</p>
    		  <p style="margin-top:10px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">아이디</span>
            <input type="text" id="id" name="id" class="text-field" placeholder = "아이디를 입력하세요">	</p>
            <p style="margin-top:10px;margin-bottom:20px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">이메일</span>
            <input type="text" id="email" name="email" class="text-field" placeholder = "예) example@artfe.com"></p>

                <input type="button" class="okbtn" value="확인" onClick="pw_search()" style="cursor:pointer"> 
                
</form>
	</div>
    <br><br>
    </center></div>
	<%@include file="footer.jsp" %>
  
</div>
</center>

	<script type="text/javascript">

function pw_search(){

	  if (document.findpw.id.value == "") 
		{
			alert("아이디를 입력하세요. ");
			document.findpw.id.focus();
			return false;			
		}			

   if (document.findpw.name.value  == "") {
			  alert("이름을 정확하게 입력해주세요");
			  document.findpw.name.focus();
			  return false;
		 }

	 if (document.findpw.email.value == "") {
		  alert("이메일을 정확하게 입력해주세요");
		  document.findpw.email.focus();
		  return false;
	 }
	
  findpw.action="findPwResult.jsp"; //넘어간화면
  findpw.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
  }
	 </script>

</body>
</html>
