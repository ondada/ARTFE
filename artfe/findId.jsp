<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">
<link rel="icon" href="images/logo.png">

    <div class="login-form">
 <center>
	<h2><b>아이디 찾기</b></h2>
    <form action="findIdResult.jsp" method=post name="findid">
    <br>
        	  <p style="margin-top:20px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">이름</span><input type="text" id="id" name="name" class="text-field" placeholder = "이름을 입력하세요">	</p>
           
            <p style="margin-top:10px; margin-bottom:20px; font-size:16px; font-weight:500;"><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">휴대폰번호</span><input type="text" onKeyup = "addHypen(this);" name="phone" class="text-field" placeholder = "'-' 없이 입력하세요"></p>
			
                <input type="button" class="okbtn" value="확인" onClick="id_search()" style="cursor:pointer"> 
                
</form>
</center>
	</div>
    <br><br>
  
  <%@include file="footer.jsp" %>
</div>
	<script type="text/javascript">
function addHypen(obj) {
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}

function id_search() { 

	 if (document.findid.name.value == "") 
	{
		alert("이름을 입력하세요. ");
		document.findid.name.focus();
		return false;			
	}			

		 if (document.findid.phone.value.length != 13) {
			  alert("전화번호를 정확하게 입력해주세요");
			  return;
		 }

	 findid.action = "findIdResult.jsp"; //넘어간화면
	 findid.submit();  
	 }
	 </script>

</body>
</html>

