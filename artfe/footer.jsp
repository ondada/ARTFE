<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>	
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"> </head>

<%
	String mid =(String)session.getAttribute("mid");
%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="css/footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;600;800&display=swap" rel="stylesheet">
<body>
    
</body>
</html>
<meta charset="euc-kr">
<title>ARTFE</title>
</head>
<body>
<div class="contact-area" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="contact-content text-center">
                        <p style="color:white;">Art & Festival ARTFE
						<h6><a href="notice.jsp" style="color:#c7c7c7">��������</a><span> | </span><a href="faq.jsp" style="color:#c7c7c7">FAQ</a><span> | </span>
						<a href="policy.jsp" style="color:#c7c7c7">��������ó����ħ</a></h6></p>
						<hr style="width:70%; margin:auto; background:#353C46;"><br><br>
                        <div class="hr"></div>
                        <h6>��⵵ ������ �д籸 �����Ϸ� 95 ��Ʈ�� 1784 ��)13561</h6>
                        <h6>������ : 02-6550-5935</h6>
						<h6>
(��)��Ʈ��<span>|</span>����Ǹž� �Ű��ȣ 1123-1118-0128
��ǥ ������<span>|</span>��������å���� ������<span>|</span>

<% if(mid == null) 
		{
	%>
	<a href="mnglogin.jsp">������ �α���</a>
	<% 
		} else {

	%>
	<a href="logout.jsp">������ �α׾ƿ�</a><span>|</span>

	<a href="allUser.jsp">������ �ɼ�</a>
	<%
		}
	%>
						</h6><br>
                    </div>
                </div>
            </div>
        </div>
		<div class="copyright">
        <p style="position:relative"><a href="main.jsp">Copyright �� 2023 <img src="images/logo.png" class="footerlogo" style="position:relative; top:8px;"> All Rights Reserved.</a></p>
		</div>
    </div>
  </html>
