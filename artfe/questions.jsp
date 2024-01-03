<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Open Graph -->
     <meta property="og:type" content="website" />
     <meta property="og:site_name" content="행bti" />
     <meta property="og:title" content="나의 행사 mbti 알아보기" />
     <meta property="og:description" content="나의 행사 mbti 알아보고 관련 행사도 추천 받아보세요!" />
     <meta property="og:image" content="/images/thumbnail.jpg" />
     <meta property="og:url" content="https://prismatic-monstera-4c9d6a.netlify.app/" />

     <!-- Twitter Cards -->
     <meta property="twitter:card" content="summary" />
     <meta property="twitter:site" content="행bti" />
     <meta property="twitter:title" content="나의 행사 mbti 알아보기" />
     <meta property="twitter:description" content="나의 행사 mbti 알아보고 관련 행사도 추천 받아보세요!" />
     <meta property="twitter:image" content="/images/thumbnail.jpg" />
     <meta property="twitter:url" content="https://prismatic-monstera-4c9d6a.netlify.app/" />
    <title>ARTFE</title>
    <link rel="icon" href="favicon.png">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/variable/pretendardvariable-dynamic-subset.css" />
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/questions.css">
    <script type="module" defer src="questions.js"></script>
</head>

<body>
   <div class="progress">
        <div class="value"></div>
   </div>

   <div class="question-box">
        <div class="number"></div>
        <div class="question"></div>
        <div class="btn btn-gray choice choice1"></div>
        <div class="btn btn-gray choice choice2"></div>
		</div>
</body>
<br><br><br><br>



<script>
</script>
   <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>