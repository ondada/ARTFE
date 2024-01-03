<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 정보 삭제 완료</title></head>
<body>
<%
String sid = (String) session.getAttribute("sid"); 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String key = request.getParameter("id");
	 
     String jsql = "delete from user where u_id=?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	
 	 pstmt.executeUpdate();
%>
 <jsp:forward page="main.jsp"/>
 		
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>