<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/sangseNonPrice.css">
<link rel="icon" href="images/logo.png">
</head>
<!-- js_package.js에 정의된 자바스크립트함수 호출 -->

<%
	String mid =(String)session.getAttribute("mid");
%>

<body>
<%
	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String key = request.getParameter("e_no");   //  상세조회하고자 하는 상품번호를 넘겨받아옴

    String jsql = "select * from event where e_no = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

	String e_no = rs.getString("e_no");
    String e_name =  rs.getString("e_name");			      
	String e_term = rs.getString("e_term");
	String e_place =  rs.getString("e_place");
	String e_price = rs.getString("e_price");
	String e_time = rs.getString("e_time");
	String e_description =  rs.getString("e_description");

%>

	
  <br>

<center>

 <div id="content">
		
		<input  type="hidden" name="e_no" value="<%=e_no%>">
		<div id="section1" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></div> 
			
		  <br><br>
		  <input  type="hidden" name="e_name" value="<%=e_name%>"><h2><%= e_name%></h2>
		  <input  type="hidden" name="e_term" value="<%=e_term%>"><h3><%=e_term%></h3>
		  <input  type="hidden" name="e_place" value="<%=e_place%>"><h4><%=e_place %></h4>
		  <br><br>

			 <iframe id="iframe1" name="iframe1" style="visibility:hidden; display:none;"></iframe>         
         <center>
         <input type="image" src="images/heart.png" style="width:40px; position:absolute; border:none; margin-left:-30px; margin-top:40px;" id="test" form="like" onclick="document.getElementById('like').submit(); toggle_object(1); return false;">
		 </center>

		  <form id="like" action="inLike.jsp" method="get" target="iframe1">
		<input  type="hidden" name="e_no" value="<%=e_no%>">
	  <input  type="hidden" name="e_name" value="<%=e_name%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
		<input  type="hidden" name="e_term" value="<%=e_term%>">
		</form>

    </div>

<br><br><br>
 <hr><br>
 <hr><br>
 <br>
<div id="sec-content2">
<h2 style="color:#514FF0">상세정보</h2><br><br><br>
<p><input  type="hidden" name="e_description" value="<%=e_description%>"><%=e_description%></p></div>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
   <footer>
	<div>
	<h6>ⓒARTFE</h6>

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
<script>
var i = 0;
function toggle_object(post_id)
{  
   
   alert('관심행사에 추가되었습니다.');

    i = i + post_id;
    var obj = document.getElementById('test');  
    if(!obj) return;  
 
    if(i%2!=0)
    {  
        obj.src="images/fullheart.png";
       
    }
    else
    {  
    }
}

</script>
</body>
</html>