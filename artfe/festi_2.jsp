<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@include file="header.jsp" %>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/js/paging.js"></script>
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

String jsql1 = "select * from event where e_no = 'B53'";   
   PreparedStatement pstmt1 = con.prepareStatement(jsql1);
   ResultSet rs1 = pstmt1.executeQuery();

   rs1.next();

   String jsql2 = "select * from event where e_no = 'B54'";   
   PreparedStatement pstmt2 = con.prepareStatement(jsql2);
   ResultSet rs2 = pstmt2.executeQuery();
   rs2.next();

   String jsql3 = "select * from event where e_no = 'B55'";   
   PreparedStatement pstmt3 = con.prepareStatement(jsql3);
   ResultSet rs3 = pstmt3.executeQuery();
   rs3.next();

   String jsql4 = "select * from event where e_no = 'B56'";   
   PreparedStatement pstmt4 = con.prepareStatement(jsql4);
   ResultSet rs4 = pstmt4.executeQuery();
   rs4.next();

   String jsql5 = "select * from event where e_no = 'B57'";   
   PreparedStatement pstmt5 = con.prepareStatement(jsql5);
   ResultSet rs5 = pstmt5.executeQuery();
   rs5.next();

   String jsql6 = "select * from event where e_no = 'B58'";   
   PreparedStatement pstmt6 = con.prepareStatement(jsql6);
   ResultSet rs6 = pstmt6.executeQuery();
   rs6.next();

   String jsql7 = "select * from event where e_no = 'B59'";   
   PreparedStatement pstmt7 = con.prepareStatement(jsql7);
   ResultSet rs7 = pstmt7.executeQuery();
   rs7.next();

   String jsql8 = "select * from event where e_no = 'B60'";   
   PreparedStatement pstmt8 = con.prepareStatement(jsql8);
   ResultSet rs8 = pstmt8.executeQuery();
   rs8.next();


  String jsql9 = "select * from event where e_no = 'B61'";   
   PreparedStatement pstmt9 = con.prepareStatement(jsql9);
   ResultSet rs9 = pstmt9.executeQuery();
   rs9.next();

   String jsql10 = "select * from event where e_no = 'B62'";   
   PreparedStatement pstmt10 = con.prepareStatement(jsql10);
   ResultSet rs10 = pstmt10.executeQuery();
   rs10.next();

   String jsql11 = "select * from event where e_no = 'B63'";   
   PreparedStatement pstmt11 = con.prepareStatement(jsql11);
   ResultSet rs11 = pstmt11.executeQuery();
   rs11.next();

   String jsql12 = "select * from event where e_no = 'B64'";   
   PreparedStatement pstmt12 = con.prepareStatement(jsql12);
   ResultSet rs12 = pstmt12.executeQuery();
   rs12.next();

   String jsql13 = "select * from event where e_no = 'B01'";   
   PreparedStatement pstmt13 = con.prepareStatement(jsql13);
   ResultSet rs13 = pstmt13.executeQuery();
   rs13.next();

   String jsql14 = "select * from event where e_no = 'B02'";   
   PreparedStatement pstmt14 = con.prepareStatement(jsql14);
   ResultSet rs14 = pstmt14.executeQuery();
   rs14.next();

   String jsql15 = "select * from event where e_no = 'B03'";   
   PreparedStatement pstmt15 = con.prepareStatement(jsql15);
   ResultSet rs15 = pstmt15.executeQuery();
   rs15.next();

   String jsql16 = "select * from event where e_no = 'B04'";   
   PreparedStatement pstmt16 = con.prepareStatement(jsql16);
   ResultSet rs16 = pstmt16.executeQuery();
   rs16.next();

   String e_no1 = rs1.getString("e_no");
    String e_name1 =  rs1.getString("e_name");      
    String e_term1 =  rs1.getString("e_term");      
    String e_place1 =  rs1.getString("e_place");      
    String e_price1 = rs1. getString("e_price");

	DecimalFormat df1 = new DecimalFormat("###,###");
	int sum1 = Integer.parseInt(rs1.getString("e_price"));

   String e_no2 = rs2.getString("e_no");
     String e_name2 =  rs2.getString("e_name");      
    String e_term2 =  rs2.getString("e_term");      
    String e_place2 =  rs2.getString("e_place");   
    String e_price2 = rs2. getString("e_price");

	DecimalFormat df2 = new DecimalFormat("###,###");
	int sum2 = Integer.parseInt(rs2.getString("e_price"));

   String e_no3 = rs3.getString("e_no");
     String e_name3 =  rs3.getString("e_name");      
    String e_term3 =  rs3.getString("e_term");      
    String e_place3 =  rs3.getString("e_place");   
    String e_price3 = rs3. getString("e_price");

	DecimalFormat df3 = new DecimalFormat("###,###");
	int sum3 = Integer.parseInt(rs3.getString("e_price"));

   String e_no4 = rs4.getString("e_no");
     String e_name4 =  rs4.getString("e_name");      
    String e_term4 =  rs4.getString("e_term");      
    String e_place4 =  rs4.getString("e_place");   
    String e_price4 = rs4. getString("e_price");

	DecimalFormat df4 = new DecimalFormat("###,###");
	int sum4 = Integer.parseInt(rs4.getString("e_price"));


