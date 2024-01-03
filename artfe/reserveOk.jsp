<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="stylesheet" href="css/reserveOk.css">
<link rel="icon" href="images/logo.png">
</head>
<%
	String sid =(String)session.getAttribute("sid");
%>
<body>
<div id="wrap">
  <header>
     <p id="one"> 
	 <a href="main.jsp">
	<img src="images/logo.png" width="120px" height="90px"></a></p>

	<% if(sid == null) {
	%>
	  <p id="two"> 
	  <a href="login.jsp">Login</a>
	  <a href="insert.jsp">Sign Up</a>
	  </p>
	<% 
	} else {

	%>

	  <p id="two">
	  <a href="logout.jsp">Logout</a>
	  <a href="mpInfoUpdate.jsp">Mypage</a> 
	  </p>
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
      <input type="text" placeholder="검색어 입력"><a href="#"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" style="border-radius: 10px;"></a>
      </span>
</ul>

    </ul>
  </nav>
  
<%

	request.setCharacterEncoding("euc-kr");

	String e_name = request.getParameter("e_name");
	int total = Integer.parseInt(request.getParameter("e_price"));
	String e_no = request.getParameter("e_no");
	String e_term = request.getParameter("e_term");
	String e_place = request.getParameter("e_place");
	String e_time = request.getParameter("e_time");
	
	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String jsql = "insert into bookpd  (e_name, e_price, e_term, e_place, e_time, e_no)  VALUES  (?, ?, ?, ?, ?, ?)"; 

	PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1,e_name);    
	pstmt.setInt(2,total);
	pstmt.setString(3,e_term); 
	pstmt.setString(4,e_place); 
	pstmt.setString(5,e_time);
	pstmt.setString(6,e_no);

     pstmt.executeUpdate();
%>

  <br>
  <h1><b>예매완료</b></h1>
  <br>
  <hr>
	<form action="main.jsp">
    <center>
    <br><br><br><br>
    <h2><b>예매가 완료되었습니다.</b></h2>
    <br><br><br>
	<div id="box">
	<table style="float:left; margin-left:15%; margin-right:100px; margin-top:35px;">
	<tr>
	<th style="font-size: 20px; color:gray; padding:10px;">행사명</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px;"><%=e_name%></td>
	<td></td>
	</tr>
	<tr>
	<th style="font-size: 20px; color:gray; padding:10px">행사기간</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px;"><%=e_term%></td>
	</tr>
	<th style="font-size: 20px; color:gray; padding:10px">회차</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px;"><%=e_time%></td>
	</tr>
	<tr>
	<th style="font-size: 20px; color:gray; padding:10px; margin-top:30px;">결제금액</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px; color:#514FF0"><%=total%>원</td>
	</tr>
	</table>
	<span id="section" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></span>
	</div>
	<br><br>

	

    <input type="button" class="mainbtn" value="예매내역 보기" onClick="location.href='mpbookinfo.jsp'" style="cursor:pointer"> 
    <br><br>
    </center>
</form>
      
       
  
  <br><br><br>
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
</center>
</body>
</html>