<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">
<link rel="icon" href="images/logo.png">
</head>

 <div class="login-form">
 <center>
	<h2><b>��й�ȣ ã��</b></h2>
    <form action="findPwResult.jsp" name="findpw" method=post>
<br>
				<p style="margin-top:20px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">�̸�</span>
            <input type="text" id="name" name="name" class="text-field" placeholder = "�̸��� �Է��ϼ���">	</p>
    		  <p style="margin-top:10px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">���̵�</span>
            <input type="text" id="id" name="id" class="text-field" placeholder = "���̵� �Է��ϼ���">	</p>
            <p style="margin-top:10px;margin-bottom:20px; font-size:16px; font-weight:500; "><span style="display:inline-block; width:20%; margin-right:20px; text-align:center;">�̸���</span>
            <input type="text" id="email" name="email" class="text-field" placeholder = "��) example@artfe.com"></p>

                <input type="button" class="okbtn" value="Ȯ��" onClick="pw_search()" style="cursor:pointer"> 
                
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
			alert("���̵� �Է��ϼ���. ");
			document.findpw.id.focus();
			return false;			
		}			

   if (document.findpw.name.value  == "") {
			  alert("�̸��� ��Ȯ�ϰ� �Է����ּ���");
			  document.findpw.name.focus();
			  return false;
		 }

	 if (document.findpw.email.value == "") {
		  alert("�̸����� ��Ȯ�ϰ� �Է����ּ���");
		  document.findpw.email.focus();
		  return false;
	 }
	
  findpw.action="findPwResult.jsp"; //�Ѿȭ��
  findpw.submit(); //����� �ɼ� �ִ� �����̸�, ������ �����ڴ�.
  }
	 </script>

</body>
</html>
