<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
  <%@include file="header.jsp" %>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Open Graph -->
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="��bti" />
    <meta property="og:title" content="���� ��� mbti �˾ƺ���" />
    <meta property="og:description" content="���� ��� mbti �˾ƺ��� ���� ��絵 ��õ �޾ƺ�����!" />
    <meta property="og:image" content=/images/thumbnail.jpg" />
    <meta property="og:url" content="https://prismatic-monstera-4c9d6a.netlify.app/" />

    <!-- Twitter Cards -->
    <meta property="twitter:card" content="summary" />
    <meta property="twitter:site" content="��bti" />
    <meta property="twitter:title" content="���� ��� mbti �˾ƺ���" />
    <meta property="twitter:description" content="���� ��� mbti �˾ƺ��� ���� ��絵 ��õ �޾ƺ�����!" />
    <meta property="twitter:image" content="/images/thumbnail.jpg" />
    <meta property="twitter:url" content="https://prismatic-monstera-4c9d6a.netlify.app/" />
    <title>ARTFE</title>
    <link rel="icon" href="favicon.png">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/variable/pretendardvariable-dynamic-subset.css" />
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/results.css">
	<link rel="stylesheet" href="css/header.css">
    <script defer src="share.js"></script>
    <script type="module" defer src="results.js"></script>
</head>

<body>
<br><br>
   <h2 class="page-subtitle">
    ���� ���	MBTI��!?
   </h2>

   <h1 class="page-title">
    
   </h1>

   <img src="" alt="ĳ����" class="character">

   <div class="result">
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
   </div>
   <div class="result">
    <h3>�̷� ���� �����?</h3>
    <a href="" target="_blank" class="lecture">
        <img src="" alt="��� �ٷΰ���">
    </a>
	<div class="job"></div><br>
   </div><br><br><br>
   <div class="btn btn-green btn-small share-or-copy">
     ��� �����ϱ�
   </div>

   <a href="test.jsp" class="btn btn-gray btn-small">
     �ٽ� �׽�Ʈ�ϱ� 
   </a><br><br><br><br><br>
</body>
  <%@include file="footer.jsp" %>
</center>
</body>
</html>