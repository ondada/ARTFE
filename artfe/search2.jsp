<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/search.css">

<%
	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
     
     Class.forName("org.gjt.mm.mysql.Driver");  
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
   
     request.setCharacterEncoding("euc-kr");

	String keyword = request.getParameter("keyword2");
	String sql = "SELECT * FROM event WHERE e_name LIKE '%" + keyword + "%'";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

	String sql2 = "SELECT * FROM event WHERE e_place LIKE '%" + keyword + "%'";
	PreparedStatement pstmt2 = con.prepareStatement(sql);
	ResultSet rs2 = pstmt2.executeQuery();

%>
<div id="search" style="width:1000px; height:620px;">
	<div class="scresult" style="width:80%; margin-bottom:20px;">
	<h3 style="font-weight:400; font-size:22px; margin-bottom:10px;">검색결과</h3>
	<h2 style="font-size:26px">'<%=keyword%>'</h2></div><br><br><br>
	<hr style="width:100%; height:1px; background:#dedede; float:left; margin-bottom:20px;">
	  <%
		while(rs.next())
		{
			String e_name = rs.getString("e_name");
            String e_term = rs.getString("e_term");
			String	e_place = rs.getString("e_place");
			String	e_price = rs.getString("e_price");					 			
			String	e_no = rs.getString("e_no");

			DecimalFormat df = new DecimalFormat("###,###");
			int sum = Integer.parseInt(rs.getString("e_price"));
%> 
<div id="sccontent">

	<table border=0 id="table">
	
		<tr style="border-top:1px solid gray;">
			<td style="width:300px;">
					<a href="sangse.jsp?e_no=<%=e_no%>">
					<div id="sectionPic" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></div> 
				
				</td></a>
			</tr> 
		<tr>
		<br>
  			<td ><b><a href="sangse.jsp?e_no=<%=e_no%>"><h3 style="display:inline-block; margin-left:7%; padding-top:10px;"><%= e_name%></h3></b></td></a>
		</tr>
  		<tr>
			<td><p style="color:gray; margin-left:7%;"><%=e_term%></td></a>
		</tr>
  		<tr>
			<td><p style="margin-bottom:20px; margin-left:7%"><%=e_place %></p></td>
		</tr>
		<tr>
			<td><h3 style="margin-bottom:20px; margin-left:7%; color:#514FF0;"><%=df.format(sum)%>원</h3></td>
		</tr>
	</table> </div>

<%
		 } // while문 닫음
%>
	</div>
	<p>
    <center><div class="btn" onclick="location.replace('main.jsp')">
        홈 화면으로 이동
    </div></center>
	<br><br><br><br><br><br><br>
<script>
</script>
</center></div>
   <%@include file="footer.jsp" %>
</body>
</html>