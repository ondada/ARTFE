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
						<h6><a href="notice.jsp" style="color:#c7c7c7">공지사항</a><span> | </span><a href="faq.jsp" style="color:#c7c7c7">FAQ</a><span> | </span>
						<a href="policy.jsp" style="color:#c7c7c7">개인정보처리방침</a></h6></p>
						<hr style="width:70%; margin:auto; background:#353C46;"><br><br>
                        <div class="hr"></div>
                        <h6>경기도 성남시 분당구 정자일로 95 아트페 1784 우)13561</h6>
                        <h6>고객센터 : 02-6550-5935</h6>
						<h6>
(주)아트페<span>|</span>통신판매업 신고번호 1123-1118-0128
대표 투영온<span>|</span>개인정보책임자 투영온<span>|</span>

<% if(mid == null) 
		{
	%>
	<a href="mnglogin.jsp">관리자 로그인</a>
	<% 
		} else {

	%>
	<a href="logout.jsp">관리자 로그아웃</a><span>|</span>

	<a href="allUser.jsp">관리자 옵션</a>
	<%
		}
	%>
						</h6><br>
                    </div>
                </div>
            </div>
        </div>
		<div class="copyright">
        <p style="position:relative"><a href="main.jsp">Copyright ⓒ 2023 <img src="images/logo.png" class="footerlogo" style="position:relative; top:8px;"> All Rights Reserved.</a></p>
		</div>
    </div>
  </html>
