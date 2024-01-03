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

     String jsql = "select * from bookinfo";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

 <center>
  <div class="userform" >
    <form action="loginOk.jsp" method=post name="login">

    <h2><b>예매정보관리</b></h2>
    <br><br>
	<div class="usertb">
	


<%
		while(rs.next()){
			String bNo = rs.getString("bNo");   //  다음 각 함수들의 인수들은 테이블의 각 필드명들임
    		String u_id =  rs.getString("u_id");	
			String r_date = rs.getString("r_date");
    		String r_name =  rs.getString("r_name");	
			String r_address = rs.getString("r_address");
    		String b_time =  rs.getString("b_time");	
			String b_date = rs.getString("b_date");
			String r_phone = rs.getString("r_phone");
%>
	 <%

	String jsql0 = "select * from bookproduct where bNo=?";
	PreparedStatement pstmt0 = con.prepareStatement(jsql0);
	pstmt0.setString(1,bNo);

	ResultSet rs0 = pstmt0.executeQuery();


%>


<%
	
	

		String jsql2 = "select e_no, bookQty from bookproduct where bNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, bNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		rs2.next();
	

			String	e_no =  rs2.getString("e_no");	
    		int bookQty = rs2.getInt("bookQty");	

			String jsql3 = "select e_name, e_time from event where e_no = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, e_no);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	e_name =  rs3.getString("e_name");	
			String	e_time =  rs3.getString("e_time");//  goods 테이블로부터 상품명 추출

%>  
  <table style="border-collapse: collapse; width:50%;">
		 <tr rowspan=10>
			<td align=center style="color:gray; padding:10px; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>예매번호</b></td>
			<td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=bNo%></td>
			</tr>
			<tr>
			<td align=center style="color:gray; padding:10px; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>행사명</b></td>
			<td align=center style="font-size: 14px; padding:10px; width:300px; height:20px; border-bottom:1px solid #dedede;"><%=e_name%></td>
		</tr>

		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>관람일</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=b_date%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>선택회차</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=b_time%></td>
		</tr>
		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>예매수량</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=bookQty%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>예매일</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_date%></td>

		</tr>

		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>예매자</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_name%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>휴대전화</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_phone%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:200px;"><b>배송지<b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_address%></td>
		</tr>
		
 </table>
 <br><br>
 
	  <td align=center style="padding:10px; width:70px; height:40px; border-bottom:1px solid #dedede;"><a href="mngticketupdate.jsp?bNo=<%=bNo%>">
		<input type="button" class="updateButton"  value="수정"></a></td><td align=center style="padding:10px; width:70px; height:40px; border-bottom:1px solid #dedede;"><a href="mngdeletetk.jsp?bNo=<%=bNo%>">
		<input type="button" class="updateButton"  value="삭제"></a></td>
<%
		}  // while문의 끝
%>
</table>
</div>
<p>
<br>





</form>
 <br><br>
           <a href="mngindex.jsp"><input type="button" class="indexButton" value="관리자 옵션 전체보기"></a>
</div>
  


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