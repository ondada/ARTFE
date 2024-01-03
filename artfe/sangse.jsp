<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/sangse.css">

<%

	request.setCharacterEncoding("euc-kr");

    String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
     
    Class.forName("org.gjt.mm.mysql.Driver"); 
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

   String key = request.getParameter("e_no");   //  상세조회하고자 하는 상품번호를 넘겨받아옴

    String jsql = "select * from event where e_no = ?";   
   PreparedStatement pstmt  = con.prepareStatement(jsql);
   pstmt.setString(1, key);

   ResultSet rs = pstmt.executeQuery();
    rs.next();

   String e_no = rs.getString("e_no");
   String e_name =  rs.getString("e_name");               
   String e_term = rs.getString("e_term");
   String e_place =  rs.getString("e_place");
   String e_price = rs.getString("e_price");
   String e_time = rs.getString("e_time");
   String e_description =  rs.getString("e_description");
   String e_genre =  rs.getString("e_genre");
   String e_img =  rs.getString("e_img");
   String e_site =  rs.getString("e_site");
   String e_map =  rs.getString("e_map");
   String e_ctg = rs.getString("e_ctg");
   String e_date = rs.getString("e_date");
   String e_mindate = rs.getString("e_mindate");
   String e_maxdate = rs.getString("e_maxdate");


	DecimalFormat df = new DecimalFormat("###,###");
	int sum = Integer.parseInt(rs.getString("e_price"));

%>

<form id="cart" method="get" action="inCart.jsp">

 <div id="content">

	  <input  type="hidden" name="e_no" value="<%=e_no%>">
	  <div id="sectionPic" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></div> 

	  <div id="sectionContent">
         
		 <p style="font-size:17px;"><%=e_ctg%> <font color="#b0b0b0">|</font> <%=e_genre%></p>

        <h1 style="display:inline-block;"><%= e_name%></h1>
        <p style="color:gray; margin:10px 0px;"><%=e_term%></p>
      <p style="margin-bottom:30px;"><%=e_place %></p>
<font style="font-weight: 500;">
      날짜선택 &nbsp;&nbsp; 
			 <form>
			  <input type="date" min="<%=e_mindate%>" max="<%=e_maxdate%>"name="e_date" value="e_date" id="now_date">
			
			<br>

              회차선택 &nbsp;&nbsp;

			   <select id="e_time" name="e_time">
                <option value="1회차" name="e_time">1회차 (09:00~12:00)</option>
                <option value="2회차" name="e_time">2회차 (12:00~15:00)</option>
                <option value="3회차" name="e_time">3회차 (15:00~18:00)</option>
            </select>
       
	   <input  type="hidden" name="e_no" value="<%=e_no%>">
	  <input  type="hidden" name="e_name" value="<%=e_name%>">
	  <input  type="hidden" name="e_term" value="<%=e_term%>">
	    <input  type="hidden" name="e_place" value="<%=e_place%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
          <br>

		 예매수량 &nbsp;&nbsp;</font>
		  
<div id="qtyDiv"><form>
<input type="button" id="qtySub" value="-" onClick="javascript:this.form.b_qty.value--; subNum()">
<input type="text" id="b_qty" name="b_qty" value="1" onblur="javascript:amountCheck();">
<input type="button" id="qtyAdd" value="+" class="qtyButton2" onClick="javascript:this.form.b_qty.value++; addNum()">
</form></div>

<br>
		<span style="color:black; font-weight:500; float:left;">티켓금액&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "text" id="result" class="txtNumResult" disabled="disabled" value="<%=df.format(sum)%>원" onKeyup="inputNumberAutoComma(this);"><span style="color:#514FF0; font-size:20px; font-weight:bold; border: none; width:80px; font-family: Pretendard Variable, sans-serif;"></span>


               
		<div id="heartBox">
        <input type="submit" class="btn1" value="행사바구니 담기" onClick="javascript:inCart()"><input type="image" name=e_no  src="images/heart.png" id="test" form="like" onclick="document.getElementById('like').submit(); toggle_object(1); return false;"><iframe id="iframe1" name="iframe1" style="visibility:hidden; display:none;"></iframe></div>
		<br><div id="heartBox">
		 <input type="submit" name="directOrd" formaction="order.jsp" class="btn2" value="예매하기" onClick="javascript:directOrd()"></div>
		</div>
  
</form>

<br><br>

	<table class="thesangse">
		<tr>
			<td><a id="button1" class="button" href="#sectionInfoA">행사 소개</a></td>
			<td><a id="button2" class="button" href="#place">행사 장소</a></td>
			<td><a id="button3" class="button" href="#cancel">취소/환불</a></td>
			<td><a id="button4" class="button" href="#website">관련 사이트</a></td>
		</tr>
	</table>

	<div id="sectionInfoA"></div>
 <br> <br><br><br>
