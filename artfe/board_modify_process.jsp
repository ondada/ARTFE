<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
   <link rel="stylesheet" href="css/board_write.css">
<link rel="icon" href="images/logo.png">
   <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");

       String idx = request.getParameter("idx");
       String subject = request.getParameter("in_subject"); 
       String content = request.getParameter("in_content");             
       String pwd = request.getParameter("pwd");  
               
       String jsql = "select pwd from board where idx = ?";
       PreparedStatement pstmt = con.prepareStatement(jsql);
       pstmt.setInt(1, Integer.parseInt(idx));
       ResultSet rs = pstmt.executeQuery();
       
       rs.next();
       String rs_pwd = rs.getString("pwd").trim();

       if (pwd.equals(rs_pwd)) 
	  {
          String jsql2 = "update board set subject = ?, content = ? where idx = ?";
          PreparedStatement pstmt2 = con.prepareStatement(jsql2);
          pstmt2.setString(1, subject);
          pstmt2.setString(2, content);
          pstmt2.setInt(3, Integer.parseInt(idx));
          pstmt2.executeUpdate();
          
          response.sendRedirect("board.jsp");
        } 
		else 
		{
     %>
 
  <script language="javascript">
     alert("옳지 않은 비밀번호입니다.");
	history.go(-1) ;
</script>
    <%
        }
    %>
	</center>
	<br><br>
	 <footer>
	<div>
	<h6>ⓒARTFE</h6>
<%
	String mid =(String)session.getAttribute("mid");
%>
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
    </body>
</html>