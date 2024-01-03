<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/mpbookinfo.css">

  <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">내 정보</a></li>
            <li style="margin-left:30px;"><a href="mpInfoUpdate.jsp" style=" font-size:17px; font-weight:500; margin-bottom:10px; color:gray;">회원정보 수정</a></li>

			<li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">예매확인</a></li>
			<li style="margin-left:30px;"><a href="mpbookinfo.jsp" style="color:#514FF0; font-size:17px; font-weight:400; margin-bottom:10px;">예매 내역</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">행사관리</a></li>
			<li style="margin-left:30px;"><a href="mpCart.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">행사바구니</a></li>
			<li style="margin-left:30px;"><a href="mpLike.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">관심행사</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">고객센터</a></li>
			 <li style="margin-left:30px;"><a href="faq.jsp" style="font-size:17px; font-weight:normal; margin-bottom:10px; color:gray;">자주 묻는 질문</a></li>

			 <li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">계정관리</a></li>
			<li style="margin-left:30px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">로그아웃</a></li>

            <br><br><br>
        </ul>  
       </div>
	 <div id="mypage2">
		<div class="book-form">
<br>
		<h2>예매 내역</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:20px;">

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe"; 
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from bookinfo where u_id = ?";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, sid);
	 ResultSet  rs = pstmt.executeQuery();

	   if(!rs.next()){
%>
<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>예매내역이 없습니다.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        행사보러 가기
    </div></center>
			
<%
        }else {
%>
		 <table style="border-collapse: collapse; width:100%;">
  <tr>
  <td id="cate" align=center>예매번호</td>
 <td id="cate" align=center>행사정보</td>
 <td id="cate" align=center>관람일</td>
 <td id="cate" align=center>선택회차</td>
  <td id="cate" align=center>예매일시</td>
 <td id="cate" align=center>예매수량</td>
  <td id="cate"></td>
 </tr>

<%

	String jsql5 = "select * from bookinfo where u_id = ?";   
	 PreparedStatement  pstmt5 = con.prepareStatement(jsql5);
	 pstmt5.setString(1, sid);
	ResultSet rs5 = pstmt5.executeQuery();
		while(rs5.next()){ 
	
			String bNo = rs5.getString("bNo");
		String u_id =  rs5.getString("u_id");			      
		String r_date = rs5.getString("r_date");
		String r_phone =  rs5.getString("r_phone");
		String r_address =  rs5.getString("r_address");
		String r_name =  rs5.getString("r_name");
		String b_date =  rs5.getString("b_date");
		String b_time =  rs5.getString("b_time");
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
  	<tr>
		

		


			<td id="con" align=center style="width:40px; height:100px; border-bottom:1px solid #dedede;"><b><%=bNo%></b></td>
  			<td id="con" align="center" style="font-size: 14px; padding:10px; width:160px; border-bottom:1px solid #dedede;"><a href="sangse.jsp?e_no=<%=e_no%>">
	<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;">
	</div></a><br></td>
			<td id="con" align=center style="width:120px; height:100px; border-bottom:1px solid #dedede;"><%=b_date%></td>
			<td id="con" align=center style=" width:80px; height:100px; border-bottom:1px solid #dedede;"><%=b_time%></td>
			<td id="con" align=center style="width:180px; height:100px; border-bottom:1px solid #dedede;"><%=r_date%></td>
			<td id="con" align=center style="width:60px; height:100px; border-bottom:1px solid #dedede; color:#514FF0;"><b><%=bookQty%></b></td>
			<td id="con" align=center style="width:60px; height:100px; border-bottom:1px solid #dedede;">
		    <b><p style="color:#514FF0"><a href="mpbookinfosangse.jsp?bNo=<%=bNo%>"><input type="button" class="deleteButton"  value="예매상세" style="cursor:pointer; "  onclick="delLike()"></a></p></b></td>

		</tr>
  		<%
		}	

%>
<%
		}   // while문의 끝
%>

	 </table>
	 
    </div>
    </div>
  </div>




  
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
    }  catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>