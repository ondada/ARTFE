<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">

<body>

<%
String id = null, msg = null;

try {
 String DB_URL="jdbc:mysql://localhost:3306/artfe";   
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
     
    Class.forName("org.gjt.mm.mysql.Driver");  
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
Statement stmt = con.createStatement();
 request.setCharacterEncoding("euc-kr");

 String name = request.getParameter("name");
 String phone = request.getParameter("phone");

  String jsql = "select * from user where u_name=? and u_phone=? "; 

PreparedStatement pstmt  = con.prepareStatement(jsql);
 pstmt.setString(1,name);
 pstmt.setString(2,phone);
  
 ResultSet rs = pstmt.executeQuery();
  

  if(rs.next()){ 
   // id 찾기를 호출한 페이지에 찾은 아이디를 보여주기 위한 용도 
   session.setAttribute("u_id", rs.getString("u_id")); 
   id = rs.getString("u_id");
 } 
  
else {    
   %>

    <script language="javascript">
   alert('일치하는 회원정보가 없습니다.');
     window.location = 'findId.jsp';
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
     window.location = 'findId.jsp';
}
}


</script>





  
    <div class="login-form">
 <center>
	<h2><b>아이디 찾기</b></h2><br><br>
	<form action="login.jsp">
	 <%
       if (id != null) {
      %>
    <p>고객님의 아이디는 <font color="#514FF0"><%=id%></font>입니다.</p>
	<br><br><br>
	 <input type="button" class="mainbtn" value="로그인하러 가기" onClick="location.href='login.jsp'" style="cursor:pointer"> 
     <input type="button" class="mainbtn-fgpw" value="비밀번호 찾기" onClick="location.href='findPw.jsp'" style="cursor:pointer"> 
    <br><br>
	  <%
  } else {
 %>

       <%
  }
 %> 
   
    </center>
</form>
      
       
  
  <br><br></div> 
  <%@include file="footer.jsp" %>
</center>
</body>
</html>