String e_no5 = rs5.getString("e_no");
     String e_name5 =  rs5.getString("e_name");      
    String e_term5 =  rs5.getString("e_term");      
    String e_place5 =  rs5.getString("e_place");   
    String e_price5 = rs5. getString("e_price");

	DecimalFormat df5 = new DecimalFormat("###,###");
	int sum5 = Integer.parseInt(rs5.getString("e_price"));

	String e_no6 = rs6.getString("e_no");
     String e_name6 =  rs6.getString("e_name");      
    String e_term6 =  rs6.getString("e_term");      
    String e_place6 =  rs6.getString("e_place");   
    String e_price6 = rs6. getString("e_price");

	DecimalFormat df6 = new DecimalFormat("###,###");
	int sum6 = Integer.parseInt(rs6.getString("e_price"));

	String e_no7 = rs7.getString("e_no");
     String e_name7 =  rs7.getString("e_name");      
    String e_term7 =  rs7.getString("e_term");      
    String e_place7 =  rs7.getString("e_place");   
    String e_price7 = rs7. getString("e_price");

	DecimalFormat df7 = new DecimalFormat("###,###");
	int sum7 = Integer.parseInt(rs7.getString("e_price"));

	String e_no8 = rs8.getString("e_no");
     String e_name8 =  rs8.getString("e_name");      
    String e_term8 =  rs8.getString("e_term");      
    String e_place8 =  rs8.getString("e_place");   
    String e_price8 = rs8. getString("e_price");

	DecimalFormat df8 = new DecimalFormat("###,###");
	int sum8 = Integer.parseInt(rs8.getString("e_price"));

	String e_no9 = rs9.getString("e_no");
     String e_name9 =  rs9.getString("e_name");      
    String e_term9 =  rs9.getString("e_term");      
    String e_place9 =  rs9.getString("e_place");   
    String e_price9 = rs9. getString("e_price");

	DecimalFormat df9 = new DecimalFormat("###,###");
	int sum9 = Integer.parseInt(rs9.getString("e_price"));

	String e_no10 = rs10.getString("e_no");
     String e_name10 =  rs10.getString("e_name");      
    String e_term10 =  rs10.getString("e_term");      
    String e_place10 =  rs10.getString("e_place");   
    String e_price10 = rs10. getString("e_price");

	DecimalFormat df10 = new DecimalFormat("###,###");
	int sum10 = Integer.parseInt(rs10.getString("e_price"));

	String e_no11 = rs11.getString("e_no");
     String e_name11 =  rs11.getString("e_name");      
    String e_term11 =  rs11.getString("e_term");      
    String e_place11 =  rs11.getString("e_place");   
    String e_price11 = rs11. getString("e_price");

	DecimalFormat df11 = new DecimalFormat("###,###");
	int sum11 = Integer.parseInt(rs11.getString("e_price"));

	String e_no12 = rs12.getString("e_no");
     String e_name12 =  rs12.getString("e_name");      
    String e_term12 =  rs12.getString("e_term");      
    String e_place12 =  rs12.getString("e_place");   
    String e_price12 = rs12. getString("e_price");

	DecimalFormat df12 = new DecimalFormat("###,###");
	int sum12 = Integer.parseInt(rs12.getString("e_price"));

	String e_no13 = rs13.getString("e_no");
     String e_name13 =  rs13.getString("e_name");      
    String e_term13 =  rs13.getString("e_term");      
    String e_place13 =  rs13.getString("e_place");   
    String e_price13 = rs13. getString("e_price");

	DecimalFormat df13 = new DecimalFormat("###,###");
	int sum13 = Integer.parseInt(rs13.getString("e_price"));

	String e_no14 = rs14.getString("e_no");
     String e_name14 =  rs14.getString("e_name");      
    String e_term14 =  rs14.getString("e_term");      
    String e_place14 =  rs14.getString("e_place");   
    String e_price14 = rs14. getString("e_price");

	DecimalFormat df14 = new DecimalFormat("###,###");
	int sum14 = Integer.parseInt(rs14.getString("e_price"));

	String e_no15 = rs15.getString("e_no");
     String e_name15 =  rs15.getString("e_name");      
    String e_term15 =  rs15.getString("e_term");      
    String e_place15 =  rs15.getString("e_place");   
    String e_price15 = rs15. getString("e_price");

	DecimalFormat df15 = new DecimalFormat("###,###");
	int sum15 = Integer.parseInt(rs15.getString("e_price"));

	String e_no16 = rs16.getString("e_no");
     String e_name16 =  rs16.getString("e_name");      
    String e_term16 =  rs16.getString("e_term");      
    String e_place16 =  rs16.getString("e_place");   
    String e_price16 = rs16. getString("e_price");

	DecimalFormat df16 = new DecimalFormat("###,###");
	int sum16 = Integer.parseInt(rs16.getString("e_price"));


