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
            <li><a href="hot.jsp">����</li>
            <li><a href="hot_festi.jsp">����</li>
        </ul>
	</li>
    <li><a href="exhi_ing.jsp">����</a>
        <ul class="submenu">
            <li><a href="exhi_ing.jsp">������</a></li>
            <li><a href="exhi_coming.jsp">����</a></li>
            <li><a href="exhi_end.jsp">����</a></li>
        </ul>   
    </li>
    <li>
        <a href="festi_ing.jsp">����</a>
        <ul class="submenu">
            <li><a href="festi_ing.jsp">������</a></li>
            <li><a href="festi_coming.jsp">����</a></li>
            <li><a href="festi_end.jsp">����</a></li>
        </ul>   
    </li>
    <li><a href="board.jsp">Ŀ�´�Ƽ</a>
	<ul class="submenu">
            <li><a href="board.jsp">�Խ���</a></li>
            <li><a href="notice.jsp">��������</a></li>
            <li><a href="faq.jsp">FAQ</a></li>
        </ul>  
	</li>
    <li><a href="event.jsp">�̺�Ʈ</a></li>      
	<span class="search">
      <input type="text" placeholder="�˻��� �Է�"><a href="#"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></a>
      </span>
</ul>

    </ul>
  </nav>
	
  <br>

<center>
 <div id="content">
<div id="section1"></div>
			
		<div id="sec-content1">
		  <h2>�� �ٸ���</h2>
		  <h3>2022.10.01 ~ 2022.10.27</h3>
		  <p>���: DDP����� ���������ð�(B2F)</p>
		  <h4 style="color:red">20,000��</h4>
		  <br>
		  <p> <input type="button" class="mainbtn" value="�����ϱ�"><input type="button" class="mainbtn2" value="���ɵ��"> </p>
				
    </div>
</div>
<br><br><br>
  <hr><br>
            <a href="sangse.jsp">������</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a style="color:#514FF0">�̿�ȳ�</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="buga.jsp">�ΰ�����</a><br><br></center>
<hr><br><br><div id="sec-content2">

<font-size:2em;>�̿�ȳ�</font><br><br><br>
<font-size:5em;>�����ð� ����<br>- ��~�� 10:00~20:00<p>- ��ǥ �� ���� ���� ���� 1�ð� �� ����<br><br>��������<p>�������� ���� ��� ����ȣǥ�� �����մϴ�.<p>����ȣ ��� �����Ͻ� ��쿡�� ����ȣ�� �����ž� �մϴ�. </font></div>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
   <footer>
	<div>
	<h6>��ARTFE</h6>
<%
	String mid =(String)session.getAttribute("mid");
%>
	<% if(mid == null) 
		{
	%>
	<a href="mnglogin.jsp">������ �α���</a>
	<% 
		} else {

	%>
	<a href="logout.jsp">������ �α׾ƿ�</a>
	<a href="mngindex.jsp">����</a>
	<%
		}
	%>
	<a href="policy.jsp">��������ó����ħ �� ���</a>
	&nbsp;
	<a href="faq.jsp">FAQ</a>
	 &nbsp;
	</div>
  </footer>
</div>
</body>
</html>