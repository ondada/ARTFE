<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="css/insertOk.css">
</head>

<body>
<%

	try {
	request.setCharacterEncoding("euc-kr");



	String no = request.getParameter("no");
	String	ctg = request.getParameter("ctg");
	String	genre = request.getParameter("genre");
	String name = request.getParameter("name");
	 int price = Integer.parseInt(request.getParameter("price"));
	String place = request.getParameter("place");
	String pctg = request.getParameter("pctg");
	String term = request.getParameter("term");
	String time = request.getParameter("time");
	String description = request.getParameter("description");

 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 

 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update event set e_ctg=?, e_genre=?, ";
	 jsql = jsql + "e_name=?, e_price=?, e_place=?, e_p_ctg=?, ";
	 jsql = jsql + "e_term=?, e_time=?, e_description=? where e_no=? ";

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,ctg);
	 pstmt.setString(2,genre);
	 pstmt.setString(3,name);
	 pstmt.setInt(4,price);
	 pstmt.setString(5,place);
	 pstmt.setString(6,pctg);
	 pstmt.setString(7,term);
	 pstmt.setString(8,time);
	 pstmt.setString(9,description);
	 pstmt.setString(10,no);

	 pstmt.executeUpdate();


     //  이 이후 부분 내용은 DB상에 수정시킨 해당 레코드정보를 조회한 후, 
	 //  해당 내용을 웹브라우저로 출력해주는 코드에 해당됨
	 String jsql2 = "select * from event where e_no=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,no);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()함수를 처음 수행하면, 첫번째 레코드(즉, 수정시킨 레코드)를 가리키게 됨

	
%>

  
  <div class="userform">
    <form action="loginOk.jsp" method=post name="login">
<center><br>
     <p style="font-size:24px;"><b>행사정보 수정이 완료되었습니다.</b></p>
    <br><br>
		<div class="usertb" style="width:600px; margin:10px auto;">
	<table>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">행사번호</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_no")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">카테고리</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_ctg")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">장르</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_genre")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">행사명</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_name")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">가격</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getInt("e_price")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">장소</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_place")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">지역</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_p_ctg")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">기간</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_term")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">설명</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("e_description")%></td>
		</tr>
		
  </tr>
</table>
</div>
<br><br>

     <input type="button" class="mainbtn2" value="행사정보확인" onClick="location.href='allEvent.jsp'" style="cursor:pointer"> 
</center>
  

</form>
  
  <br><br><br><br>
  

</div>



<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div><%@include file="footer.jsp" %>
</body>
</html>