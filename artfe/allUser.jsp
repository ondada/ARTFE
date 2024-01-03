<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/allUser.css">

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe"; 
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from user";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

 <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700;">관리자 옵션</a></li>
            <li style="margin-left:20px;"><a href="allUser.jsp" style="font-size:17px; color:#514FF0; font-weight:400;">회원정보관리</a></li>
			<li style="margin-left:20px;"><a href="allEvent.jsp" style="font-size:17px; font-weight:400; color:gray;">행사상품정보관리</a></li>
			<li style="margin-left:20px;"><a href="allTicket.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">예매정보관리</a></li>


			 <li><a style="font-size:20px; font-weight:600; margin-bottom:30px;"></a></li> 
			<li style="margin-left:20px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">관리자 로그아웃</a></li> 
			<br><br><br> 
</ul>  </div> 
<div id="mypage2">
  <div class="userform">
    <form action="loginOk.jsp" method=post name="login">

    <h2>회원정보관리</h2>
    <br><br>
	<div class="usertb">
	
	<table>
	<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
	<td colspan =6 height="30px" align="left" style="padding-bottom:20px; font-size:20px;"><b>전체 회원정보</b></td>
<p class="insertuser" style="float:right;"><a href="mnginsertuser.jsp"><input type="button" class="insertButton"  value="+ 신규회원 등록"></a></p>
	
	</tr>
	<tr>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">아이디</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">비밀번호</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">이름</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">생년월일</td>	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">휴대폰번호</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">주소</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">이메일</td>
		<td align=center style="padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
		<td align=center style="padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("u_id");   //  다음 각 함수들의 인수들은 테이블의 각 필드명들임
    		String pw =  rs.getString("u_pw");	
			String name = rs.getString("u_name");
    		String birth =  rs.getString("u_birth");	
			String phone = rs.getString("u_phone");
    		String address =  rs.getString("u_address");	
			String email = rs.getString("u_email");
%>
   <tr>                     <!--  상세정보를 나타낼 페이지 링크부분에 회원 아이디를 함께 넘겨줌 -->
 	  <td align=center style="padding:10px; width:50px; height:40px; border-bottom:1px solid #dedede;"> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td align=center style="padding:10px; width:50px; height:40px; border-bottom:1px solid #dedede;"><%=pw%></td>
	  <td align=center style="padding:10px; width:50px; height:40px; border-bottom:1px solid #dedede;"><%=name%></td>
	  <td align=center style="padding:10px; width:100px; height:40px; border-bottom:1px solid #dedede;"><%=birth%></td>
	  <td align=center style="padding:10px; width:100px; height:40px; border-bottom:1px solid #dedede;"><%=phone%></td>
 	  <td align=center style="padding:10px; width:240px; height:60px; border-bottom:1px solid #dedede;"><%=address%></td> 
	  <td align=center style="padding:10px; width:80px; height:40px; border-bottom:1px solid #dedede;"><%=email%></td> 
	  <td align=center style="padding:10px; width:30px; height:40px; border-bottom:1px solid #dedede;"><a href="mnguserupdate.jsp?id=<%=id%>">
		<input type="button" class="updateButton"  value="수정"></a></td>
  	  <td align=center style="padding:10px; width:30px; height:40px; font-size:15px; border-bottom:1px solid #dedede;"><a href="mngdeleteuser.jsp?id=<%=id%>">
		<input type="button" class="deleteButton"  value="삭제"></a></td>
  </tr>
<%
		}  // while문의 끝
%>
</table>
</div>
<p>
<br>





</form>
 <br><br>
</div></div></div>
  


  <br><br>
  
   <%@include file="footer.jsp" %>

</center>

<script type="text/javascript">

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.login.id.value == "") 
	{
		alert("아이디를 입력해주세요. ");
		document.login.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("비밀번호를 입력해주세요. ");
		document.login.pw.focus();
		return false;			
	}

			login.submit();
}

	</script>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>