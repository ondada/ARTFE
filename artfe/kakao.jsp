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
        var IMP = window.IMP; // ��������
        IMP.init('imp23418340'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%=e_name%>',
            amount : <%=e_price%>,
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� �������ּ���
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                    }
                }).done(function(data) {
                    //[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                    if ( everythings_fine ) {
                        msg = '������ �Ϸ�Ǿ����ϴ�.';
                        msg += '\n����ID : ' + rsp.imp_uid;
                        msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                        msg += '\���� �ݾ� : ' + rsp.paid_amount;
                        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                        //[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                    }
                });
                //������ �̵��� ������
                location.href="reserveOk.jsp?e_no="+e_no+"&e_place="+e_place;
            } else {
                msg = '������ �����Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;
                //���н� �̵��� ������
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