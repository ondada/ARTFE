<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/mpInfoUpdate.css">

<%


if(sid == null){
	//로그인페이지이동
	response.sendRedirect("login.jsp");
} 
else 

	try {
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("u_id");
	String	pw = request.getParameter("pw");
	String	name = request.getParameter("name");

	String YY = request.getParameter("YY");
	String MM = request.getParameter("MM");
	String DD = request.getParameter("DD");
	String birth = YY + "-" + MM + "-" + DD;

	String address = request.getParameter("address");

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;	
	
	String	email = request.getParameter("email");

 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update user set u_pw=?, u_name=?, ";
	 jsql = jsql + "u_birth=?, u_address=?, u_phone=?, ";
	 jsql = jsql + "u_email=? where u_id=? ";

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,pw);
	 pstmt.setString(2,name);
	 pstmt.setString(3,birth);
	 pstmt.setString(4,address);
	 pstmt.setString(5,phone);
	 pstmt.setString(6,email);
	 pstmt.setString(7,sid);

	 pstmt.executeUpdate();


     //  이 이후 부분 내용은 DB상에 수정시킨 해당 레코드정보를 조회한 후, 
	 //  해당 내용을 웹브라우저로 출력해주는 코드에 해당됨
	 String jsql2 = "select * from user where u_id=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,sid);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()함수를 처음 수행하면, 첫번째 레코드(즉, 수정시킨 레코드)를 가리키게 됨

	
%> 
  
<div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">내 정보</a></li>
            <li style="margin-left:30px;"><a href="mpInfoUpdate.jsp" style="color:#514FF0; font-size:17px; font-weight:500; margin-bottom:10px;">회원정보 수정</a></li>

			<li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">예매확인</a></li>
			<li style="margin-left:30px;"><a href="mpbookinfo.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">예매 내역</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">행사관리</a></li>
			<li style="margin-left:30px;"><a href="mpCart.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">행사바구니</a></li>
			<li style="margin-left:30px;"><a href="mpLike.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">관심행사</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">고객센터</a></li>
			 <li style="margin-left:30px;"><a href="faq.jsp" style="font-size:17px; font-weight:normal; margin-bottom:10px; color:gray;">자주 묻는 질문</a></li>

			 <li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">계정관리</a></li>
			<li style="margin-left:30px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">로그아웃</a></li>
			<li style="margin-left:30px;"><a href="deleteuser.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">회원 탈퇴</a></li>
            <br><br><br>
        </ul>  
       </div>
	 <div id="mypage2">
		<div class="login-form">
<br>
  <h2>회원정보 수정</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:50px;">
  <center><h1 style="margin-top:110px;"><b>회원정보 수정이 완료되었습니다.</b></h1></center><br><br><br><br><br>
   <center><div class="btn" onclick="location.replace('main.jsp')">
        메인으로 가기
    </div></center>
</div></div></div>
<br><br><br><br><br><br><br>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
   <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>