<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<html><head><title>ARTFE</title></head>
<link rel="icon" href="images/logo.png">
<body>
<%
String sid = (String) session.getAttribute("sid"); 

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("no");
	 
     String jsql = "delete from event where e_no=?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	
 	 pstmt.executeUpdate();
%>
 <jsp:forward page="allEvent.jsp"/>
 		
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
<%@include file="footer.jsp" %>
</body>
</html>