<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>
<link rel="stylesheet" href="css/main.css">
<link rel="icon" href="images/logo.png">

</head>


<%@include file="header.jsp" %>


<body>

<%
	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");

	//  category��(�׷캰) ��ǰ��ȸ�� ���ؼ�,  index.html  or  index.jsp�κ��� 
	//  ��ȸ�ϰ����ϴ� Ư�� ctgType���� �Ѱ� �޾ƿ� 

	String jsql1 = "select * from event where e_no = 'A40'";   
	PreparedStatement pstmt1 = con.prepareStatement(jsql1);
	ResultSet rs1 = pstmt1.executeQuery();
	rs1.next();

	String jsql2 = "select * from event where e_no = 'A38'";   
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();

	String jsql3 = "select * from event where e_no = 'A29'";   
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();

	String jsql4 = "select * from event where e_no = 'A39'";   
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();

	String jsql5 = "select * from event where e_no = 'A17'";   
	PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	ResultSet rs5 = pstmt5.executeQuery();
	rs5.next();

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

	 String e_no5 = rs5.getString("e_no");
	  String e_name5 =  rs5.getString("e_name");		
	 String e_term5 =  rs5.getString("e_term");		
	 String e_place5 =  rs5.getString("e_place");	
	 String e_price5 = rs1. getString("e_price");

	String jsql6 = "select * from event where e_no = 'B01'";   
	PreparedStatement pstmt6 = con.prepareStatement(jsql6);
	ResultSet rs6 = pstmt6.executeQuery();
	rs6.next();

	String jsql7 = "select * from event where e_no = 'B02'";   
	PreparedStatement pstmt7 = con.prepareStatement(jsql7);
	ResultSet rs7 = pstmt7.executeQuery();
	rs7.next();

	String jsql8 = "select * from event where e_no = 'B62'";   
	PreparedStatement pstmt8 = con.prepareStatement(jsql8);
	ResultSet rs8 = pstmt8.executeQuery();
	rs8.next();

	String jsql9 = "select * from event where e_no = 'B04'";   
	PreparedStatement pstmt9 = con.prepareStatement(jsql9);
	ResultSet rs9 = pstmt9.executeQuery();
	rs9.next();

	String jsql10 = "select * from event where e_no = 'B30'";   
   PreparedStatement pstmt10 = con.prepareStatement(jsql10);
   ResultSet rs10 = pstmt10.executeQuery();
   rs10.next();

	String e_no6 = rs6.getString("e_no");
	  String e_name6 =  rs6.getString("e_name");		
	 String e_term6 =  rs6.getString("e_term");		
	 String e_place6 =  rs6.getString("e_place");	
	 String e_price6 = rs6. getString("e_price");

	String e_no7 = rs7.getString("e_no");
	  String e_name7 =  rs7.getString("e_name");		
	 String e_term7 =  rs7.getString("e_term");		
	 String e_place7 =  rs7.getString("e_place");	
	 String e_price7 = rs7. getString("e_price");

	String e_no8 = rs8.getString("e_no");
	  String e_name8 =  rs8.getString("e_name");		
	 String e_term8 =  rs8.getString("e_term");		
	 String e_place8 =  rs8.getString("e_place");	
	 String e_price8 = rs8. getString("e_price");

	 String e_no9 = rs9.getString("e_no");
	  String e_name9 =  rs9.getString("e_name");		
	 String e_term9 =  rs9.getString("e_term");		
	 String e_place9 =  rs9.getString("e_place");	
	 String e_price9 = rs9. getString("e_price");
	 
	 String e_no10 = rs10.getString("e_no");
	  String e_name10 =  rs10.getString("e_name");		
	 String e_term10 =  rs10.getString("e_term");		
	 String e_place10 =  rs10.getString("e_place");	
	 String e_price10 = rs10. getString("e_price");

%>
	<div id="keyimage">
 <div class="slidebox">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<input type="radio" name="slide" id="slide04">
	<ul class="slidelist">
		<li class="slideitem" style="padding:0px">
			<div>
				<label for="slide03" class="left" style="background-image:url('images/left-arrow.png')"></label>
				<label for="slide02" class="right" style="background-image:url('images/right-arrow.png')"></label>
				<a href="exhi_art.jsp"><img src="images/keyimage1.jpg"></a>
			</div>
		</li>
		<li class="slideitem" style="padding:0px">
			<div>
				<label for="slide01" class="left" style="background-image:url('images/left-arrow.png')"></label>
				<label for="slide03" class="right" style="background-image:url('images/right-arrow.png')"></label>
				<a href="test.jsp"><img src="images/keyimage2.jpg"></a>
			</div>
		</li>
		<li class="slideitem" style="padding:0px">
			<div>
				<label for="slide02" class="left" style="background-image:url('images/left-arrow.png')"></label>
				<label for="slide01" class="right" style="background-image:url('images/right-arrow.png')"></label>
				<a href="exhi_art.jsp"><img src="images/keyimage4.png"></a>
			</div>
		</li>
	</ul>
</div>

	</div>

