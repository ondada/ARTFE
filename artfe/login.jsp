<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/login.css">

<body>
  <div class="login-form">
    <form action="loginOk.jsp" method=post name="login">
    <center><h2><b>�α���</b></h2></center>
    <br>
        	<p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>���̵�</b></p>
            <input type="text" id="id" name="id" class="text-field" placeholder="���̵� �Է��� �ּ���" style="margin-bottom:16px; border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;">	<br>
            <p style="margin-bottom:10px; font-size:16px; font-weight:500;"><b>��й�ȣ</b></p>
            <input type="password" id="password" name="pw" class="text-field" placeholder="��й�ȣ�� �Է��� �ּ���" onkeydown="onEnterSubmit()"style="border:1px solid #dedede; width:400px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
                <div class="links">
		<font color="gray" style="font-size:15px">
            <a href="findId.jsp" style="font-size:15px; color:gray;">���̵� ã��</a> &nbsp|&nbsp <a href="findPw.jsp"  style="font-size:15px; color:gray;">��й�ȣ ã��</a>
			</font></div><br>
				<input type="button" class="submit-btn" value="�α���" style="margin-top:10px; font-size:16px; font-family: Pretendard Variable, sans-serif; cursor:pointer;" onClick="checkValue()" > <br>
				 <a href="insert.jsp" style><input type="button" class="submit-btn" value="ȸ������" style="font-size:16px; background-color:white; color:#514FF0; border:1px solid #514FF0; border-radius: 5px; font-family: Pretendard Variable, sans-serif; cursor:pointer;"> </a>

</form>
        
</div>
  


    <br><br>

  <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>

<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.login.id.value == "") 
	{
		alert("���̵� �Էµ��� �ʾҽ��ϴ�.");
		document.login.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("��й�ȣ�� �Էµ��� �ʾҽ��ϴ�.");
		document.login.pw.focus();
		return false;			
	}

			login.submit();
}

	</script>

</body>
</html>