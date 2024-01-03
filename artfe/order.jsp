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
 
	// �α��� ������ �ο��� "sid" �Ӽ��� �Ӽ����� "Ư��ȸ���� ���̵�"�� ��Ÿ����, 
	// �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. (�α����� �ȵ� ���, �� ���� null���� ����)
	// login_ok.jsp�� �ʹݺ� �ڵ� Ȯ�� ���!  ==> session.setAttribute("sid", id); �κ� Ȯ�ο��!

if (sid == null) 
{
%>
<center>
<br><br><br> <br> <br> 
<p style="font-size:24px;">
		 <b>�α����� �ʿ��մϴ�.</b> <br><br><br><br></p>
		<a href="login.jsp"> <input type="button" class="submit-btn" value="�α����Ϸ� ����" onClick="checkValue()" style="cursor:pointer"> </a>
<br><br><br><br><br><br><br>
</font>
</center>
<%
}
else
{
 try { // (1)  (34��~151��):  tempcart ���̺� ��ñ����� ��ǰ���ڵ� ������, tempcart ������ �״�� �����ֱ� 

 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String ctNo = session.getId();   // ���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����

    //   46~50�� �κ�:   ����, "��ñ����ϱ�" Ŭ�� ��, �ֹ��� �Ϸ����� �ʰ� �߰��� �ֹ��� ��ҽ�ų ��쿣, 
	//   �ֹ��Ϸ��� ��ҽ�Ų ��ǰ������ �״�� tempcart ���̺� �����ְ� �ȴ�. ����, �̷��� �������� 
	//   �����ϱ� ���Ͽ�, "��ñ����ϱ�"�� �����ϱ� ������ ��������� tempcart ���̺��� ����ֵ��� ó����.
	 String jsql5 = "delete from tempcart where ctNo=?";    
	 PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	 pstmt5.setString(1, ctNo);
	
     pstmt5.executeUpdate();
    
     //   54�����, ������ "��ñ����ϱ�"�� ���õ� �ڵ�κ��� ���۵�.
     //  ������������(��)���κ��� "��ñ���"�ϰ��� �ϴ� ��ǰ��ȣ�� �ֹ������� �Ѱܹ޴´�.
	 String eNo = request.getParameter("e_no");   // ��ǰ��ȣ
	 int bqty = Integer.parseInt(request.getParameter("b_qty"));   //  �ֹ�����

      // tempcart ���̺� "��ñ���"��  ��ǰ���ڵ带 �����Ŵ
	 String jsql = "insert into tempcart (ctNo, e_no, b_qty) values (?,?,?)";  
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,ctNo);
	 pstmt.setString(2,eNo);
	 pstmt.setInt(3,bqty);	

	 pstmt.executeUpdate();

%>

<!--  (74��~269��):   order.jsp�� 48��~235��� ���� 95%�̻� ������ �ڵ带 ����ϰ� ����  -->
<!--  103�࿡�� cart ���̺��� �ƴ϶�, tempcart ���̺��� ����ϰ� ������ ������ ��!              -->

<%
//  [103��~151�� ����] :
//  tempcart ���̺�(cart ���̺� �ƴ�!)�� ��� ��ǰ������ ���������� �����ְ��� �� ��, ������ �׸����
//  ��ǰ��ȣ(prdNo),  ��ǰ��(prdName),  ��ǰ�ܰ�(prdPrice),  �ֹ�����(ctQty), 
//  �ֹ���(prdPrice*ctQty ),  ��ü�ֹ��Ѿ�(total)���� �����ǰ� ������ ������ ��! 
//   => "��ñ����ϱ�" ���� �� �������� �ش� ���������� ��°���� ���� �� ������ҵ��� Ȯ�� ���!

//  tempcart ���̺�:  ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ �� �� ����.
//  goods ���̺�:  ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) ���� ������ �� �� ����.
//  ����, tempcart���̺�� goods���̺�κ���, ������ ��ǰ��ȣ(prdNo)�� �ش��ϴ� �� �׸���� ���� 
//  ������ �� �� �ִ�. (mysql�󿡼� tempcart���̺�� goods���̺� ��� �ʵ���� �����ϴ��� Ȯ�� ���!)
//  =>  <�˰��� ����>:  tempcart���̺�κ��� ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ ����, 
//         ���⼭ ������ ��ǰ��ȣ(prdNo)�� �ٰ��Ͽ� goods���̺�κ���
//         ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) �� ������ ����.
//         �̸� ����, �ֹ���(prdPrice*ctQty )��  ��ü�ֹ��Ѿ�(total)�� ����� ����.
//         �׷� ����, ������ �� �� �ʵ�� �� ���� ��������� ���������� ����� �ش�. 


		String jsql2 = "select e_no, b_qty from tempcart where ctNo = ?";   //  tempcart ���̺��� ����Կ� ����!
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 
		
		int total=0;   //  130�� ����
         
	//	while(rs2.next()) 
  	//	{			                   

		rs2.next();    //  ��ñ����ϱ��� ���, ��ñ����� ��ǰ���ڵ常 �������ָ� ��(while���� ���ʿ���!)

		String e_no = rs2.getString("e_no");	    //  tempcart ���̺�κ��� ��ǰ��ȣ ����
   		int b_qty = rs2.getInt("b_qty");	                    //  tempcart ���̺�κ��� �ֹ����� ���� 

   		String jsql3 = "select e_name, e_term, e_time, e_price, e_date from event where e_no = ?";
    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	    pstmt3.setString(1, e_no);

	    ResultSet rs3 = pstmt3.executeQuery(); 
		rs3.next();
		String	b_date = request.getParameter("e_date");
		String	b_time = request.getParameter("e_time");
		String	e_place = request.getParameter("e_place");
		String	e_name =  rs3.getString("e_name");	  //  goods ���̺�κ��� ��ǰ�� ����
		int e_price =  rs3.getInt("e_price");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
		String e_term = rs3.getString("e_term");
				
				
		DecimalFormat df = new DecimalFormat("###,###");
   		int amount = e_price *b_qty;     //  �ֹ��� ���
		total = total + amount;                  //  ��ü �ֹ��Ѿ� ���

		String r_name= "";
		String r_phone= "";
		String r_address= "";
%>

	
<form id="kakaopay" action="kakao.jsp" method="post" name="order">
<span style="align:center; font-size:30px;"><b>�����ϱ�</b></span>

<div id="order">

 <table id="table1">

 <tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>��� ����</b></td>
 </tr>
 <tr>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500; padding-left:35px;">������</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">����</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">���� ��¥</td>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">ȸ��</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">����</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">����</td>
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
	<font  style="color:#514FF0; font-weight:bold;"><%=df.format(e_price)%> ��</font></td>
	
	<td align=center style=" padding:20px; width:80px;  height:100px;"><b><%=b_qty%>��</b></td>
	</tr>

	<tr style="border-top:1px solid #dedede; height:80px">
		<td colspan = 5   align="right" id="total" style="margin-top:20px;" ><b>�� �����ݾ� </b></td>
   <!-- �� hidden ó���� �ؾ߸� �ϴ��� orderOK.jsp�� �м��ϸ鼭 ������ ������ �� ��!    -->
		<td  colspan = 2 align=center id="total" style="padding:12px;" ><input type="hidden" name="pay" value="<%=total%>" >    
		<font  style="color:#514FF0; font-weight:bold;"><%=df.format(total)%></font><b>&nbsp;��</b></td>   
	</tr>
	</table>
 

 
<%
	   //      }  // while���� ��
 %>


<%
	// (2)�ֹ��� ���� ��� - ȸ�� ���̺� ���� ���
	//String myid = (String)session.getAttribute("sid");  // �α����߾��� �ֹ��� ����(��, ���̵�)�� �޾ƿ�

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
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>������ ����</b></td>
 </tr>
	<tr>
		<td align="center" style="padding-top: 20px; font-size:16px;" ><b>�̸�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b></td>
		<td width="120 "style="padding-top: 20px;">&nbsp;<%=u_name%></td>
	</tr>
	<tr>
	<td align="center" width=200 style="padding-top: 20px; font-size:16px;" ><b>��ȭ��ȣ</b></font></td>
	<td  colspan=3 width=474 style="padding-top: 20px;">&nbsp;<%=u_phone%></td>
	</tr>
</table>
<br>

 <table id="table2">
<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>��� ����</b></td>
 </tr>
	<tr></tr>
	<tr>
		<td style="padding:50px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type='radio' name='delivery' value='���' style="margin-left:30px; accent-color:#514FF0;" checked>  ���
			<input type='radio' name='delivery' value='�������' style="margin-left:50px; accent-color:#514FF0;">  �������
		</td>
	</tr>
</table>

 <table id="table3">
<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
		<td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>����� ����</b></td>
	</tr>
		<tr>
		<td align="center" style="padding-top: 20px; font-size:16px;" ><b>�̸� <font color="#514FF0">*</font>&nbsp;</b></td>
		<td width="120 "style="padding-top: 20px;">
		<input type="text"  placeholder="�̸�"  id="tbinput" name="r_name" size=40 style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;"></td>
	</tr>
	<tr>
		<td align="center" width=200 style="padding-top: 20px; font-size:16px;" ><b>�ּ� <font color="#514FF0">*</font>&nbsp;</b></td>
		<td  colspan=3 width="474" style="padding-top: 20px;">
		<input id="address1" name="address1" type="text"  placeholder="�����ȣ" readonly onclick="findAddr()" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
	  <input id="addressfind" name="addressfind" type="button" value="�����ȣ �˻�" readonly style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;" onclick="findAddr()" ><br>
	  <input id="address2" name="address2"type="text" placeholder="�ּ�" readonly style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
	  <input id="address3" name="address3" type="text" placeholder="���ּ� �Է�" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
		</td>
	</tr>
		<tr>
		<td align="center" width=200 style="padding-top: 20px; font-size:16px;" ><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ <font color="#514FF0">*</font>&nbsp;</b></td>
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
		<td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>���� ���<b></td>
	</tr>
	<tr>
	<td colspan =2 width="140px" style="padding-left:10px; padding-top: 20px; font-size:16px;" >
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio" style="accent-color:#514FF0;" checked>&nbsp;<b>�������</b> 
	
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
        �������
    </div></center>
	<br><br><br><br><br>
<%
   }  catch(Exception e)  {
        out.println(e);
 } 

}   // if-else���� ��
%>

    

<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
            var jibunAddr = data.jibunAddress; // ���� �ּ� ����
            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
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



function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.order.r_name.value == "") 
	{
		alert("������ �Է����ּ���. ");
		document.order.r_name.focus();
		return false;			
	}			

	if (document.order.address1.value == "") 
	{
		alert("������� �Է����ּ���. ");
		document.order.address1.focus();
		return false;			
	}

	if (document.order.address2.value == "") 
	{
		alert("������� �Է����ּ���. ");
		document.order.address2.focus();
		return false;			
	}

	if (document.order.address3.value == "") 
	{
		alert("���ּҸ� �Է����ּ���. ");
		document.order.address3.focus();
		return false;			
	}

	if (document.order.phone1.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.order.phone1.focus();
		return false;			
	}

	if (document.order.phone2.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.order.phone2.focus();
		return false;			
	}

	if (document.order.phone3.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.order.phone3.focus();
		return false;			
	}
		document.order.submit();
}

function back()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�

	{
		history.go(-1);
	}			


</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 


    <%@include file="footer.jsp" %></div>
</center>
</body>
</html> 