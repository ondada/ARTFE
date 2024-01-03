  <%@ page contentType="text/html;charset=euc-kr" %>
   <%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="euc-kr">
<title>kakao</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="icon" href="images/logo.png">
</head>
<body>

 <form action="orderOk.jsp" method="get" onclick="this.submit();">

<%

	request.setCharacterEncoding("euc-kr");

	String e_name = request.getParameter("e_name");
    String sPrice = request.getParameter("e_price");
    int e_price = Integer.parseInt(sPrice);
	String e_no =  request.getParameter("e_no");
	String e_term = request.getParameter("e_term");
	String e_place = request.getParameter("e_place");
	String delivery = request.getParameter("delivery");

	String r_name = request.getParameter("r_name");
	String total = request.getParameter("r_amount");
	String r_grade = request.getParameter("r_grade");
	String r_pay = request.getParameter("r_pay");

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");

	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");

	String e_date = request.getParameter("b_date");
	String e_time = request.getParameter("b_time");

%>

    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%=e_name%>',
            amount : <%=e_price%>,
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href="reserveOk.jsp?e_no="+e_no+"&e_place="+e_place;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
               location.href="kakaofail.jsp";
                alert(msg);
            }
        });
        
    });
    </script>
	 <input  type="hidden"><div style="background-image: url(images/reserveOk.png); background-repeat: no-repeat; width:600px; height:100px; top:40%; left:30%; position:absolute;"><br><br><br><br><br>
	 
	 <font color="white"> 
	 <input  type="hidden" name="e_name" value="<%=e_name%>"><%=e_name%>
	 <input  type="hidden" name="e_price" value="<%=e_price%>"><%=e_price%>
	 <input  type="hidden" name="e_no" value="<%=e_no%>"><%=e_no%>
	 <input  type="hidden" name="e_term" value="<%=e_term%>"><%=e_term%>
	  <input  type="hidden" name="e_place" value="<%=e_place%>"><%=e_place%>
	  <input  type="hidden" name="b_time" value="<%=e_time%>"><%=e_time%>
	  <input  type="hidden" name="b_date" value="<%=e_date%>"><%=e_date%>
	  <input  type="hidden" name="r_name" value="<%=r_name%>"><%=r_name%>
	  <input  type="hidden" name="phone1" value="<%=phone1%>"><%=phone1%>
	  <input  type="hidden" name="phone2" value="<%=phone2%>"><%=phone2%>
	  <input  type="hidden" name="phone3" value="<%=phone3%>"><%=phone3%>
	  <input  type="hidden" name="address1" value="<%=address1%>"><%=address1%>
	  <input  type="hidden" name="address2" value="<%=address2%>"><%=address2%>
	  <input  type="hidden" name="address3" value="<%=address3%>"><%=address3%>
	  <input  type="hidden" name="delivery" value="<%=delivery%>"><%=delivery%>
	  </font>
 </form>
</body>

</html>