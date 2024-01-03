<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<html><head><title>ARTFE</title>


<link rel="stylesheet" href="css/deleteuser.css">
<link rel="icon" href="images/logo.png">
</head>
<body>

<%
	try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


     //  로그인폼(login.jsp)에서 입력한 ID를 포함한 레코드를 member 테이블에서 조회함
	 String key = request.getParameter("bNo");   
	 String jsql = "select * from bookinfo where bNo = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);


  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

			String bNo = rs.getString("bNo");   //  다음 각 함수들의 인수들은 테이블의 각 필드명들임
    		String u_id =  rs.getString("u_id");	
			String r_date = rs.getString("r_date");
    		String r_name =  rs.getString("r_name");	
			String r_address = rs.getString("r_address");
    		String b_time =  rs.getString("b_time");	
			String b_date = rs.getString("b_date");
			String phone = rs.getString("r_phone");


%>

	<div class="userform">
    <form action="mngdeleteEventResult.jsp" method=post name="login">
	<center><br>
	<h2><b>다음의 예매정보를 삭제하시겠습니까?</b></h2>
<br><br>
	<div class="usertb" style="width:600px; margin:10px auto;">
		<table>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">예매번호</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("bNo")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">아이디</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("u_id")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">예매자명</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_name")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">예매일</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_date")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">관람일</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("b_date")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">선택회차</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("b_time")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">배송지</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_address")%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">휴대전화</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=rs.getString("r_phone")%></td>
		</tr>
		
  </tr>
</table>
</div>
<br><br>

<a href="mngdeleteTkResult.jsp?bNo=<%=bNo%>" ><input type="button" class="userdelete" value="예매 삭제" onClick="checkValue()" style="cursor:pointer"></a>&nbsp;&nbsp;
<a href="allEvent.jsp"><input type="reset" class="userdeleteno" value="취소" onClick="location.href='allTicket.jsp'" style="cursor:pointer"> </a>
  <br><br><br><br>
  <br><br>
  
  <%@include file="footer.jsp" %>
</div>
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