%>




<%-- 1번째 페이지 --%>




<section id="tab-section-1" class="tab-section">
<div id="content">


<div id="sectionGenre">
  <table>
    <tr>
      <td style="padding-top: 24px; padding-bottom: 22px;"><span id="genre"><b>지역별</b></span></td>
    </tr>
    <tr>
      <td><span id="sebu"><a href="festi_1.jsp">서울/경기/인천</a></span></td>
    </tr>
    <tr>
      <td><span id="sebu"><b><a href="festi_2.jsp"><span style="color:#514FF0">대전/세종/충청
        &nbsp;></span></a> </b></span></td>
    </tr>
    <tr>
      <td><span id="sebu"><a href="festi_3.jsp">광주/전라</a></span></td>
    </tr>
	<tr>
      <td><span id="sebu"><a href="festi_4.jsp">부산/경상</a></span></td>
    </tr>
  </table>
  </div>

<div id="contentNav">
<p>축제 | <b>대전/세종/충청</b></p>
<p style="font-size:17px; color:gray"></p>
</div>

    <a href="sangse.jsp?e_no=<%=e_no1%>">
   <div id="sectionPic" style="background-image: url(images/<%=e_no1%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name1 %></h2>
        <p style="color:gray;"><%=e_term1 %></p>
        <p><%=e_place1 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df1.format(sum1)%>원</h3></b><br><br><br><br>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no2%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no2%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name2 %></h2>
        <p style="color:gray;"><%=e_term2 %></p>
        <p><%=e_place2 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df2.format(sum2)%>원</h3></b>
      
    </div>
      </a>

     <a href="sangse.jsp?e_no=<%=e_no3%>">
   <div id="sectionPicBottom" style="background-image: url(images/<%=e_no3%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name3 %></h2>
        <p style="color:gray;"><%=e_term3 %></p>
        <p><%=e_place3 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df3.format(sum3)%>원</h3></b>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no4%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no4%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name4 %></h2>
        <p style="color:gray;"><%=e_term4 %></p>
        <p><%=e_place4 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df4.format(sum4)%>원</h3></b>
      
    </div>
      </a>
      </div>
    </section>




