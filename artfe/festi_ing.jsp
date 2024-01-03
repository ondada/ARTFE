<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>

<%@include file="header.jsp" %>

<link rel="stylesheet" href="css/exhi_ing.css">

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

<div id="sectionGenre">
  <table>
    <tr>
      <td style="padding-top: 24px; padding-bottom: 22px;"><span style="font-size: 18px;"><b>장르별</b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><b><a href="#"><span style="color:#514FF0">예술
        &nbsp;&nbsp;&nbsp;></span></a> </b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="#">회화 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="#">설치 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="#">교양 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
   <tr>
      <td><span style="font-size: 17px;"><a href="#">과학 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
    <tr style="border:none;">
      <td style="border:none; "><span style="font-size: 17px;"><a href="#">기술 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
  </table>
  </div>

<div id="contentNav">
<p>축제 | <b>예술</b></p>
<p style="font-size:17px; color:gray">Art Festival</p>
</div>

    <a href="sangse.jsp?e_no=<%=e_no1%>">
   <div id="sectionPic" style="background-image: url(images/<%=e_no1%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name1 %></h2>
        <p style="color:gray;"><%=e_term1 %></p>
        <p><%=e_place1 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=e_price1%>원</h3></b><br><br><br><br>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no2%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no2%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name2 %></h2>
        <p style="color:gray;"><%=e_term2 %></p>
        <p><%=e_place2 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=e_price2%>원</h3></b>
      
    </div>
      </a>

     <a href="sangse.jsp?e_no=<%=e_no3%>">
   <div id="sectionPicBottom" style="background-image: url(images/<%=e_no3%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name3 %></h2>
        <p style="color:gray;"><%=e_term3 %></p>
        <p><%=e_place3 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=e_price3%>원</h3></b>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no4%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no4%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name4 %></h2>
        <p style="color:gray;"><%=e_term4 %></p>
        <p><%=e_place4 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=e_price4%>원</h3></b>
      
    </div>
      </a>
      </div>






<br><br><br><br><br><br><br>
   <div id="page">
      <font size="4px" color="white">
      <span style="width:50px; background:#eee; border-radius:10px; ">&nbsp;&nbsp
   <b><a href="exhi_ing.jsp">1 &nbsp; </a></b>
   <a href="exhi_ing.jsp">2 &nbsp; </a>
   <a href="exhi_ing.jsp">3 &nbsp; </a>
   <a href="exhi_ing.jsp">4 &nbsp; </a>
   <a href="exhi_ing.jsp">5 &nbsp; </a>
   <a href="exhi_ing.jsp">6 &nbsp; </a>
   <a href="exhi_ing.jsp">7 &nbsp; </a>
   <a href="exhi_ing.jsp">8 &nbsp; </a>
   <a href="exhi_ing.jsp">9 &nbsp; </a>
   <a href="exhi_ing.jsp">></a>
   &nbsp;&nbsp</span>
</font>
   </div>
<br><br><br><br><br><br><br>
   
<%@include file="footer.jsp" %>
</div>
</body>
</html>