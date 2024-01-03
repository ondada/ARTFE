<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/hot.css">

<body>

<%
	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");

	//  category별(그룹별) 상품조회를 위해서,  index.html  or  index.jsp로부터 
	//  조회하고자하는 특정 ctgType값을 넘겨 받아옴 

	String jsql1 = "select * from event where e_no = 'B01'";   
	PreparedStatement pstmt1 = con.prepareStatement(jsql1);
	ResultSet rs1 = pstmt1.executeQuery();
	rs1.next();

	String jsql2 = "select * from event where e_no = 'B02'";   
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();

	String jsql3 = "select * from event where e_no = 'B03'";   
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();

	String jsql4 = "select * from event where e_no = 'B04'";   
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();

	String e_no1 = rs1.getString("e_no");
	 String e_name1 =  rs1.getString("e_name");		
	 String e_term1 =  rs1.getString("e_term");		
	 String e_place1 =  rs1.getString("e_place");		
	 String e_price1 = rs1. getString("e_price");

	String e_no2 = rs2.getString("e_no");
	  String e_name2 =  rs2.getString("e_name");		
	 String e_term2 =  rs2.getString("e_term");		
	 String e_place2 =  rs2.getString("e_place");	
	 String e_price2 = rs1. getString("e_price");

	String e_no3 = rs3.getString("e_no");
	  String e_name3 =  rs3.getString("e_name");		
	 String e_term3 =  rs3.getString("e_term");		
	 String e_place3 =  rs3.getString("e_place");	
	 String e_price3 = rs1. getString("e_price");

	String e_no4 = rs4.getString("e_no");
	  String e_name4 =  rs4.getString("e_name");		
	 String e_term4 =  rs4.getString("e_term");		
	 String e_place4 =  rs4.getString("e_place");	
	 String e_price4 = rs1. getString("e_price");
%>
<div id="content">

    <div id="contentNav">
<p><b>이번 달 인기 축제 <font color="#514FF0";>Top3</font></b></p>
<p  id="p">사람들이 가장 많이 예매했어요!</p>
</div><br>

       <a href="sangse.jsp?e_no=<%=e_no2%>">
	 <div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no2%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="color: gray;  margin-top: 10px;"> <%=e_term2%></span>
		<h2 style="margin-top: 4px; margin-right: 8px;"><%=e_name2%></h2>
		</div>
	</a>

    <a href="sangse.jsp?e_no=<%=e_no3%>">
	<div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no3%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="color: gray;  margin-top: 10px;"> <%=e_term3%></span>
		<h2 style="margin-top: 4px; margin-right: 8px;"><%=e_name3%></h2>
		</div>
	</a>

	 <a href="sangse.jsp?e_no=<%=e_no1%>">
	 <div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no1%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style=" color: gray;  margin-top: 10px;"> <%=e_term1%></span>
		<h2 style="margin-top: 4px; margin-right: 8px;"><%=e_name1%></h2>
		</div>
	</a>

	</div>
<br><br><br>
  
  <%@include file="footer.jsp" %>
</div>
</body>
</html>