<%-- 2번째 페이지 --%>





<section id="tab-section-2" class="tab-section" hidden>
<div id="content">


<div id="sectionGenre">
  <table>
    <tr>
      <td style="padding-top: 24px; padding-bottom: 22px;"><span style="font-size: 18px;"><b>지역별</b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="festi_1.jsp">서울/경기/인천</a></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><b><a href="festi_2.jsp"><span style="color:#514FF0">대전/세종/충청
        &nbsp;></span></a> </b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="festi_3.jsp">광주/전라</a></span></td>
    </tr>
	<tr>
      <td><span style="font-size: 17px;"><a href="festi_4.jsp">부산/경상</a></span></td>
    </tr>
  </table>
  </div>

<div id="contentNav">
<p>축제 | <b>대전/세종/충청</b></p>
<p style="font-size:17px; color:gray"></p>
</div>
    <a href="sangse.jsp?e_no=<%=e_no5%>">
   <div id="sectionPic" style="background-image: url(images/<%=e_no5%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name5%></h2>
        <p style="color:gray;"><%=e_term5%></p>
        <p><%=e_place5%></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df5.format(sum5)%>원</h3></b><br><br><br><br>
            
    </div>
   </a>

    <a href="sangse.jsp?e_no=<%=e_no6%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no6%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name6%></h2>
        <p style="color:gray;"><%=e_term6%></p>
        <p><%=e_place6%></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df6.format(sum6)%>원</h3></b>
      
    </div>
      </a>

	   <a href="sangse.jsp?e_no=<%=e_no7%>">
   <div id="sectionPicBottom" style="background-image: url(images/<%=e_no7%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name7%></h2>
        <p style="color:gray;"><%=e_term7%></p>
        <p><%=e_place7%></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df7.format(sum7)%>원</h3></b>
            
    </div>
   </a>

   <a href="sangse.jsp?e_no=<%=e_no8%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no8%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name8%></h2>
        <p style="color:gray;"><%=e_term8%></p>
        <p><%=e_place8%></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df8.format(sum8)%>원</h3></b>
      
    </div>
      </a>
	  </div>
</section>




<%-- 3번째 페이지 --%>




<section id="tab-section-3" class="tab-section" hidden>
<div id="content">


<div id="sectionGenre">
  <table>
    <tr>
      <td style="padding-top: 24px; padding-bottom: 22px;"><span style="font-size: 18px;"><b>지역별</b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="festi_1.jsp">서울/경기/인천</a></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><b><a href="festi_2.jsp"><span style="color:#514FF0">대전/세종/충청
        &nbsp;></span></a> </b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="festi_3.jsp">광주/전라</a></span></td>
    </tr>
	<tr>
      <td><span style="font-size: 17px;"><a href="festi_4.jsp">부산/경상</a></span></td>
    </tr>
  </table>
  </div>

<div id="contentNav">
<p>축제 | <b>대전/세종/충청</b></p>
<p style="font-size:17px; color:gray"></p>
</div>

    <a href="sangse.jsp?e_no=<%=e_no9%>">
   <div id="sectionPic" style="background-image: url(images/<%=e_no9%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name9 %></h2>
        <p style="color:gray;"><%=e_term9 %></p>
        <p><%=e_place9 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df9.format(sum9)%>원</h3></b><br><br><br><br>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no10%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no10%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name10 %></h2>
        <p style="color:gray;"><%=e_term10 %></p>
        <p><%=e_place10 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df10.format(sum10)%>원</h3></b>
      
    </div>
      </a>

     <a href="sangse.jsp?e_no=<%=e_no11%>">
   <div id="sectionPicBottom" style="background-image: url(images/<%=e_no11%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name11 %></h2>
        <p style="color:gray;"><%=e_term11 %></p>
        <p><%=e_place11 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df11.format(sum11)%>원</h3></b>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no12%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no12%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name12 %></h2>
        <p style="color:gray;"><%=e_term12 %></p>
        <p><%=e_place12 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df12.format(sum12)%>원</h3></b>
      
    </div>
      </a>
	  </div>
    </section>




