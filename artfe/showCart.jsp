<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>��ٱ��� ���� ��ȸ</title>
</head>

<center>
<br><br>
<font color="blue" size='6'><b>[��ٱ��� ����]</b></font><p>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";    // ���� DB�� project
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String c_no = session.getId();   //���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����


	// ��ٱ��Ͽ� ������ ��� ����, mysql�󿡼� select * from cart;�� ����� �Բ� Ȯ��/�� �ذ��鼭
	// cart���̺� �����ִ� ��ǰ���ڵ������� ��ٱ��Ϲ�ȣ(ctNo)�� �Բ� ������ ������ �� ��!
	//  =>  Ȩ�������󿡼� �������� ��ٱ��� ������ ���Ե� ���ڵ����, ������ cart���̺�󿡼��� 
	//         ������ �ǹ��ϰ� �ִ��� ������ ������ �� ��! (�߿�!)
	String jsql = "select * from cart where c_no = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, c_no);

	ResultSet rs = pstmt.executeQuery();

	if(rs.next())    // ��ȸ ����� �������� ������,  rs.next()�� false�� ������. 
	{                       //  ����,  !rs.next()�� ���� true�� �� 
%>
		���ɳ����� ������ϴ�.
<%
	}
	else
	{
%>

<table border=1  style="font-size:10pt;font-family:���� ���">
<tr>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p align="center"><font size="2" color="#ECFAE4"><strong>����ȣ</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>����</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>��簡��</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>���ż���</strong></font></td>     
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="#ECFAE4"><strong>�ֹ���(��)</strong></font></td>  
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="red"><b>[��ǰ����]</b></font></td>
 </tr> 		

<%
//  [74��~109�� ����] :
//  ��ٱ��Ͽ� ��� ��ǰ������ ���������� �����ְ��� �� ��, ������ �׸����
//  ��ǰ��ȣ(prdNo),  ��ǰ��(prdName),  ��ǰ�ܰ�(prdPrice),  �ֹ�����(ctQty), 
//  �ֹ���(prdPrice*ctQty ),  ��ü�ֹ��Ѿ�(total)���� �����ǰ� ������ ������ ��! 
//   => ��ٱ��ϴ�� ���� �� �������� �ش� ���������� ��°���� ���� �� ������ҵ��� Ȯ�� ���!

//  cart ���̺�:  ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ �� �� ����.
//  goods ���̺�:  ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) ���� ������ �� �� ����.
//  ����, cart���̺�� goods���̺�κ���, ������ ��ǰ��ȣ(prdNo)�� �ش��ϴ� �� �׸���� ���� 
//  ������ �� �� �ִ�. (mysql�󿡼� cart���̺�� goods���̺� ��� �ʵ���� �����ϴ��� Ȯ�� ���!)
//  =>  <�˰��� ����>:  cart���̺�κ��� ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ ����, 
//         ���⼭ ������ ��ǰ��ȣ(prdNo)�� �ٰ��Ͽ� goods���̺�κ���
//         ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) �� ������ ����.
//         �̸� ����, �ֹ���(prdPrice*ctQty )��  ��ü�ֹ��Ѿ�(total)�� ����� ����.
//         �׷� ����, ������ �� �� �ʵ�� �� ���� ��������� ���������� ����� �ش�. 
//         ����, �̷��� ���ڵ������ �ʵ����� �� ������������ ����ϴ� ������ 
//         �� �̻� ��ٱ��Ͽ� ��ǰ���ڵ尡 ���� ������(�� ��ǰ���ڵ� �� ��ŭ) �ݺ��Ѵ�.  


		String jsql2 = "select e_no, b_qty from cart where c_no = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, c_no);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String e_no = rs2.getString("e_no");	//  cart���̺�κ��� ��ǰ��ȣ ����
    		int b_qty = rs2.getInt("b_qty");	                //  cart���̺�κ��� �ֹ����� ���� 

    		String jsql3 = "select e_name, e_price from event where e_no = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, e_no);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	e_name =  rs3.getString("e_name");	  //  goods ���̺�κ��� ��ǰ�� ����
			int e_price =  rs3.getInt("e_price");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
				
    		int amount = e_price * b_qty;    //  �ֹ��� ���
			total = total + amount;                  //  ��ü �ֹ��Ѿ� ���
%>
 <tr>       
    <td  bgcolor="#eeeede" height="30" align="center"><font size="2"><%=e_no%></font></td>     
	<td  bgcolor="#eeeede" height="30"align="center"><font size="2"><%=e_name%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=e_price%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=b_qty%></font> ��</td>
    <td  bgcolor="#eeeede" height="30"align="right"><font size="2"><%=amount%> ��</font></td>  
    <td  bgcolor="#eeeede" height="30"align="center"><a href="deleteCart.jsp?eno=<%=e_no%>"><font size="2" color=blue><b>����</b></a></font></td> 	
  </tr>   
<%
	     }  // while���� ��
 %>
  <tr>
	<td colspan = 4 align=center><font size="2" color="red"><b>��ü �ֹ��Ѿ�</b></font></td>
	<td  bgcolor="#eeeede" height="30" align=right><font size="2" color="red"><b><%=total%> ��</b></font></td>
	<td align=center><font size=2 color=green>(���ù�ǰ ����)</font></td>
  </tr>
 </table>      

<br><br>
<a href="deleteAllCart.jsp" ><font size=2>��ٱ��� ����</font></a> &nbsp&nbsp
<a href="order.jsp" ><font size=2>�ֹ��ϱ�</font></a>

<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>
 </center>                
</body>  
</html> 