<div id="exhibition">

	  <p style="margin-bottom:16px; font-size:26px;"><a href="exhi_art.jsp"><b>���� �� ���� ���? ></b></a><br>
	  <font size='4' style="color:gray; line-height:40px;">���������� �Ż� ����!</font></p>

		<a href="sangse.jsp?e_no=<%=e_no1%>">
		<div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no1%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="font-size: 15px; color: gray;  margin-top: 10px;"> <%=e_term1%></span>
		<h3 style="margin-top: 4px; margin-right: 8px;"><%=e_name1%></h3>
		</div>
		</a>

		<a href="sangse.jsp?e_no=<%=e_no2%>">
		<div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no2%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="font-size: 15px; color: gray;  margin-top: 10px;"> <%=e_term2%></span>
		<h3 style=" margin-top: 4px; margin-right: 8px;"><%=e_name2%></h3>
		</div>
		</a>

		<a href="sangse.jsp?e_no=<%=e_no3%>">
		<div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no3%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="font-size: 15px; color: gray;  margin-top: 10px;"> <%=e_term3%></span>
		<h3 style="margin-top: 4px; margin-right: 8px;"><%=e_name3%></h3>
		</div>
		</a>

		<a href="sangse.jsp?e_no=<%=e_no4%>">
		<div id="section">
		<div id="sectionPic" style="background-image: url(images/<%=e_no4%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="font-size: 15px; color: gray;  margin-top: 10px;"> <%=e_term4%></span>
		<h3 style="margin-top: 4px; margin-right: 8px;"><%=e_name4%></h3>
		</div>
		</a>
		
		<a href="sangse.jsp?e_no=<%=e_no5%>">
		<div id="section" style="margin-right:0px;">
		<div id="sectionPic" style="background-image: url(images/<%=e_no5%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
		<span style="font-size: 15px; color: gray;  margin-top: 10px;"> <%=e_term5%></span>
		<h3 style="margin-top: 4px; margin-right: 8px;"><%=e_name5%></h3>
		</div>
		</a>
</div>



<div id="festival">
      <p style="margin-bottom:16px; font-size:26px;"><a href="festi_1.jsp"><b>���� ���� ��! ���� ���� ></b></a><br>
	  <font size='4' style="color:gray; line-height:40px;">������ ��õ ����Ʈ�ڽ�! ������ ���� �����</font></p>
	 
		<a href="sangse.jsp?e_no=<%=e_no6%>">
		<div id="festiSectionLeft" style="background-image: url(images/festimain1.png); background-size: cover; background-repeat: no-repeat;"></div></a>

		<a href="sangse.jsp?e_no=<%=e_no10%>">
		<div id="festiSectionRight" style="background-image: url(images/festimain2.jpg); background-size: cover; background-repeat: no-repeat;"></div></a>

  </div>

  <div id="community_wrap">

  <p style="margin-bottom:16px; font-size:26px; display:block;"><a href="board.jsp"><b>Ŀ�´�Ƽ ></b></a><br>
  <font size='4' style="color:gray; line-height:40px;">��� �ıⰡ �ñ��ϽŰ���? Ŀ�´�Ƽ�� Ȯ���� ������!</font></p>
  <div id="community_border">
	<div id="coummunity_left">
		<div id="best">
		<p id="best1">�̴��� ��� �̿��� �ı� <span id="besticon">BEST!</span></p>
			<a href="board_view.jsp?idx=3"><p id="best2">��ȭ ���Ķ�� �� ���� �� ����<span style="color:#8b5496; font-weight:bold;"><br>Max Dalton Moments in Film 63 <span style="color:#8b5496; font-weight:normal;">></span></p></a>
			<p id="nickname">���ѿ����� ��</p>

			<hr style="width:100%; height:1px; margin:20px 0; float:left; background:#b0b0b0;">
			<div id="best_content">
			<p id="best3" style=""><b>�������� �Ϸ���Ʈ������ �ƽ� ��ư</b>�� ��ǰ���� ������ �� �ִ� ���ÿ���<br><br>
			Ư�� ��ȹ���� �������� <b>������ö��63</b>���� ������ ���� �ϰ� ���� ���ö����? ��ä�ο� �������� �־ �����ϴ� ��̰� ����ߴ�ϴ� ����<br><br>
			 <b>��ȭ ����</b>��� �� ���� �ٳ���ô� �� ��õ�մϴ�!! <b>8~90��� �渮��� ��ȭ, SF ��ȭ, ���� ��ȭ</b> �� ���Ÿ��� ���� ������ ���Ƽ� ���� �������������~
			</p>
			</div>
			</div>
		</div>
		<div id="community_right">
		<a href="sangse.jsp?e_no=A02">
		  <div id="community_pic" style="background-image: url(images/A02.jpg); background-size: cover; background-repeat: no-repeat;"></div></a>
		  <div id="community_pic_name">
		  <a href="sangse.jsp?e_no=A02"><input type="button" id="commubutton" style="" value="�����Ϸ� ����"></a></div>
		</div>
</div>

  </div>


  	<div id="keyimageEvent">

	<p style="margin-bottom:16px; font-size:26px; display:block;"><a href="event.jsp"><b>�̺�Ʈ & ���θ�� ></b></a><br>
	  <font size='4' style="color:gray; line-height:40px;">��Ʈ�䰡 �߽����� �غ��� �̺�Ʈ! ���⿡ �� �ִ�</font></p>

	 <a href="event.jsp"><div id="keyimage2" style="background-image: url(images/eventmain1.jpg); background-repeat: no-repeat;"></div></a>
	</div>
<br>


  
  

  <br><br>

  
  <%@include file="footer.jsp" %>

</center>
</body>
</html>