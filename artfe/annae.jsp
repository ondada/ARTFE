<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>
<link rel="stylesheet" href="css/annae.css">
<link rel="icon" href="images/logo.png">
</head>
<%
	String sid =(String)session.getAttribute("sid");
%>
<body>
<div id="wrap">
  <header>
  <p> <a href="main.jsp"><h2>LOGO</h2></a>

	<% if(sid == null) {
	%>
	  <a href="insert.jsp">Sign Up</a> 
	  <a href="login.jsp">Login</a>
	<% 
	} else {

	%>

	  <a href="mpInfoUpdate.jsp">Mypage</a> 
	  <a href="logout.jsp">Logout</a>
	  <%
	}
		  %>
	<div class="search">
	  </div>
  </header>
	
<nav>
<ul class="menu">
    <li><a href="hot.jsp">HOT</a>
	<ul class="submenu">
            <li><a href="hot.jsp">전시</li>
            <li><a href="hot_festi.jsp">축제</li>
        </ul>
	</li>
    <li><a href="exhi_ing.jsp">전시</a>
        <ul class="submenu">
            <li><a href="exhi_ing.jsp">진행중</a></li>
            <li><a href="exhi_coming.jsp">예정</a></li>
            <li><a href="exhi_end.jsp">종료</a></li>
        </ul>   
    </li>
    <li>
        <a href="festi_ing.jsp">축제</a>
        <ul class="submenu">
            <li><a href="festi_ing.jsp">진행중</a></li>
            <li><a href="festi_coming.jsp">예정</a></li>
            <li><a href="festi_end.jsp">종료</a></li>
        </ul>   
    </li>
    <li><a href="board.jsp">커뮤니티</a>
	<ul class="submenu">
            <li><a href="board.jsp">게시판</a></li>
            <li><a href="notice.jsp">공지사항</a></li>
            <li><a href="faq.jsp">FAQ</a></li>
        </ul>  
	</li>
    <li><a href="event.jsp">이벤트</a></li>      
	<span class="search">
      <input type="text" placeholder="검색어 입력"><a href="#"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></a>
      </span>
</ul>

    </ul>
  </nav>
	
  <br>

<center>
 <div id="content">
<div id="section1"></div>
			
		<div id="sec-content1">
		  <h2>장 줄리앙</h2>
		  <h3>2022.10.01 ~ 2022.10.27</h3>
		  <p>장소: DDP배움터 디자인전시관(B2F)</p>
		  <h4 style="color:red">20,000원</h4>
		  <br>
		  <p> <input type="button" class="mainbtn" value="예매하기"><input type="button" class="mainbtn2" value="관심등록"> </p>
				
    </div>
</div>
<br><br><br>
  <hr><br>
            <a href="sangse.jsp">상세정보</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a style="color:#514FF0">이용안내</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="buga.jsp">부가정보</a><br><br></center>
<hr><br><br><div id="sec-content2">

<font-size:2em;>이용안내</font><br><br><br>
<font-size:5em;>공연시간 정보<br>- 월~일 10:00~20:00<p>- 매표 및 입장 관람 종료 1시간 전 마감<br><br>공지사항<p>관람객이 많을 경우 대기번호표를 시행합니다.<p>대기번호 운영시 예매하신 경우에도 대기번호를 받으셔야 합니다. </font></div>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
   <footer>
	<div>
	<h6>ⓒARTFE</h6>
<%
	String mid =(String)session.getAttribute("mid");
%>
	<% if(mid == null) 
		{
	%>
	<a href="mnglogin.jsp">관리자 로그인</a>
	<% 
		} else {

	%>
	<a href="logout.jsp">관리자 로그아웃</a>
	<a href="mngindex.jsp">관리</a>
	<%
		}
	%>
	<a href="policy.jsp">개인정보처리방침 및 약관</a>
	&nbsp;
	<a href="faq.jsp">FAQ</a>
	 &nbsp;
	</div>
  </footer>
</div>
</body>
</html>