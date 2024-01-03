<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>ARTFE</title></head>
<body>

<%
try { 
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId(); 
	String e_no = request.getParameter("e_no");

	String jsql = "delete from cart where ctNo=? and e_no = ?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	pstmt.setString(2, e_no);
	
	pstmt.executeUpdate();
	response.sendRedirect("mpCart.jsp");    //   <jsp:forward page="showCart.jsp"/>와 같은 의미임
    } catch (Exception e) {
      out.println(e);
}
%>
</body>
</html>