<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>  
  <%@include file="header.jsp" %>
<html>
   <head>
   <meta charset="euc-kr">
   <title>ARTFE</title>
   <link rel="stylesheet" href="css/board_write2.css">
<link rel="icon" href="images/logo.png">
   </head>
   <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
		
		String idx = request.getParameter("idx");
        String pwd = request.getParameter("pwd"); 

		String jsql = "select pwd, no, masterid from board where idx = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setInt(1, Integer.parseInt(idx));
		ResultSet rs = pstmt.executeQuery();
       
		rs.next();
		String rs_pwd = rs.getString("pwd");
		int no = rs.getInt("no");
        int masterid = rs.getInt("masterid");

		if (pwd.equals(rs_pwd)) 
		{
        	if (masterid==no)
			  jsql = "delete from board where masterid =?";
			else
			  jsql = "delete from board where idx =?";

			  PreparedStatement pstmt2 = con.prepareStatement(jsql);
			  pstmt2.setInt(1, Integer.parseInt(idx));
			  pstmt2.executeUpdate();
	
			  response.sendRedirect("board.jsp");
         } 
		 else 
		{
%>
?<script language="javascript">
     alert("옳지 않은 비밀번호입니다.");
	history.go(-1) ;
</script>
<%
        }
    %>
	<br><br>
 <%@include file="footer.jsp" %>
    </body>
</html>