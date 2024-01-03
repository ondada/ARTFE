<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
  <body>
 <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  Á¢¼Ó DB´Â project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
   Class.forName("org.gjt.mm.mysql.Driver");  
   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");
	
	String subject = request.getParameter("in_subject");              
    String name = request.getParameter("in_name");
    String content = request.getParameter("in_content");
    String pwd = request.getParameter("pwd");
    String ymd = (new java.util.Date()).toLocaleString();         
   
	String jsql = "select MAX(no) from board";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	ResultSet rs = pstmt.executeQuery();
	
	int replynum = 0,
	    step = 0;

	int no;
    if (rs == null) {  
        no = 1;
    }  else {    	  
       	rs.next();
       	no = rs.getInt(1) + 1;
    } 
   	
    rs.close();    

	String jsql2 = "insert into board (idx, no, subject, name, content, ";
	jsql2 = jsql2 + "ymd, pwd, masterid, replynum, step) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
   	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setInt(1, no);
	pstmt2.setInt(2, no);
    pstmt2.setString(3, subject);
    pstmt2.setString(4, name);
    pstmt2.setString(5, content);
    pstmt2.setString(6, ymd);
    pstmt2.setString(7, pwd);
    pstmt2.setInt(8, no);
    pstmt2.setInt(9, replynum);
    pstmt2.setInt(10, step);
    	  
	pstmt2.executeUpdate();

    response.sendRedirect("board.jsp"); 

   %>
  </body>
</html>