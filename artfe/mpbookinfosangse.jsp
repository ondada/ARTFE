<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<h2>예매상세</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:20px;">



 <%//1. 로그인여부체크 (로그인x->로그인페이지로이동)
if(sid == null){
	//로그인페이지이동
	response.sendRedirect("login.jsp");
} 
else 
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
			String r_phone = rs.getString("r_phone");
			String delivery = rs.getString("delivery");
	 

	
	if(rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{                       //  따라서,  !rs.next()의 값은 true가 됨 
%>

		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>예매내역이 없습니다.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
         행사보러 가기
    </div></center>

<%
	}
	else
	{

	 rs.next();
	%>

 <%

	String jsql0 = "select * from bookproduct where bNo=?";
	PreparedStatement pstmt0 = con.prepareStatement(jsql0);
	pstmt0.setString(1,bNo);

	ResultSet rs0 = pstmt0.executeQuery();


%>

 <%

	String jsql6 = "select * from bookinfo where r_date=?";
	PreparedStatement pstmt6 = con.prepareStatement(jsql6);
	pstmt6.setString(1,bNo);

	ResultSet rs6 = pstmt6.executeQuery();


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

<table style="border-collapse: collapse; width:100%;">
	<tr>
		 <td rowspan=10 align="center" style="font-size: 14px; width:50%; "><a href="sangse.jsp?e_no=<%=e_no%>">
			<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;">
			</div></a></td>
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
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=bookQty%>매</td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>예매일</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;">
			 <%=r_date%>
</td>

		</tr>

		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>예매자</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_name%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>휴대전화</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_phone%></td>
			 </tr>
			 <tr rowspan=10>
			<td align=center style="color:gray; padding:10px; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>배송여부</b></td>
			<td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=delivery%></td>
			</tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:200px;"><b>배송지<b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_address%></td>
		</tr>
		
 </table>
 <br><br><br><br><br>
<b><p style="color:#514FF0; margin-top:2px; float:right;"><a href="deletebook.jsp?bNo=<%=bNo%>"><input type="button" class="deleteButton"  value="예매취소" style="cursor:pointer; "  onclick="delLike()"></a></p></b>
 <br><br><br><br><br>
		  <%  } 	

	  rs.close();         
      pstmt.close();  
      con.close();     
 %>
<%


%>
    </div>
    </div>
  </div>
  
  <br><br>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
		
		 var mpmenu = document.getElementsByClassName("mpmenu");

      function handleClick(event) {
        console.log(event.target);
        // console.log(this);
        // 콘솔창을 보면 둘다 동일한 값이 나온다

        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
          event.target.classList.remove("clicked");
        } else {
          for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
          }

          event.target.classList.add("clicked");
        }
      }

      function init() {
        for (var i = 0; i < mpmenu.length; i++) {
          mpmenu[i].addEventListener("click", handleClick);
        }
      }

      init();






	</script>
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