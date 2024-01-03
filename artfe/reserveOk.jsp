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
      <input type="text" placeholder="�˻��� �Է�"><a href="#"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" style="border-radius: 10px;"></a>
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
	
	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
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
  <h1><b>���ſϷ�</b></h1>
  <br>
  <hr>
	<form action="main.jsp">
    <center>
    <br><br><br><br>
    <h2><b>���Ű� �Ϸ�Ǿ����ϴ�.</b></h2>
    <br><br><br>
	<div id="box">
	<table style="float:left; margin-left:15%; margin-right:100px; margin-top:35px;">
	<tr>
	<th style="font-size: 20px; color:gray; padding:10px;">����</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px;"><%=e_name%></td>
	<td></td>
	</tr>
	<tr>
	<th style="font-size: 20px; color:gray; padding:10px">���Ⱓ</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px;"><%=e_term%></td>
	</tr>
	<th style="font-size: 20px; color:gray; padding:10px">ȸ��</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px;"><%=e_time%></td>
	</tr>
	<tr>
	<th style="font-size: 20px; color:gray; padding:10px; margin-top:30px;">�����ݾ�</th>
	<td style="font-size: 20px; font-weight:bold; padding:10px; color:#514FF0"><%=total%>��</td>
	</tr>
	</table>
	<span id="section" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></span>
	</div>
	<br><br>

	

    <input type="button" class="mainbtn" value="���ų��� ����" onClick="location.href='mpbookinfo.jsp'" style="cursor:pointer"> 
    <br><br>
    </center>
</form>
      
       
  
  <br><br><br>
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
</center>
</body>
</html>