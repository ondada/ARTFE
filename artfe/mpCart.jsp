<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/mpCart.css">

  <%//1. 로그인여부체크 (로그인x->로그인페이지로이동)

if(sid == null){
	//로그인페이지이동
	response.sendRedirect("login.jsp");
} 
else 
	try{
	request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	     //  로그인폼(login.jsp)에서 입력한 ID를 포함한 레코드를 member 테이블에서 조회함
    String jsql00 = "select  *  from user where u_id = ? "; 
    PreparedStatement pstmt00 = con.prepareStatement(jsql00);
    pstmt00.setString(1, sid);
    ResultSet rs00 = pstmt00.executeQuery(); 
	 rs00.next();
			
	 String id = rs00.getString("u_id");

	%>

 <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">내 정보</a></li>
            <li style="margin-left:30px;"><a href="mpInfoUpdate.jsp" style=" font-size:17px; font-weight:500; margin-bottom:10px; color:gray;">회원정보 수정</a></li>

			<li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">예매확인</a></li>
			<li style="margin-left:30px;"><a href="mpbookinfo.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">예매 내역</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">행사관리</a></li>
			<li style="margin-left:30px;"><a href="mpCart.jsp" style="color:#514FF0; font-size:17px; font-weight:400; margin-bottom:-10px;">행사바구니</a></li>
			<li style="margin-left:30px;"><a href="mpLike.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">관심행사</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">고객센터</a></li>
			 <li style="margin-left:30px;"><a href="faq.jsp" style="font-size:17px; font-weight:normal; margin-bottom:10px; color:gray;">자주 묻는 질문</a></li>

			 <li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">계정관리</a></li>
			<li style="margin-left:30px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">로그아웃</a></li>
			<li style="margin-left:30px;"><a href="deleteuser.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">회원 탈퇴</a></li>
            <br><br><br>
        </ul>  
       </div>
    <div id="mypage2">
      <div class="book-form">

	  <br>
		<h2>행사바구니</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:20px;">

<form name="form" action="cartorder.jsp" method="post">

 <%
 

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
 <table style="border-collapse: collapse; width:100%;">
  <tr>
  
  <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">행사명</td>
 <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">기간</td>
 <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">수량</td>
  <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">가격</td>
 <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">상세정보</td>
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
			

		    String	e_date = request.getParameter("e_date");
		    String	e_time = request.getParameter("e_time");
			String	e_name =  rs3.getString("e_name");	
			String	e_term =  rs3.getString("e_term");//  goods 테이블로부터 상품명 추출
			int e_price =  rs3.getInt("e_price");                 //  goods 테이블로부터 상품단가 추출
				
    		
			

				DecimalFormat df = new DecimalFormat("###,###");
				int amount = e_price * b_qty;    //  주문액 계산
				total = total + amount;                  //  전체 주문총액 계산

%> 
        	<tr>
		
			 
	<input  type="hidden" name="e_no" value="<%=e_no%>">
         <td id="con" align=center style="padding:50px 0; height:100px; width:160px; text-align:center; font-weight:600; border-bottom:1px solid #dedede;">
		 <a href="sangse.jsp?e_no=<%=e_no%>"><%=e_name%></a></td>

  			<td id="con" align=center style="padding:20px; width:140px; height:100px; border-bottom:1px solid #dedede;">
	<a href="sangse.jsp?e_no=<%=e_no%>" style="color:gray;"><%=e_term%></a></td>

				<td id="con" align=center style="width:40px; height:100px; border-bottom:1px solid #dedede;"><b><%= b_qty%></b></td>

			<td id="con" align=center style="width:80px; height:100px; color:#514FF0; font-weight:bold; border-bottom:1px solid #dedede;"><%=df.format(amount)%>원</td>

			<td id="con" align="center" style="width:160px; border-bottom:1px solid #dedede;">
			<a href="sangse.jsp?e_no=<%=e_no%>">
			<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;">
			</div></a></td>

			<td align="left" style="width:60px; border-bottom:1px solid #dedede; margin-right:40px;"><a href="deletecart.jsp?e_no=<%=e_no%>"><input type="button" class="deleteButton"  value="삭제"  onclick="delcart()"></td>
		</tr>
		
	   <input  type="hidden" name="e_no" value="<%=e_no%>">
	  <input  type="hidden" name="e_name" value="<%=e_name%>">
	  <input  type="hidden" name="e_term" value="<%=e_term%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
<% } 
      rs.close();
      pstmt.close();  
      con.close();    
 %>

 </table>
 <%DecimalFormat df = new DecimalFormat("###,###");%>
<span style="float:left; width:140px; height:100px; margin-top:40px; font-size:20px; padding-left:30px; margin-bottom:20px;">
         <b>총 결제금액 </b>
         <input name="total" type="text" size="10" placeholder="0" readonly style="border:none; color:#514FF0;  margin-top:10px; font-weight:bold; font-size:30px;" value="<%=df.format(total)%>원">
         </span>
         <span style="float:right;  margin-top:36px; font-size:20px; padding-left:30px;">
         <input type="submit" value=" " class="mainbtn" onclick="directOrd()" style="background-image: url(images/kakaopay.png); background-size: cover; background-repeat: no-repeat;"></input>
		 

</form>
<br><br><br><br>
<%
		}	

%>


   </div>
    </div>
  </div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
   <script type="text/javascript">
function delcart(){

			alert('행사바구니에서 삭제되었습니다.');
			document.location.href="deletecart.jsp";
	}

var i = 0;
function cartSum(frm)
{


   var sum = 0;


   var count = frm.chk.length;
   for(var i=0; i<count; i++ ){
       if( frm.chk[i].checked == true ){ 
       sum = sum + parseInt(frm.chk[i].value);
       }
   }
   

   frm.total.value = sum.toLocaleString() + "원";
   return sum;
}

					function directOrd()        //  "즉시구매하기" 버튼을 클릭시 호출
		{
			var str=directOrd.e_no.value;
			var frm = document.directOrd;
			frm.action = "order.jsp";
			frm.submit();
		}

      
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
</center>
</body>
</html>