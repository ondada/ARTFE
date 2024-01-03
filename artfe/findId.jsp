<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">
<link rel="icon" href="images/logo.png">

    <div class="login-form">
 <center>
	<h2><b>���̵� ã��</b></h2>
    <form action="findIdResult.jsp" method=post name="findid">
    <br>
        	  <p style="margin-top:20px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">�̸�</span><input type="text" id="id" name="name" class="text-field" placeholder = "�̸��� �Է��ϼ���">	</p>
           
            <p style="margin-top:10px; margin-bottom:20px; font-size:16px; font-weight:500;"><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">�޴�����ȣ</span><input type="text" onKeyup = "addHypen(this);" name="phone" class="text-field" placeholder = "'-' ���� �Է��ϼ���"></p>
			
                <input type="button" class="okbtn" value="Ȯ��" onClick="id_search()" style="cursor:pointer"> 
                
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
		alert("�̸��� �Է��ϼ���. ");
		document.findid.name.focus();
		return false;			
	}			

		 if (document.findid.phone.value.length != 13) {
			  alert("��ȭ��ȣ�� ��Ȯ�ϰ� �Է����ּ���");
			  return;
		 }

	 findid.action = "findIdResult.jsp"; //�Ѿȭ��
	 findid.submit();  
	 }
	 </script>

</body>
</html>

