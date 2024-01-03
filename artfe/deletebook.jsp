<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>ARTFE</title></head>
<body>
<%
String sid = (String) session.getAttribute("sid"); 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	 String bNo = request.getParameter("bNo");
	 
     String jsql = "DELETE bi, bp FROM bookinfo AS bi INNER JOIN bookproduct AS bp ON bi.bNo = bp.bNo WHERE bi.bNo = ?";        
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, bNo);

 	 pstmt.executeUpdate();
	
%>

 <jsp:forward page="mpbookinfo.jsp"/>
 		
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>