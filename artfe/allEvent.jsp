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

     String jsql = "select * from event";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>
   <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700;">관리자 옵션</a></li>
            <li style="margin-left:20px;"><a href="allUser.jsp" style="font-size:17px; font-weight:400; color:gray;">회원정보관리</a></li>
			<li style="margin-left:20px;"><a href="allEvent.jsp" style="font-size:17px; font-weight:400; color:#514FF0; ">행사상품정보관리</a></li>
			<li style="margin-left:20px;"><a href="allTicket.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">예매정보관리</a></li>


			 <li><a style="font-size:20px; font-weight:600; margin-bottom:30px;"></a></li> 
			<li style="margin-left:20px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">관리자 로그아웃</a></li> 
			<br><br><br> 
</ul>  </div> 
<div id="mypage2">
  <div class="userform">
    <form action="allEvent.jsp" method=post name="login">

    <h2><b>행사상품정보관리</b></h2>
    <br><br>
	<div class="usertb">
	<table>
	<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
	<td colspan =6 height="30px" align="left" style="padding-bottom:20px; font-size:20px;"><b>전체 행사상품정보</b></td>
	<p class="insertuser" style="float:right;"><a href="mnginsertEvent.jsp"><input type="button" class="insertButton"  value="+ 신규행사 등록"></a></p>

	<tr>
	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400; padding-right:10px;">행사번호</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">카테고리</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">장르</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">행사명</td>	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">가격</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">장소</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">기간</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">설명</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
	</tr>	
<%
		while(rs.next()){
	
    		String no =  rs.getString("e_no");	
			String ctg = rs.getString("e_ctg");   //  다음 각 함수들의 인수들은 테이블의 각 필드명들임
			String genre = rs.getString("e_genre");
    		String name =  rs.getString("e_name");	
			String price = rs.getString("e_price");
    		String place =  rs.getString("e_place");	
			String term = rs.getString("e_term");
			String time = rs.getString("e_time");
			String description = rs.getString("e_description");
%>
   <tr>                     <!--  상세정보를 나타낼 페이지 링크부분에 회원 아이디를 함께 넘겨줌 -->
 	  <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><a href="selectDetailMember.jsp?e_no=<%=no%>"><%=no%></a></td>
       <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=ctg%></td>
	   <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=genre%></td>
	   <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=name%></td>
	  <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=price%></td>
 	   <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=place%></td> 
	   <td align=center style="padding:10px; width:40px; height:40px; border-bottom:1px solid #dedede;"><%=term%></td> 
	 <td align=center style="padding:10px; width:500px; height:40px; border-bottom:1px solid #dedede;"><%=description%></td> 
	   <td align=center style="padding:4px; height:40px; border-bottom:1px solid #dedede;"><a href="mngeventupdate.jsp?no=<%=no%>"><input type="button" class="updateButton"  value="수정"></a></td>
  	   <td align=center style="padding:4px; height:40px; border-bottom:1px solid #dedede;"><a href="mngdeleteEvent.jsp?no=<%=no%>">	<input type="button" class="deleteButton"  value="삭제"></a></td>
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
</div>
</center>

<script type="text/javascript">

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
			allEvent.submit();
}

	</script>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>