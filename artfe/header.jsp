<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>	
	
<html class="no-js">
<head>
<meta charset="euc-kr">
<meta name="description" content="Blueprint: Slide and Push Menus" />
		<meta name="keywords" content="sliding menu, pushing menu, navigation, responsive, menu, css, jquery" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" user-scaleable="yes" >

<script language="javascript" src="js_package.js"> 
</script>

<script>
function searchSubmit()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.search.keyword.value == "")  {
		alert("검색어를 입력하세요.");
		document.search.keyword.focus();
		return false;			
	}
 
   	document.search.submit();
}

function searchSubmit2()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.search2.keyword2.value == "")  {
		alert("검색어를 입력하세요.");
		document.search2.keyword2.focus();
		return false;			
	}
 
   	document.search2.submit();
}
</script>


<link rel="stylesheet" href="css/header.css">
<link rel="icon" href="images/logo.png">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/variable/pretendardvariable-dynamic-subset.css" />

<title>ARTFE</title>

</head>
<%
	String sid =(String)session.getAttribute("sid");
%>

<body class="cbp-spmenu-push">
<div id="wrap">

<div id="h">
 <header>
     <p id="one"> 
	 <a href="main.jsp">
	 <img src="images/logo.png" width="130px" height="80px" id="oneimg"></a>
	   </p>

  <% if(sid == null) {
	%>
	  <p id="two">
	  <a href="login.jsp">로그인</a>
	  <a href="insert.jsp">회원가입</a>
	  </p>
	<% 
	} else {

	%>

	  <p id="two">
	 <a href="logout.jsp">로그아웃</a>
	  <a href="mpInfoUpdate.jsp">마이페이지</a> 
	  </p>
	  <%
	} 
	  %>
  </header>
	<nav>
<ul class="menu">
    <li style="font-weight:500"><a href="test.jsp">나의 행사 MBTI</a></li>
	<li style="font-weight:500"><a href="hot.jsp">인기행사</a>
	<ul class="submenu">
			<font color="black">
            <li style="margin-top:20px; display:block;"><a href="hot.jsp">이번 달 인기 전시</a></li>
            <li style=" display:block; margin-right:60px; margin-bottom:10px;"><a href="hot_festi.jsp">이번 달 인기 축제</a></li>
			</font>
        </ul>
	</li>
    <li style="font-weight:500"><a href="exhi_art.jsp">전시보기</a>
        <ul class="submenu">


		 <div class="leftmenu">
            <li style="margin-top:20px;"><b><a href="exhi_art.jsp" style="color:#514FF0;">장르별 전시</a></b></li>
			<li style="display:inline-block;"><a href="exhi_art.jsp" style="color:black">회화</a></li> <br>
			<li style="display:inline-block;"><a href="exhi_photo.jsp" style="color:black">사진</a></li> <br>
			<li style="display:inline-block;"><a href="exhi_video.jsp" style="color:black">영상</a></li>
		 </div>

		 <div class="rightmenu">
		 <li style="margin-top:20px;"><b><a href="exhi_1.jsp" style="color:#514FF0;">지역별 전시</a></b></li>
			<li style="display:inline-block;"><a href="exhi_1.jsp" style="color:black">서울/경기/인천</a></li> <br>
			<li style="display:inline-block;"><a href="exhi_2.jsp" style="color:black">대전/세종/충청</a></li> <br>
			<li style="display:inline-block; "><a href="exhi_3.jsp" style="color:black">광주/전라</a></li> <br>
			<li style="display:inline-block; "><a href="exhi_4.jsp" style="color:black">부산/경상</a></li> <br>
		 </div>
        </ul>   
    </li>

    <li style="font-weight:500"><a href="festi_1.jsp">축제보기</a>
        <ul class="submenu">
             <div class="festimenu">
		 <li style="margin-top:20px;"><b><a href="festi_1.jsp" style="color:#514FF0;">지역별 축제</a></b></li>
			<li style="display:inline-block;"><a href="festi_1.jsp" style="color:black">서울/경기/인천</a></li> <br>
			<li style="display:inline-block;"><a href="festi_2.jsp" style="color:black">대전/세종/충청</a></li> <br>
			<li style="display:inline-block; "><a href="festi_3.jsp" style="color:black">광주/전라</a></li> <br>
			<li style="display:inline-block; "><a href="festi_4.jsp" style="color:black">부산/경상</a></li> <br>
		 </div>
        </ul>   
    </li>

    <li style="font-weight:500"><a href="board.jsp">커뮤니티</a>
	<ul class="submenu">
			<font color="black">
            <li style="margin-top:20px; display:block; margin-bottom:-20px;"><a href="board.jsp">커뮤니티</a></li>
            <li style="margin-top:20px; display:block; margin-bottom:-20px;"><a href="notice.jsp">공지사항</a></li>
            <li style="margin-top:20px; display:block; margin-right:80px; margin-bottom:10px;"><a href="faq.jsp">FAQ</a></li>
			</font>
        </ul>  
	</li>

	 <li style="font-weight:500"><a href="event.jsp">이벤트</a> </li>  

	<form method="post"  action="search.jsp" class="search" name="search">
      <input hidden="hidden" /><input type="text" name="keyword" id="searchInput"  placeholder="행사명, 축제명으로 검색해 보세요">
	  <button class="searchclick" type="button" name="searchclick" onclick="searchSubmit()" style="cursor:pointer"><img src="images/search.png" class="searchclick"></button></form>