<%-- 4번째 페이지 --%>



<section id="tab-section-4" class="tab-section" hidden>
<div id="content">


<div id="sectionGenre">
  <table>
    <tr>
      <td style="padding-top: 24px; padding-bottom: 22px;"><span style="font-size: 18px;"><b>지역별</b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="festi_1.jsp">서울/경기/인천</a></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><b><a href="festi_2.jsp"><span style="color:#514FF0">대전/세종/충청
        &nbsp;></span></a> </b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="festi_3.jsp">광주/전라</a></span></td>
    </tr>
	<tr>
      <td><span style="font-size: 17px;"><a href="festi_4.jsp">부산/경상</a></span></td>
    </tr>
  </table>
  </div>

<div id="contentNav">
<p>축제 | <b>대전/세종/충청</b></p>
<p style="font-size:17px; color:gray"></p>
</div>
<a href="sangse.jsp?e_no=<%=e_no13%>">
   <div id="sectionPic" style="background-image: url(images/<%=e_no13%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name13 %></h2>
        <p style="color:gray;"><%=e_term13 %></p>
        <p><%=e_place13 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df13.format(sum13)%>원</h3></b><br><br><br><br>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no14%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no14%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name14 %></h2>
        <p style="color:gray;"><%=e_term14 %></p>
        <p><%=e_place14 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df14.format(sum14)%>원</h3></b>
      
    </div>
      </a>

     <a href="sangse.jsp?e_no=<%=e_no15%>">
   <div id="sectionPicBottom" style="background-image: url(images/<%=e_no15%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
         
      <div id="sectionContent">
        <h2><%= e_name15 %></h2>
        <p style="color:gray;"><%=e_term15 %></p>
        <p><%=e_place15 %></p>
        <br><br><br>
        <b><h3 style="color:#514FF0"><%=df15.format(sum15)%>원</h3></b>
            
    </div>
   </a>
     
       <a href="sangse.jsp?e_no=<%=e_no16%>">
         <div id="sectionPic" style="background-image: url(images/<%=e_no16%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
         <div id="sectionContentRight">
        <h2><%= e_name16 %></h2>
        <p style="color:gray;"><%=e_term16 %></p>
        <p><%=e_place16 %></p>
        <br><br><br>
       <b><h3 style="color:#514FF0"><%=df16.format(sum16)%>원</h3></b>
    </div>
      </a>
      </div>

</section>




<%-- 5번째 페이지 --%>






<br><br><br><br><br><br><br>



<div id="pagination" style="margin-left:23px;">
	<a href="#" class="tab-button"  name="active"data-tab-section="tab-section-1"> 1 </a>
	<a href="#" class="tab-button"  name=""data-tab-section="tab-section-2"> 2 </a>
	<a href="#" class="tab-button"  name="" data-tab-section="tab-section-3"> 3 </a>
	<a href="#" class="tab-button"  name="" data-tab-section="tab-section-4"> 4 </a>
</div>


<br><br><br><br><br><br><br>
   
<%@include file="footer.jsp" %>
</div>
  <script type="text/javascript">
    const $nav = document.querySelector('#pagination')
    const $sections = document.querySelectorAll('.tab-section');

    $nav.addEventListener('click', (e) => {
      if (!e.target.classList.contains('tab-button')) {
        return;
      }
      
      const focusedTabId = e.target.dataset.tabSection;

      $sections.forEach(($section) => {
        if ($section.id === focusedTabId) {
          $section.removeAttribute('hidden');
        } else {
          $section.setAttribute('hidden', true);
        }
      });
    });
</script>
</div>
</body>
</html>