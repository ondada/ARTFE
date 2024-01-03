<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">

<body>

<%
String pw = null, msg = null;

try {
 String DB_URL="jdbc:mysql://localhost:3306/artfe";   
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
     
    Class.forName("org.gjt.mm.mysql.Driver");  
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
Statement stmt = con.createStatement();
 request.setCharacterEncoding("euc-kr");

 String id = request.getParameter("id");
 String name = request.getParameter("name");
 String email = request.getParameter("email");

  String jsql = "select * from user where u_id=? and u_name=? and u_email=? "; 

PreparedStatement pstmt  = con.prepareStatement(jsql);
 pstmt.setString(1,id);
 pstmt.setString(2,name);
 pstmt.setString(3,email);
  
 ResultSet rs = pstmt.executeQuery();
  

  if(rs.next()){ 
   // pw 찾기를 호출한 페이지에 찾은 비밀번호를 보여주기 위한 용도 
   session.setAttribute("u_pw", rs.getString("u_pw")); 
   pw = rs.getString("u_pw");
 } 
  
else {    
   %>

    <script language="javascript">
   alert('일치하는 회원정보가 없습니다.');
     window.location = 'findPw.jsp';
</script>

<%
 }
 
 
 }finally{

    %>
       
    
   <script> fn_alert(); </script>
<%
   
}
%>

<script language="javascript">

function fn_alert()
   {
       alert('<%=msg%>');
     window.location = 'findPw.jsp';
}
}


</script>


  
 <div class="login-form">
 <center>
	<h2><b>아이디 찾기</b></h2><br><br>
	<form action="login.jsp">
	 <%
       if (pw != null) {
      %>
     <p>고객님의 비밀번호는 <font color="#514FF0"><%=pw%></font>입니다.</p>
	<br><br><br>
	<input type="button" class="mainbtnPw" value="로그인하러 가기" onClick="location.href='login.jsp'" style="cursor:pointer"> 
    <br><br>
	  <%
  } else {
 %>
</div>   
       <%
  }
 %> 
   
    </center>
</form>
      
       
  
  <br><br></div>
  <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>