</ul>
<span class="burger" id="showRight" style="border:2px solid #dedede; background-color:white; border-radius:4px; padding:8px; cursor:pointer; box-sizing: border-box;">
<span><img src="images/burger.jpg" width="20px" height="20px" ></span></span>

<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2" style="box-sizing: border-box;">
			<a href="test.jsp" id="A" style="font-weight:500; font-size:17px; margin-top:10px; margin-bottom:10px;">나의 행사 MBTI</a>
			
			<a href="hot.jsp" id="A" style="font-weight:500; font-size:17px; margin-top:12px;">인기행사</a>
			<a href="hot.jsp"  id="B" style="font-size:16px; margin-left:20px; ">이번 달 인기 전시</a>
			<a href="hot_festi.jsp"  id="B" style="font-size:16px; margin-left:20px; ">이번 달 인기 축제</a>

			  <a href="exhi_art.jsp" id="A" style="font-weight:500; font-size:17px; margin-top:12px;">전시보기</a>
				<a href="exhi_art.jsp"  id="B" style="font-size:16px; margin-left:20px; ">장르별 전시</a>
				<a href="exhi_1.jsp"  id="B" style="font-size:16px; margin-left:20px; ">지역별 전시</a>
				

			 <a href="festi_1.jsp.jsp" id="A" style="font-weight:500; font-size:17px; margin-top:12px;">축제보기</a>
				<a href="festi_1.jsp" id="B"  style="font-size:16px; margin-left:20px; ">지역별 축제</a>

			<a href="board.jsp" id="A" style="font-weight:500; font-size:17px; margin-top:12px;">커뮤니티</a>
			<a href="board.jsp"  id="B" style="font-size:16px; margin-left:20px;">커뮤니티</a>
			<a href="notice.jsp"  id="B" style="font-size:16px; margin-left:20px;">공지사항</a>
			<a href="faq.jsp"  id="B" style="font-size:16px; margin-left:20px; ">FAQ</a>

			 <a href="event.jsp" id="A" style="font-weight:500; font-size:17px; margin-top:12px;">이벤트</a>
		</nav>

			<div class="main">
				<section>
					<!-- Class "cbp-spmenu-open" gets applied to menu -->
					<button id="showLeft" style="display:none;"></button>
					<button id=""style="display:none;"></button>
				</section>
				
			</div>
		

  </nav>
<script src="js/classie.js"></script>
<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				menuRight = document.getElementById( 'cbp-spmenu-s2' ),
				menuTop = document.getElementById( 'cbp-spmenu-s3' ),
				menuBottom = document.getElementById( 'cbp-spmenu-s4' ),
				showLeft = document.getElementById( 'showLeft' ),
				showRight = document.getElementById( 'showRight' ),
				showTop = document.getElementById( 'showTop' ),
				showBottom = document.getElementById( 'showBottom' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				showRightPush = document.getElementById( 'showRightPush' ),
				body = document.body;

			showLeft.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeft' );
			};
			showRight.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( menuRight, 'cbp-spmenu-open' );
				disableOther( 'showRight' );
			};
			showTop.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( menuTop, 'cbp-spmenu-open' );
				disableOther( 'showTop' );
			};
			showBottom.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( menuBottom, 'cbp-spmenu-open' );
				disableOther( 'showBottom' );
			};
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			showRightPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toleft' );
				classie.toggle( menuRight, 'cbp-spmenu-open' );
				disableOther( 'showRightPush' );
			};

			function disableOther( button ) {
				if( button !== 'showLeft' ) {
					classie.toggle( showLeft, 'disabled' );
				}
				if( button !== 'showRight' ) {
					classie.toggle( showRight, 'disabled' );
				}
				if( button !== 'showTop' ) {
					classie.toggle( showTop, 'disabled' );
				}
				if( button !== 'showBottom' ) {
					classie.toggle( showBottom, 'disabled' );
				}
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
				if( button !== 'showRightPush' ) {
					classie.toggle( showRightPush, 'disabled' );
				}
			}
		</script>
  <hr id="hr1">
</div>