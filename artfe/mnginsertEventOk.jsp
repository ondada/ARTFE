<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="stylesheet" href="css/insertOk.css">
<link rel="icon" href="images/logo.png">

</head>

<body>
  
<%

	request.setCharacterEncoding("euc-kr");  // 입력폼에서 전송된 한글데이터 처리

	// 입력폼에서 받는 데이터는 모두 String형임
    String e_ctg = request.getParameter("e_ctg");
	String e_no = request.getParameter("e_no");
	String e_name = request.getParameter("e_name");
	String e_genre = request.getParameter("e_genre");
	String e_term = request.getParameter("e_term");
	String e_time = request.getParameter("e_time");
	
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String e_place = address1 + " " + address2 +  " " +address3;

	String e_p_ctg = request.getParameter("e_p_ctg");
	String e_description = request.getParameter("e_description");
   	int e_price =  Integer.parseInt(request.getParameter("e_price")); // String => int 변환

		

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	  Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
     // DB에 접속           

	//SQL문 작성 : 테이블 필드명
    String jsql = "INSERT INTO event  (e_ctg, e_no, e_name, e_genre, e_term, ";
	jsql = jsql + "e_time, e_place, e_p_ctg, e_description, e_price)  VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
      
    //PreparedStatement 생성(SQL문의 형틀을 정의함)
	PreparedStatement pstmt = con.prepareStatement(jsql); 

	//위의 SQL문에서 ?에 해당되는 곳에 다음의 값들을 하나씩 할당함 (인수 전달)
	//정수형의 경우에는 setInt()를 사용함
    pstmt.setString(1, e_ctg); 
	pstmt.setString(2, e_no); 
    pstmt.setString(3, e_name);
	pstmt.setString(4, e_genre);
	pstmt.setString(5, e_term);
	pstmt.setString(6, e_time);
	pstmt.setString(7, e_place);
	pstmt.setString(8, e_p_ctg);
	pstmt.setString(9, e_description);
	pstmt.setInt(10, e_price);

	pstmt.executeUpdate(); // SQL문 실행

  } catch(Exception e) { 
		out.println(e);
}


	
%>

 <div class="login-form2">
 <center><br>
     <p style="font-size:24px;"><b>신규행사 등록이 완료되었습니다.</b></p>
    <br><br>

<div class="usertb" style="width:600px; margin:10px auto;">
 <table>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">카테고리</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_ctg%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">행사번호</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_no%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">행사명</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_name%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">장르</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_genre%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">기간</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_term%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">회차</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_time%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">행사 장소</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_place%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">지역</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_p_ctg%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">행사 설명</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_description%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">가격</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_price%> 원</td></tr>
</table>
<br><br>
<input type="button" class="mainbtn" value="행사상품 정보확인" onClick="location.href='allEvent.jsp'" style="cursor:pointer"> 
    </center>
</form>
      
       
  
  <br><br>
 
</div>
</center>
</div><%@include file="footer.jsp" %>
</body>
</html>