<div id="sectionInfo" >

	<input  type="hidden" name="e_img" value="<%=e_img%>">
	  <div id="infopic" style="background-image: url(images/<%=e_img%>.jpg); background-size: cover; background-repeat: no-repeat;"></div> 

	<div id="description">
	<h1 style="margin-top: 40px;"> <%=e_name%></h1>
	<p style="font-size:20px; color:gray; font-weight:300;"><input  type="hidden" name="e_term" value="<%=e_term%>"><%=e_term%></p>
	<p style="color:#514FF0; margin-top: 120px;  font-size:24px; font-weight:bold;">행사 소개</p>
	<hr id="hrInfo">
	<p style="margin-top: 10px; font-size:19px; font-weight:normal;"><input  type="hidden" name="e_description" value="<%=e_description%>"><%=e_description%></p>
	</div>
	
	<div id="place" ><br><br><br>
	<p style="color:#514FF0; font-size:24px; font-weight:bold; margin-top:4px;">행사 장소</p>
	<hr id="hrInfo">
	<p style=" font-size:19px; font-weight:500; margin-bottom:20px;"><input  type="hidden" name="e_description" 
	value="<%=e_place%>"><%=e_place%></p>
	<div id="map" >
		<%=e_map%>
	</div>
	</div>

	<div id="cancel"><br><br><br>
	<p style="color:#514FF0; font-size:24px; font-weight:bold; margin-top:6px;">취소 및 환불 규정</p>
	<hr id="hrInfo">
	<p style=" font-size:18px; font-weight:400; color:gray; line-height:30px;">
- 행사의 취소/환불 기간은 행사 호스트가 설정한 신청기간과 동일합니다.<br>
- 결제 수단, 환불 신청 시점, 환불 사유에 따라 환불 수수료가 부과될 수 있습니다.<br>
- 위에 대한 자세한 내용은 ‘취소 및 환불규정’에서 확인할 수 있습니다.<br>
- 신청기간 마감 이후의 신청 정보 수정 및 취소/환불은 행사 호스트에게 문의 부탁드립니다.<br>
<span style="color:#e61919;">*아트페는 통신판매 중개자이며, 해당 행사의 호스트가 아닙니다.</span></p>
	</div>

	<div id="website"><br><br><br>
	<p style="color:#514FF0; font-size:24px; font-weight:bold; margin-top:6px;">관련 사이트</p>
	<hr id="hrInfo">
	<p style="color:gray; font-size:19px; font-weight:400;"><input  type="hidden" name="" 
	value=""><a href="<%=e_site%>"><%=e_site%></a></p>
	</div>


</div>
  </div>

<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>


  <%@include file="footer.jsp" %>
  
</div>
<form id="like" action="inLike.jsp" method="get" target="iframe1">
		<input  type="hidden" name=e_no value="<%=e_no%>">
	    <input  type="hidden" name="e_name" value="<%=e_name%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
		<input  type="hidden" name="e_term" value="<%=e_term%>">
</form>


</center>
<%  
	  rs.close();         
      pstmt.close();  
      con.close();     
 %>
<script language="javascript" src="js_package.js">
</script>

<script>

document.getElementById('now_date').valueAsDate = new Date();




		function inCart(){
				if (sid == null) {
				}
				
				else{
					alert('행사바구니에 추가되었습니다.');
					var str=cart.b_qty.value;
					var frm = document.cart;
					frm.action = "inCart.jsp";
					frm.submit();

			}
			
					function directOrd()        //  "즉시구매하기" 버튼을 클릭시 호출
		{
			var str=directOrd.e_no.value;
			var frm = document.directOrd;
			frm.action = "order.jsp";
			frm.submit();
		}


		function ChangeValue(){
			var valur_str = document.getElementById('select_value');
			alert("value:" + value_str.options[value_str.selectedIndex].value +
				"text:" + value_str.options[value_str.selectedIndex].text);
		}
function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}

function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}

function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}
}

 document.getElementById("button1").style.color ="#514FF0";
document.getElementById("button1").style.borderBottom ="3px solid #514FF0";

document.getElementById("button1").style.paddingBottom ="18px";
document.getElementById("button2").style.paddingBottom ="18px";
document.getElementById("button3").style.paddingBottom ="18px";
document.getElementById("button4").style.paddingBottom ="18px";

document.getElementById("button2").style.color ="gray";
document.getElementById("button3").style.color ="gray";
document.getElementById("button4").style.color ="gray";


document.getElementById("button1").onclick = function(){
            this.style.color ="#514FF0";
			this.style.borderBottom ="3px solid #514FF0";
			
			document.getElementById("button2").style.border ="none";
			document.getElementById("button3").style.border ="none";
			document.getElementById("button4").style.border ="none";

            document.getElementById("button2").style.color ="gray";
			document.getElementById("button3").style.color ="gray";
			document.getElementById("button4").style.color ="gray";
        };

document.getElementById("button2").onclick = function(){
             this.style.color ="#514FF0";
			 this.style.borderBottom ="3px solid #514FF0";

			 document.getElementById("button1").style.border ="none";
			document.getElementById("button3").style.border ="none";
			document.getElementById("button4").style.border ="none";

			 document.getElementById("button1").style.border ="none";
            document.getElementById("button1").style.color ="gray";
			document.getElementById("button3").style.color ="gray";
			document.getElementById("button4").style.color ="gray";
        };
document.getElementById("button3").onclick = function(){
             this.style.color ="#514FF0";
			 this.style.borderBottom ="3px solid #514FF0";

			 document.getElementById("button1").style.border ="none";
			document.getElementById("button2").style.border ="none";
			document.getElementById("button4").style.border ="none";

            document.getElementById("button1").style.color ="gray";
			document.getElementById("button2").style.color ="gray";
			document.getElementById("button4").style.color ="gray";
        };
 document.getElementById("button4").onclick = function(){
             this.style.color ="#514FF0";
			 this.style.borderBottom ="3px solid #514FF0";

			 document.getElementById("button1").style.border ="none";
			document.getElementById("button2").style.border ="none";
			document.getElementById("button3").style.border ="none";

            document.getElementById("button1").style.color ="gray";
			document.getElementById("button2").style.color ="gray";
			document.getElementById("button3").style.color ="gray";
        };



</script>





</body>

</html>


