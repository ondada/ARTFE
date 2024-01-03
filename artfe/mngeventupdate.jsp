<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="css/insert.css">
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
	 String key = request.getParameter("no");   
	 String jsql = "select * from event where e_no = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

    ResultSet rs = pstmt.executeQuery(); 

	 rs.next();
			
	 String no = rs.getString("e_no");
   	 String ctg = rs.getString("e_ctg");
	 String genre = rs.getString("e_genre");
	 String name = rs.getString("e_name");
	 int price = rs.getInt("e_price");
	 String place = rs.getString("e_place");
	 String pctg = rs.getString("e_p_ctg");
	 String term = rs.getString("e_term");
	 String time = rs.getString("e_time");
	 String description = rs.getString("e_description");


%>

 <div class="login-form">
 
  <div class="userform">
    <form action="mngeventupdateResult.jsp" method=post name="eventupdate">

    <h2><b>행사정보 수정</b></h2>
    <br>
	<div class="usertb">

			  <h4><b>행사번호</b></h4>
			<input type="hidden" id="no" value="<%=no%>" name="no" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=no%></font><br><br><br>
	
			<h4><b>카테고리</b></h4>
			<input type="text" id="ctg" value="<%=ctg%>" name="ctg" class="text-field"><br><br>

			<h4><b>장르</b></h4>
			<input type="text" id="genre" value="<%=genre%>" name="genre" class="text-field"><br><br>

			<h4><b>행사명</b></h4>
			<input type="text" id="name" value="<%=name%>" name="name" class="text-field"><br><br>
			
			<h4><b>가격</b></h4>
			<input type="text" id="price" value="<%=price%>" name="price" class="text-field"><br><br>
		
			<h4><b>장소</b></h4>
			<input type="text" id="place" value="<%=place%>" name="place" class="text-field"><br><br>
		
			<h4><b>지역</b></h4>
			<input type="text" id="pctg" value="<%=pctg%>" name="pctg" class="text-field"><br><br>
		
			<h4><b>기간</b></h4>
			<input type="text" id="term" value="<%=term%>" name="term" class="text-field"><br><br>
		
			<h4><b>설명</b></h4>
			<textarea rows="10" cols="50" name="description" style="font-size:16px; width:100%; height:300px; padding:16px 16px; border: 1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif;"><%=description%></textarea>


	<br><br><br>
	<input type="button" class="submit-btn" value="수정완료" onClick="checkValue()" style="cursor:pointer"> 
	

</form>
</div> 
  
  
	<br><br>
	<br>

</div> 
</center>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
	

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.eventupdate.ctg.value == "") 
	{
		alert("카테고리를 입력해주세요. ");
		document.eventupdate.ctg.focus();
		return false;			
	}			

	if (document.eventupdate.genre.value == "") 
	{
		alert("장르를 입력해주세요.");
		document.eventupdate.genre.focus();
		return false;			
	}

	if (document.eventupdate.name.value == "") 
	{
		alert("행사명을 입력해주세요. ");
		document.eventupdate.name.focus();
		return false;			
	}

	if (document.eventupdate.place.value == "") 
	{
		alert("장소를 입력해주세요. ");
		document.eventupdate.place.focus();
		return false;			
	}

	if (document.eventupdate.pctg.value == "") 
	{
		alert("지역을 입력해주세요. ");
		document.eventupdate.pctg.focus();
		return false;			
	}

	if (document.eventupdate.term.value == "") 
	{
		alert("기간을 입력해주세요. ");
		document.eventupdate.term.focus();
		return false;			
	}


	if (document.eventupdate.description.value == "") 
	{
		alert("행사설명을 입력해주세요. ");
		document.eventupdate.description.focus();
		return false;			
	}

			eventupdate.submit();
}

	</script>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div>
<%@include file="footer.jsp" %>
</body>
</html>