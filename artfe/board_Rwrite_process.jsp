<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/board_write.css">
<%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  ���� DB�� project
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
     

		String jsql = "select MAX(no) from board";   //no �ִ밪 �˾ƿ���
		PreparedStatement pstmt = con.prepareStatement(jsql);
		ResultSet rs = pstmt.executeQuery();
	
		int no;
    	if (rs == null) {  //no�� �������� ������ 1���� ����
    	    no = 1;
    	}  else {    	      //�����Ѵٸ� �ִ밪 + 1
        	rs.next();
        	no = rs.getInt(1) + 1;
    	} 
    	
    	rs.close();    
    	//�⺻���� step=0, �亯���� step=1, �亯���� �亯���� step=2 
    	if(step==1) {     //�亯���� ��� �亯���� ��ȣ �ִ밪 �˾ƿ���
    	String  jsql2 ="select max(replynum) from board where masterid=" +midd;
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs2 = pstmt2.executeQuery();

	    if(!(rs2.next()))
	         rnum = 1; //�亯�� ��ȣ�� �������� ������ 1���� ����
	    else
	         rnum = rs2.getInt(1) + 1;//�����Ѵٸ� �ִ밪 + 1
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
     alert("����� ���������� �Էµ��� �ʾҽ��ϴ�.");
	history.go(-1) ;
</script>
    <%
        }
    %>
	</center>
	<br><br>
	 <footer>
	<div>
	<h6>��ARTFE</h6>

<%
	String mid =(String)session.getAttribute("mid");
%>

	<% if(mid == null) 
		{
	%>
	<a href="mnglogin.jsp">������ �α���</a>
	<% 
		} else {

	%>
	<a href="logout.jsp">������ �α׾ƿ�</a>
	<a href="mngindex.jsp">����</a>
	<%
		}
	%>
	<a href="policy.jsp">��������ó����ħ �� ���</a>
	&nbsp;
	<a href="faq.jsp">FAQ</a>
	 &nbsp;
	</div>
  </footer>
    </body>
</html>