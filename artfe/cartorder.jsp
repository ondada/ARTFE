<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@include file="header.jsp" %>

<script language="javascript" src="js_package.js">
</script>

<link rel="stylesheet" href="css/cartorder.css">
<body>
<center>

  <%//1. 로그인여부체크 (로그인x->로그인페이지로이동)

if(sid == null){
	//로그인페이지이동
	response.sendRedirect("login.jsp");
} 
else 
	try{
	request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/artfe?autoReconnect=true";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장

	// 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
	// cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
	//  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
	//         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
	String jsql = "select * from cart where ctNo = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{                       //  따라서,  !rs.next()의 값은 true가 됨 
%>
		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>행사바구니가 비어있습니다.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        행사보러 가기
    </div></center>
<%
	}
	else
	{
%>
<form id="kakaopay" action="cartkakao.jsp" method="post" name="order">
<span style="align:center; font-size:30px;"><b>예매하기</b></span>

<div id="order">

 <table id="table1">

 <tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>행사 정보</b></td>
 </tr>

 <tr>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500; padding-left:35px;">상세정보</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">행사명</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">날짜선택</td>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">회차선택</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">가격</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">수량</td>
 <td align=center style="color:gray; font-size: 17px;  padding-top: 20px; padding-bottom:10px; font-weight:500;"></td>
 </tr>

<%

		String jsql2 = "select e_no, b_qty from cart where ctNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String e_no = rs2.getString("e_no");	//  cart테이블로부터 상품번호 추출
    		int b_qty = rs2.getInt("b_qty");	                //  cart테이블로부터 주문수량 추출 

    		String jsql3 = "select e_name, e_term, e_time, e_price, e_date from event where e_no = ?";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, e_no);

			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();
			String	e_name =  rs3.getString("e_name");	
			String	e_term =  rs3.getString("e_term");//  goods 테이블로부터 상품명 추출
			int e_price =  rs3.getInt("e_price");                 //  goods 테이블로부터 상품단가 추출
				
    		
			

				DecimalFormat df = new DecimalFormat("###,###");
				int amount = e_price * b_qty;    //  주문액 계산
				total = total + amount;                  //  전체 주문총액 계산

%> 


<tr>
<td align="center" style="font-size: 14px; padding:10px; width:200px; border-bottom:1px solid #dedede;">
	<a href="sangse.jsp?e_no=<%=e_no%>">
	<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat; border-bottom:1px solid #dedede;">
	</div></a></td>
	
	<td align=center style="padding:50px 0; height:120px; width:240px; text-align:center; font-weight:600; border-bottom:1px solid #dedede;">
	<a href="sangse.jsp?e_no=<%=e_no%>"><%=e_name%></a></td>

		<script>
		const date = new Date();
		const year = date.getFullYear();
		const month = ('0' + (date.getMonth() + 1)).slice(-1);
		const day = ('0' + date.getDate()).slice(-2);
		const dateStr = `${year}.${month}.${day}`;
		// 어떤 날짜여도 'YYYY-DD-YY'형식으로 변환!

		return(
		 <input type="date" value={b_date} />
		  )
	</script>
	<td align=center style="padding:20px; width:160px; height:100px; border-bottom:1px solid #dedede;"><input type="date" name="b_date"  id="now_date" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif; border-radius: 5px;" 
	value="{b_date} pattern = "yyyy.M.dd"/></a></td>

	<td align=center style="padding:20px; width:80px; height:100px; border-bottom:1px solid #dedede;"><select id="b_time" name="b_time" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif; border-radius: 5px;">
                <option value="1회차" name="e_time">1회차 (09:00~12:00)</option>
                <option value="2회차" name="e_time">2회차 (12:00~15:00)</option>
                <option value="3회차" name="e_time">3회차 (15:00~18:00)</option>
            </select></td>

	<td align=center style="padding:20px; width:80px; height:100px; border-bottom:1px solid #dedede;">
	<font  style="color:#514FF0; font-weight:bold;"><%=df.format(e_price)%>원</font></td>
	
	<td colspan="2" align=center style=" padding:20px; width:80px;  height:100px; border-bottom:1px solid #dedede;"><b><%=b_qty%></b></td>
	</tr>


		    <input  type="hidden" name="e_no" value="<%=e_no%>">
	    <input  type="hidden" name="e_name" value="<%=e_name%>">
		<input  type="hidden" name="e_term" value="<%=e_term%>">
		<input  type="hidden" name="e_price" value="<%=total%>">
		<input  type="hidden" name="b_qty" value="<%=b_qty%>">
 
<%
		}	

%>

	</table>
	<br>
	 <%DecimalFormat df = new DecimalFormat("###,###");%>
	<div>
		<td colspan = 5   align="right" id="total" style="margin-top:20px;" ><b>총 결제금액 : &nbsp;&nbsp;</b></td>
   <!-- 왜 hidden 처리를 해야만 하는지 orderOK.jsp를 분석하면서 곰곰히 생각해 볼 것!    -->
		<td  colspan = 2 align=center id="total" style="padding:12px;" ><input type="hidden" name="pay" value="<%=total%>" >    
		<font  style="color:#514FF0; font-weight:bold;"><%=df.format(total)%></font><b>&nbsp;원</b></td>   
	</div>

<br><br><br><br>

