<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>


<link rel="stylesheet" href="css/login.css">
  
  <div class="login-form">
    <form action="mngloginOk.jsp" method=post name="mnglogin">
     <center><h2><b>������ �α���</b></h2></center>
<br>
        	<p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>���̵�</b></p>
            <input type="text" id="id" name="id" class="text-field" placeholder="���̵� �Է��� �ּ���" style="margin-bottom:16px; border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;">	<br>
            <p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>��й�ȣ</b></p>
            <input type="password" id="password" name="pw" class="text-field" placeholder="��й�ȣ�� �Է��� �ּ���" onkeydown="onEnterSubmit()"style="margin-bottom:16px; border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
                <input type="button" class="submit-btn" value="�α���" onClick="checkValue()" style="cursor:pointer; font-size:16px; font-family: Pretendard Variable, sans-serif;"> 
</form>
</div>
  

  
  <br><br><br><br>
  


<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.mnglogin.id.value == "") 
	{
		alert("���̵� �Է����ּ���. ");
		document.mnglogin.id.focus();
		return false;			
	}			

	if (document.mnglogin.pw.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���. ");
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