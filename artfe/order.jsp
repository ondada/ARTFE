<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
<%@include file="header.jsp" %>

<script language="javascript" src="js_package.js">
</script>

<link rel="stylesheet" href="css/order.css">
<body>
<center>
<%
 
	// 로그인 성공시 부여한 "sid" 속성의 속성값은 "특정회원의 아이디"를 나타내며, 
	// 이 속성값이 null인지 아닌지로 로그인 여부를 확인함. (로그인이 안된 경우, 이 값은 null값을 가짐)
	// login_ok.jsp의 초반부 코드 확인 요망!  ==> session.setAttribute("sid", id); 부분 확인요망!

if (sid == null) 
{
%>
<center>
<br><br><br> <br> <br> 
<p style="font-size:24px;">
		 <b>로그인이 필요합니다.</b> <br><br><br><br></p>
		<a href="login.jsp"> <input type="button" class="submit-btn" value="로그인하러 가기" onClick="checkValue()" style="cursor:pointer"> </a>
<br><br><br><br><br><br><br>
</font>
</center>
<%
}
else
{
 try { // (1)  (34행~151행):  tempcart 테이블에 즉시구매할 상품레코드 저장후, tempcart 내역을 그대로 보여주기 

 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String ctNo = session.getId();   // 세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장

    //   46~50행 부분:   만일, "즉시구매하기" 클릭 후, 주문을 완료하지 않고 중간에 주문을 취소시킬 경우엔, 
	//   주문하려다 취소시킨 상품내역이 그대로 tempcart 테이블에 남아있게 된다. 따라서, 이러한 문제점을 
	//   방지하기 위하여, "즉시구매하기"를 수행하기 직전에 명시적으로 tempcart 테이블을 비워주도록 처리함.
	 String jsql5 = "delete from tempcart where ctNo=?";    
	 PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	 pstmt5.setString(1, ctNo);
	
     pstmt5.executeUpdate();
    
     //   54행부터, 실제로 "즉시구매하기"와 관련된 코드부분이 시작됨.
     //  상세정보페이지(폼)으로부터 "즉시구매"하고자 하는 상품번호와 주문수량을 넘겨받는다.
	 String eNo = request.getParameter("e_no");   // 상품번호
	 int bqty = Integer.parseInt(request.getParameter("b_qty"));   //  주문수량

      // tempcart 테이블에 "즉시구매"할  상품레코드를 저장시킴
	 String jsql = "insert into tempcart (ctNo, e_no, b_qty) values (?,?,?)";  
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,ctNo);
	 pstmt.setString(2,eNo);
	 pstmt.setInt(3,bqty);	

	 pstmt.executeUpdate();

%>

<!--  (74행~269행):   order.jsp의 48행~235행과 거의 95%이상 유사한 코드를 사용하고 있음  -->
<!--  103행에서 cart 테이블이 아니라, tempcart 테이블을 사용하고 있음에 유의할 것!              -->

<%
//  [103행~151행 설명] :
//  tempcart 테이블(cart 테이블 아님!)에 담긴 상품내역을 웹페이지상에 보여주고자 할 때, 각각의 항목들이
//  상품번호(prdNo),  상품명(prdName),  상품단가(prdPrice),  주문수량(ctQty), 
//  주문액(prdPrice*ctQty ),  전체주문총액(total)으로 구성되고 있음에 유의할 것! 
//   => "즉시구매하기" 실행 후 보여지는 해당 웹페이지의 출력결과를 토대로 각 구성요소들을 확인 요망!

//  tempcart 테이블:  상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 올 수 있음.
//  goods 테이블:  상품명(prdName)과 상품단가(prdPrice) 값을 추출해 올 수 있음.
//  따라서, tempcart테이블과 goods테이블로부터, 동일한 상품번호(prdNo)에 해당하는 각 항목들의 값을 
//  추출해 올 수 있다. (mysql상에서 tempcart테이블과 goods테이블에 어떠한 필드들이 존재하는지 확인 요망!)
//  =>  <알고리즘 설명>:  tempcart테이블로부터 상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 오고, 
//         여기서 추출한 상품번호(prdNo)에 근거하여 goods테이블로부터
//         상품명(prdName)과 상품단가(prdPrice) 를 추출해 낸다.
//         이를 토대로, 주문액(prdPrice*ctQty )과  전체주문총액(total)을 계산해 낸다.
//         그런 다음, 추출해 낸 각 필드들 및 계산된 결과값들을 웹브라우저상에 출력해 준다. 


		String jsql2 = "select e_no, b_qty from tempcart where ctNo = ?";   //  tempcart 테이블을 사용함에 유의!
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 
		
		int total=0;   //  130행 참조
         
	//	while(rs2.next()) 
  	//	{			                   

		rs2.next();    //  즉시구매하기의 경우, 즉시구매할 상품레코드만 가리켜주면 됨(while문은 불필요함!)

		String e_no = rs2.getString("e_no");	    //  tempcart 테이블로부터 상품번호 추출
   		int b_qty = rs2.getInt("b_qty");	                    //  tempcart 테이블로부터 주문수량 추출 

   		String jsql3 = "select e_name, e_term, e_time, e_price, e_date from event where e_no = ?";
    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	    pstmt3.setString(1, e_no);

	    ResultSet rs3 = pstmt3.executeQuery(); 
		rs3.next();
		String	b_date = request.getParameter("e_date");
		String	b_time = request.getParameter("e_time");
		String	e_place = request.getParameter("e_place");
		String	e_name =  rs3.getString("e_name");	  //  goods 테이블로부터 상품명 추출
		int e_price =  rs3.getInt("e_price");                 //  goods 테이블로부터 상품단가 추출
		String e_term = rs3.getString("e_term");
				
				
		DecimalFormat df = new DecimalFormat("###,###");
   		int amount = e_price *b_qty;     //  주문액 계산
		total = total + amount;                  //  전체 주문총액 계산

		String r_name= "";
		String r_phone= "";
		String r_address= "";
%>

	
<form id="kakaopay" action="kakao.jsp" method="post" name="order">
<span style="align:center; font-size:30px;"><b>예매하기</b></span>

<div id="order">

 <table id="table1">

 <tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>행사 정보</b></td>
 </tr>
 <tr>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500; padding-left:35px;">상세정보</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">행사명</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">선택 날짜</td>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">회차</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">가격</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">수량</td>
 <td align=center style="color:gray; font-size: 17px;  padding-top: 20px; padding-bottom:10px; font-weight:500;"></td>
 </tr>


<tr>

	<td align="center" style="font-size: 14px; padding:10px; width:200px; ">
	<a href="sangse.jsp?e_no=<%=e_no%>">
	<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;">
	</div></a></td>
	
	<td align=center style="padding:50px 0; height:120px; width:240px; text-align:center; font-weight:600;">
	<a href="sangse.jsp?e_no=<%=e_no%>"><%=e_name%></a></td>

	<td align=center style="padding:20px; width:160px; height:100px; "><input  type="hidden" name="b_date" value="<%=b_date%>"><%=b_date%></a></td>

	<td align=center style="padding:20px; width:80px; height:100px;"><input  type="hidden" name="b_time" value="<%=b_time%>"><%=b_time%></td>

	<td align=center style="padding:20px; width:80px; height:100px;">
	<font  style="color:#514FF0; font-weight:bold;"><%=df.format(e_price)%> 원</font></td>
	
	<td align=center style=" padding:20px; width:80px;  height:100px;"><b><%=b_qty%>매</b></td>
	</tr>

	<tr style="border-top:1px solid #dedede; height:80px">
		<td colspan = 5   align="right" id="total" style="margin-top:20px;" ><b>총 결제금액 </b></td>
   <!-- 왜 hidden 처리를 해야만 하는지 orderOK.jsp를 분석하면서 곰곰히 생각해 볼 것!    -->
		<td  colspan = 2 align=center id="total" style="padding:12px;" ><input type="hidden" name="pay" value="<%=total%>" >    
		<font  style="color:#514FF0; font-weight:bold;"><%=df.format(total)%></font><b>&nbsp;원</b></td>   
	</tr>
	</table>
 

 
<%
	   //      }  // while문의 끝
 %>


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
		<td></td>
	</tr>

</table>

<br>

	    <input  type="hidden" name="e_no" value="<%=e_no%>">
	    <input  type="hidden" name="e_name" value="<%=e_name%>">
		<input  type="hidden" name="e_term" value="<%=e_term%>">
		<input  type="hidden" name="b_time" value="<%=b_time%>">
		<input  type="hidden" name="b_date" value="<%=b_date%>">
		<input  type="hidden" name="e_place" value="<%=e_place%>">
		<input  type="hidden" name="e_price" value="<%=total%>">
		<input  type="hidden" name="b_qty" value="<%=b_qty%>">
		
	</form>
	<center><div class="btn" onClick="back()">
        예매취소
    </div></center>
	<br><br><br><br><br>
<%
   }  catch(Exception e)  {
        out.println(e);
 } 

}   // if-else문의 끝
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

function back()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수

	{
		history.go(-1);
	}			


</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 


    <%@include file="footer.jsp" %></div>
</center>
</body>
</html> 