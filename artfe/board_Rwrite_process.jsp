<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/board_write.css">
<%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");

		String subject = request.getParameter("in_subject");
        String name = request.getParameter("in_name");       
        String content = request.getParameter("in_content");    	         
        String pwd = request.getParameter("pwd");
        String ymd = (new java.util.Date()).toLocaleString();
        int midd = Integer.parseInt(request.getParameter("midd"));
        int rnum = Integer.parseInt(request.getParameter("rnum"));
        int step = Integer.parseInt(request.getParameter("step")) + 1;         
     

		String jsql = "select MAX(no) from board";   //no 최대값 알아오기
		PreparedStatement pstmt = con.prepareStatement(jsql);
		ResultSet rs = pstmt.executeQuery();
	
		int no;
    	if (rs == null) {  //no가 존재하지 않으면 1부터 시작
    	    no = 1;
    	}  else {    	      //존재한다면 최대값 + 1
        	rs.next();
        	no = rs.getInt(1) + 1;
    	} 
    	
    	rs.close();    
    	//기본글은 step=0, 답변글은 step=1, 답변글의 답변글은 step=2 
    	if(step==1) {     //답변글인 경우 답변글의 번호 최대값 알아오기
    	String  jsql2 ="select max(replynum) from board where masterid=" +midd;
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs2 = pstmt2.executeQuery();

	    if(!(rs2.next()))
	         rnum = 1; //답변글 번호가 존재하지 않으면 1부터 시작
	    else
	         rnum = rs2.getInt(1) + 1;//존재한다면 최대값 + 1
	   }
    	
		String jsql3 = "insert into board (idx, no, subject, name, content, ";
		jsql3 = jsql3 + "ymd, pwd, masterid, replynum, step) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
   		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setInt(1, no);
		pstmt3.setInt(2, no);
    	pstmt3.setString(3, subject);
    	pstmt3.setString(4, name);
    	pstmt3.setString(5, content);
    	pstmt3.setString(6, ymd);
    	pstmt3.setString(7, pwd);
    	pstmt3.setInt(8, midd);
    	pstmt3.setInt(9, rnum);
    	pstmt3.setInt(10, step);
    	  
	try {   	
   	   pstmt3.executeUpdate();

	   response.sendRedirect("board.jsp");
     }
       catch (SQLException e) {
    %>


<script language="javascript">
     alert("답글이 정상적으로 입력되지 않았습니다.");
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