<br><br>
<%
	// (2)주문자 정보 출력 - 회원 테이블 정보 출력
	//String myid = (String)session.getAttribute("sid");  // 로그인했었던 주문자 정보(즉, 아이디)를 받아옮

	String jsql4 = "select u_name, u_phone from user where u_id = ?";
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1,sid);

	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();
	String  u_name = rs4.getString("u_name");
	String  u_phone = rs4.getString("u_phone");
%>

 <table id="table2">
<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>예매자 정보</b></td>
 </tr>
	<tr>
		<td align="center" style="padding-top: 20px; font-size:16px;" ><b>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b></td>
		<td width="120 "style="padding-top: 20px;">&nbsp;<%=u_name%></td>
	</tr>
	<tr>
	<td align="center" width=200 style="padding-top: 20px; font-size:16px;" ><b>전화번호</b></font></td>
	<td  colspan=3 width=474 style="padding-top: 20px;">&nbsp;<%=u_phone%></td>
	</tr>
</table>
<br>

 <table id="table2">
<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>배송 선택</b></td>
 </tr>
	<tr></tr>
	<tr>
		<td style="padding:50px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type='radio' name='delivery' value='배송' style="margin-left:30px; accent-color:#514FF0;" checked>  배송
			<input type='radio' name='delivery' value='현장수령' style="margin-left:50px; accent-color:#514FF0;">  현장수령
		</td>
	</tr>
</table>

 <table id="table3">
<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
		<td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>배송지 정보</b></td>
	</tr>
		<tr>
		<td align="center" style="padding-top: 20px; font-size:16px;" ><b>이름 <font color="#514FF0">*</font>&nbsp;</b></td>
		<td width="120 "style="padding-top: 20px;">
		<input type="text"  placeholder="이름"  id="tbinput" name="r_name" size=40 style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;"></td>
	</tr>
	<tr>
		<td align="center" width=200 style="padding-top: 20px; font-size:16px;" ><b>주소 <font color="#514FF0">*</font>&nbsp;</b></td>
		<td  colspan=3 width="474" style="padding-top: 20px;">
		<input id="address1" name="address1" type="text"  placeholder="우편번호" readonly onclick="findAddr()" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
	  <input id="addressfind" name="addressfind" type="button" value="우편번호 검색" readonly style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;" onclick="findAddr()" ><br>
	  <input id="address2" name="address2"type="text" placeholder="주소" readonly style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
	  <input id="address3" name="address3" type="text" placeholder="상세주소 입력" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
		</td>
	</tr>
		<tr>
		<td align="center" width=200 style="padding-top: 20px; font-size:16px;" ><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호 <font color="#514FF0">*</font>&nbsp;</b></td>
		<td  colspan=3 width="474" style="padding-top: 20px; margin-left:10px;">
		<select id="phone1" name="phone1" style="border:1px solid #dedede; font-weight:bold; height:40px; padding-left:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
                <option>010</option>
                <option>011</option>
                <option>012</option>
            </select> -
      <input id="phone2" name="phone2"  type="text" size="2" maxlength="4" style="border:1px solid #dedede; height:40px; padding-left:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;"> - 
      <input id="phone3" name="phone3" type="text" size="2" maxlength="4"  style="border:1px solid #dedede; height:40px; padding-left:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
		</td>
		</tr>
</table>



<% } 
      rs.close();
      pstmt.close();  
      con.close();    
 %>

 <table id="table4">
<tr style="border-bottom:3px solid #514FF0;">
		<td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>결제 방법<b></td>
	</tr>
	<tr>
	<td colspan =2 width="140px" style="padding-left:10px; padding-top: 20px; font-size:16px;" >
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio" style="accent-color:#514FF0;" checked>&nbsp;<b>간편결제</b> 
	
	</td>
		<td style="padding-top: 30px; justify-content: center;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=" " class="mainbtn" style="background-image: url(images/kakaopay.png); background-size: cover; background-repeat: no-repeat;" form="kakaopay" name="b_pay" onclick="checkValue();"></input></td>
		<td>
</td>
	</tr>

</table>

	</form>

	<center><div class="btn" onClick="back()">
        예매취소
    </div></center>
	<br><br><br><br><br>
<%
   }  catch(Exception e)  {
        out.println(e);
 } 

  // if-else문의 끝
%>

    

<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address1').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address2").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address3").value = jibunAddr;
            }
        }
    }).open();
}



function back()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수

	{
		history.go(-1);
	}			


function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.order.r_name.value == "") 
	{
		alert("성함을 입력해주세요. ");
		document.order.r_name.focus();
		return false;			
	}			

	if (document.order.address1.value == "") 
	{
		alert("배송지를 입력해주세요. ");
		document.order.address1.focus();
		return false;			
	}

	if (document.order.address2.value == "") 
	{
		alert("배송지를 입력해주세요. ");
		document.order.address2.focus();
		return false;			
	}

	if (document.order.address3.value == "") 
	{
		alert("상세주소를 입력해주세요. ");
		document.order.address3.focus();
		return false;			
	}

	if (document.order.phone1.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.order.phone1.focus();
		return false;			
	}

	if (document.order.phone2.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.order.phone2.focus();
		return false;			
	}

	if (document.order.phone3.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.order.phone3.focus();
		return false;			
	}
		document.order.submit();
}


</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 


    <%@include file="footer.jsp" %></div>
</center>
</body>
</html> 