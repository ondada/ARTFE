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

  <%//1. �α��ο���üũ (�α���x->�α������������̵�)

if(sid == null){
	//�α����������̵�
	response.sendRedirect("login.jsp");
} 
else 
	try{
	request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/artfe?autoReconnect=true";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����

	// ��ٱ��Ͽ� ������ ��� ����, mysql�󿡼� select * from cart;�� ����� �Բ� Ȯ��/�� �ذ��鼭
	// cart���̺� �����ִ� ��ǰ���ڵ������� ��ٱ��Ϲ�ȣ(ctNo)�� �Բ� ������ ������ �� ��!
	//  =>  Ȩ�������󿡼� �������� ��ٱ��� ������ ���Ե� ���ڵ����, ������ cart���̺�󿡼��� 
	//         ������ �ǹ��ϰ� �ִ��� ������ ������ �� ��! (�߿�!)
	String jsql = "select * from cart where ctNo = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())    // ��ȸ ����� �������� ������,  rs.next()�� false�� ������. 
	{                       //  ����,  !rs.next()�� ���� true�� �� 
%>
		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>���ٱ��ϰ� ����ֽ��ϴ�.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        ��纸�� ����
    </div></center>
<%
	}
	else
	{
%>
<form id="kakaopay" action="cartkakao.jsp" method="post" name="order">
<span style="align:center; font-size:30px;"><b>�����ϱ�</b></span>

<div id="order">

 <table id="table1">

 <tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
 <td colspan =6 height="30px" align="left" style="padding:20px; font-size:24px;"><b>��� ����</b></td>
 </tr>

 <tr>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500; padding-left:35px;">������</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">����</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">��¥����</td>
  <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">ȸ������</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">����</td>
 <td align=center style="color:gray; font-size: 17px; padding-top: 20px; padding-bottom:10px; font-weight:500;">����</td>
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
			String e_no = rs2.getString("e_no");	//  cart���̺�κ��� ��ǰ��ȣ ����
    		int b_qty = rs2.getInt("b_qty");	                //  cart���̺�κ��� �ֹ����� ���� 

    		String jsql3 = "select e_name, e_term, e_time, e_price, e_date from event where e_no = ?";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, e_no);

			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();
			String	e_name =  rs3.getString("e_name");	
			String	e_term =  rs3.getString("e_term");//  goods ���̺�κ��� ��ǰ�� ����
			int e_price =  rs3.getInt("e_price");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
				
    		
			

				DecimalFormat df = new DecimalFormat("###,###");
				int amount = e_price * b_qty;    //  �ֹ��� ���
				total = total + amount;                  //  ��ü �ֹ��Ѿ� ���

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
		// � ��¥���� 'YYYY-DD-YY'�������� ��ȯ!

		return(
		 <input type="date" value={b_date} />
		  )
	</script>
	<td align=center style="padding:20px; width:160px; height:100px; border-bottom:1px solid #dedede;"><input type="date" name="b_date"  id="now_date" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif; border-radius: 5px;" 
	value="{b_date} pattern = "yyyy.M.dd"/></a></td>

	<td align=center style="padding:20px; width:80px; height:100px; border-bottom:1px solid #dedede;"><select id="b_time" name="b_time" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif; border-radius: 5px;">
                <option value="1ȸ��" name="e_time">1ȸ�� (09:00~12:00)</option>
                <option value="2ȸ��" name="e_time">2ȸ�� (12:00~15:00)</option>
                <option value="3ȸ��" name="e_time">3ȸ�� (15:00~18:00)</option>
            </select></td>

	<td align=center style="padding:20px; width:80px; height:100px; border-bottom:1px solid #dedede;">
	<font  style="color:#514FF0; font-weight:bold;"><%=df.format(e_price)%>��</font></td>
	
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
		<td colspan = 5   align="right" id="total" style="margin-top:20px;" ><b>�� �����ݾ� : &nbsp;&nbsp;</b></td>
   <!-- �� hidden ó���� �ؾ߸� �ϴ��� orderOK.jsp�� �м��ϸ鼭 ������ ������ �� ��!    -->
		<td  colspan = 2 align=center id="total" style="padding:12px;" ><input type="hidden" name="pay" value="<%=total%>" >    
		<font  style="color:#514FF0; font-weight:bold;"><%=df.format(total)%></font><b>&nbsp;��</b></td>   
	</div>

<br><br><br><br>

<br><br>
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



<% } 
      rs.close();
      pstmt.close();  
      con.close();    
 %>

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
		<td>
</td>
	</tr>

</table>

	</form>

	<center><div class="btn" onClick="back()">
        �������
    </div></center>
	<br><br><br><br><br>
<%
   }  catch(Exception e)  {
        out.println(e);
 } 

  // if-else���� ��
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



function back()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�

	{
		history.go(-1);
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


</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 


    <%@include file="footer.jsp" %></div>
</center>
</body>
</html> 