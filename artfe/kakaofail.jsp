<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/kakaofail.css">
<link rel="icon" href="images/logo.png">

</head>

<body>
<div id="wrap">
	<form action="main.jsp">
    <center>
    <h1><b>������ ����Ͽ����ϴ�.</b></h1>
    <br><br><br><br>
    <input type="button" class="mainbtn" value="���ư���" onClick="back()" style="cursor:pointer"> 
    <br><br><br><br><br><br><br>
    </center>
</form>
      
       
  
  <br><br><br>

</div>
</center>


<script>

function back()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�

	{
		history.go(-3);
	}			

</script>
  <%@include file="footer.jsp" %>
</body>
</html>