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
<style>

.pagination {
left: 40%;
position: absolute;
}

.pagination a {
	float:left;
	padding: 8px 16px;
	text-decoration:none;
	border: 1px solid #ddd;
	color:black;
}

.pagination a.active {
	background-color:#514FF0;
	border: 1px solid #514FF0;
	color:white;
}

.pagination a:hover:not(.active) {
	background-color:#ddd;
}

.pagination a:first-child {
	border-top-left-radius:5px;
	border-bottom-left-radius:5px;
}

.pagination a:last-child {
	border-top-right-radius:5px;
	border-bottom-right-radius:5px;
}

</style>
<head>
  <meta charset="UTF-8">
  <title>탭 연습</title>
</head>
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

   String jsql1 = "select * from event where e_no = 'A01'";   
   PreparedStatement pstmt1 = con.prepareStatement(jsql1);
   ResultSet rs1 = pstmt1.executeQuery();

   rs1.next();

   String jsql2 = "select * from event where e_no = 'A02'";   
   PreparedStatement pstmt2 = con.prepareStatement(jsql2);
   ResultSet rs2 = pstmt2.executeQuery();
   rs2.next();

   String jsql3 = "select * from event where e_no = 'A03'";   
   PreparedStatement pstmt3 = con.prepareStatement(jsql3);
   ResultSet rs3 = pstmt3.executeQuery();
   rs3.next();

   String jsql4 = "select * from event where e_no = 'A04'";   
   PreparedStatement pstmt4 = con.prepareStatement(jsql4);
   ResultSet rs4 = pstmt4.executeQuery();
   rs4.next();

   String jsql5 = "select * from event where e_no = 'A05'";   
   PreparedStatement pstmt5 = con.prepareStatement(jsql5);
   ResultSet rs5 = pstmt5.executeQuery();
   rs5.next();

   String jsql6 = "select * from event where e_no = 'A06'";   
   PreparedStatement pstmt6 = con.prepareStatement(jsql6);
   ResultSet rs6 = pstmt6.executeQuery();
   rs6.next();

   String jsql7 = "select * from event where e_no = 'A07'";   
   PreparedStatement pstmt7 = con.prepareStatement(jsql7);
   ResultSet rs7 = pstmt7.executeQuery();
   rs7.next();

   String jsql8 = "select * from event where e_no = 'A08'";   
   PreparedStatement pstmt8 = con.prepareStatement(jsql8);
   ResultSet rs8 = pstmt8.executeQuery();
   rs8.next();

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

	
%>
<div id="content">

<div id="sectionGenre">
  <table>
    <tr>
      <td style="padding-top: 24px; padding-bottom: 22px;"><span style="font-size: 18px;"><b>장르별</b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><b><a href="exhi_art.jsp"><span style="color:#514FF0">회화
        &nbsp;&nbsp;&nbsp;></span></a> </b></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="exhi_photo.jsp">사진
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
    <tr>
      <td><span style="font-size: 17px;"><a href="exhi_media.jsp">미디어 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span></td>
    </tr>
  </table>
  </div>
<section id="tab-section-1" class="tab-section">
<div id="contentNav">
<p>전시 | <b>회화</b></p>
<p style="font-size:17px; color:gray">Art Exhibition</p>
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















    <section id="tab-section-2" class="tab-section" hidden>
     <div id="contentNav">
<p>전시 | <b>회화</b></p>
<p style="font-size:17px; color:gray">Art Exhibition</p>
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
      </div>
    </section>













    <section id="tab-section-3" class="tab-section" hidden>
      <div id="contentNav">
<p>전시 | <b>회화</b></p>
<p style="font-size:17px; color:gray">Art Exhibition</p>
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
		


      </div>
    </section>





    <div id="pagination">
      <a href="#" class="active" data-tab-section="tab-section-1">탭 1</a>
      <a href="#" class="active" data-tab-section="tab-section-2">탭 2</a>
      <a href="#" class="active" data-tab-section="tab-section-3">탭 3</a>
    </div>

  <main>
    <br>
    <section id="tab-section-1" class="tab-section">
      <div>탭 1 페이지</div>
    </section>
    <section id="tab-section-2" class="tab-section" hidden>
      <div>탭 2 페이지</div>
    </section>
    <section id="tab-section-3" class="tab-section" hidden>
      <div>탭 3 페이지</div>
    </section>
  </main>
  <script>
    const $nav = document.querySelector('#pagination')
    const $sections = document.querySelectorAll('.tab-section');

    $nav.addEventListener('click', (e) => {
      if (!e.target.classList.contains('active')) {
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
  <%@include file="footer.jsp" %>
</body>
</html>