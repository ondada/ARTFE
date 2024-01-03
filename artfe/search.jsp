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

	String keyword = request.getParameter("keyword");
	String sql = "SELECT * FROM event WHERE e_name LIKE '%" + keyword + "%'";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();


   if(!rs.next()){
%>
	<div class="scresult" style="width:80%; margin-bottom:20px;">
	<h3 style="font-weight:400; font-size:22px; margin-bottom:10px;">검색 결과</h3>
	<h2 style="font-size:26px">'<%=keyword%>'</h2></div><br><br><br><br><br>
	<hr style="width:100%; height:1px; background:#dedede; float:left; margin-bottom:20px;">
		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>검색 결과가 없습니다.</b></h1></center></div>
			
<%
        }else {
%>

	 <table style="border-collapse: collapse; width:100%; margin-left:80px;">
  <tr>
  <td id="cate" align=center></td>
 <td id="cate" align=center><b>행사정보</b></td>
 <td id="cate" align=center><b>기간</b></td>
 <td id="cate" align=center><b>행사명</b></td>
  <td id="cate" align=center><b>가격</b></td>
  <td id="cate"></td>
 </tr>


	<div class="scresult" style="width:80%; margin-bottom:20px;">
	<h3 style="font-weight:400; font-size:22px; margin-bottom:10px;">검색결과</h3>
	<h2 style="font-size:26px">'<%=keyword%>'</h2></div><br><br><br>
	<hr style="width:100%; height:1px; background:#dedede; float:left; margin-bottom:20px;">
		<%
		}	

%>
	  <%
		 String sql2 = "SELECT * FROM event WHERE e_name LIKE '%" + keyword + "%'";
		 PreparedStatement pstmt2 = con.prepareStatement(sql);
		 ResultSet rs2 = pstmt2.executeQuery();

		while(rs2.next())
		{
			String e_name = rs2.getString("e_name");
            String e_term = rs2.getString("e_term");
			String	e_place = rs2.getString("e_place");
			String	e_price = rs2.getString("e_price");					 			
			String	e_no = rs2.getString("e_no");

			DecimalFormat df = new DecimalFormat("###,###");
			int sum = Integer.parseInt(rs.getString("e_price"));
%>
	<tr>
  			<td id="con" align="center" style="font-size: 16px; padding:10px; width:160px; border-bottom:1px solid #dedede;"><a href="sangse.jsp?e_no=<%=e_no%>">
	<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;">
	</div></a><br></td>

			<td id="con" align=center style=" width:200px; height:100px; border-bottom:1px solid #dedede;"><a href="sangse.jsp?e_no=<%=e_no%>"><%= e_name%></a></td>
			<td id="con" align=center style=" width:200px; height:100px; border-bottom:1px solid #dedede;"><%=e_term%></td>
			<td id="con" align=center style="width:180px; height:100px; border-bottom:1px solid #dedede;"><%=e_place%></td>
			<td id="con" align=center style="width:180px; height:100px; border-bottom:1px solid #dedede; color:#514FF0;"><b><%=df.format(sum)%>원</b></td>
	
    </div>
<%
		}   // while문의 끝
%>
</table>
	 
    </div>
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