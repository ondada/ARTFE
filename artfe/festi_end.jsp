<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>

<link rel="stylesheet" href="css/festi_end.css">

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

	String jsql1 = "select * from event where e_no = 'B09'";   
	PreparedStatement pstmt1 = con.prepareStatement(jsql1);
	ResultSet rs1 = pstmt1.executeQuery();
	rs1.next();

	String jsql2 = "select * from event where e_no = 'B10'";   
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();

	String jsql3 = "select * from event where e_no = 'B11'";   
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();

	String jsql4 = "select * from event where e_no = 'B12'";   
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();

	String e_no1 = rs1.getString("e_no");
	 String e_name1 =  rs1.getString("e_name");		
	 String e_term1 =  rs1.getString("e_term");		
	 String e_place1 =  rs1.getString("e_place");		

	String e_no2 = rs2.getString("e_no");
	  String e_name2 =  rs2.getString("e_name");		
	 String e_term2 =  rs2.getString("e_term");		
	 String e_place2 =  rs2.getString("e_place");	

	String e_no3 = rs3.getString("e_no");
	  String e_name3 =  rs3.getString("e_name");		
	 String e_term3 =  rs3.getString("e_term");		
	 String e_place3 =  rs3.getString("e_place");	

	String e_no4 = rs4.getString("e_no");
	  String e_name4 =  rs4.getString("e_name");		
	 String e_term4 =  rs4.getString("e_term");		
	 String e_place4 =  rs4.getString("e_place");	
%>


	
  <br>

  <div id="content">
	  <div id="festi">
		  <h2>����� ����</h2>
		    </div>
		  <span class="side">
		  <a href="festi_ing.jsp">����</a>&nbsp; |&nbsp;
		  <a href="festi_coming.jsp">����</a>
			</span>
	
	<br><br><br><br><br><br>
    <a href="sangseNonPrice.jsp?e_no=<%=e_no1%>">
	<div id="section1" style="background-image: url(images/<%=e_no1%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
			
		<div id="sec-content1">
		  <h2><%= e_name1 %></h2>
		  <p><%=e_term1 %></p>
		  <p><%=e_place1 %></p>
		  <br><br>
		   <b><p style="color:#514FF0">����</p></b>
				
    </div>
    </a>
	  
	    <a href="sangseNonPrice.jsp?e_no=<%=e_no2%>">
			<div id="section2" style="background-image: url(images/<%=e_no2%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
			<div id="sec-content2">
		  <h2><%= e_name2 %></h2>
		  <p><%=e_term2 %></p>
		  <p><%=e_place2 %></p>
		  <br><br>
		  <b><p style="color:#514FF0">����</p></b>
		
    </div>
		</a>
		
	</div>
<br><br><br><br><br><br><br>
  
	<div id="content">

	<br><br><br>
    <a href="sangseNonPrice.jsp?e_no=<%=e_no3%>">
	<div id="section1" style="background-image: url(images/<%=e_no3%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
			
		<div id="sec-content1">
		  <h2><%= e_name3 %></h2>
		  <p><%=e_term3 %></p>
		  <p><%=e_place3 %></p>
		  <br><br><br>
		  <b><p style="color:#514FF0">����</p></b>
				
    </div>
    </a>
	  
	    <a href="sangseNonPrice.jsp?e_no=<%=e_no4%>">
			<div id="section2" style="background-image: url(images/<%=e_no4%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
 
			<div id="sec-content2">
		  <h2><%= e_name4 %></h2>
		  <p><%=e_term4 %></p>
		  <p><%=e_place4 %></p>
		  <br><br><br>
		  <b><p style="color:#514FF0">����</p></b>
		
    </div>
		</a>
		
	</div>
	
<br><br><br><br><br><br><br>
			<div id="page">
		<font size="4px" color="white">
		<span style="width:50px; background:#eee; border-radius:10px; ">&nbsp;&nbsp
	<b><a href="festi_end.jsp">1 &nbsp; </a></b>
	<a href="festi_end.jsp">2 &nbsp; </a>
	<a href="festi_end.jsp">3 &nbsp; </a>
	<a href="festi_end.jsp">4 &nbsp; </a>
	<a href="festi_end.jsp">5 &nbsp; </a>
	<a href="festi_end.jsp">6 &nbsp; </a>
	<a href="festi_end.jsp">7 &nbsp; </a>
	<a href="festi_end.jsp">8 &nbsp; </a>
	<a href="festi_end.jsp">9 &nbsp; </a>
	<a href="festi_end.jsp">></a>
	&nbsp;&nbsp</span>
</font>
	</div>
<br><br><br><br><br><br><br>
  <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>