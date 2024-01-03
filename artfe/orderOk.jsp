<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>    
<html>
<head>
<title>�ֹ� ó�� �Ϸ�</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:gray; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>

</head>

<%
//   cart ���̺��� �ƴ϶�, tempcart ���̺��� ����ϰ� (61�� ����),
//   deleteAllCart.jsp?case=1�� �ƴ϶�, deleteTempCart.jsp�� ����Ѵ�(108�� ����)�� ���� �����ϸ�,
//   directOrderOK.jsp�� orderOK.jsp�� ��� �ڵ尡 �����Կ� ������ ��!

try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";    // ���� DB�� project
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");

	String ctNo = session.getId();   //  ���ǹ�ȣ(��ٱ��Ϲ�ȣ) �� ctNo�� ����
    String	sid = (String)session.getAttribute("sid");  //   ���� ID ���� �����ͼ� ���� myid�� ����.
                                                                                            //  �ֹ��������� ���� ���� �ʿ���.
	String u_id = request.getParameter("u_id");
	String r_name = request.getParameter("r_name");

	String	phone1 = request.getParameter("phone1");
	String	phone2 = request.getParameter("phone2");
	String	phone3 = request.getParameter("phone3");
	String	r_phone = phone1 + "-"+ phone2 + "-" + phone3;

	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String r_address = address1 + " " + address2 +  " " +address3;

	String r_grade = request.getParameter("r_grade");
	String r_pay = request.getParameter("r_pay");
	String 	r_date = request.getParameter("r_date");	
	String amount = request.getParameter("r_amount");

	String b_time = request.getParameter("b_time");
	String b_date = request.getParameter("b_date");

	String delivery = request.getParameter("delivery");    


// ���ο� �ֹ���ȣ(ordNo)�� �ο��ϱ� ����, �ֹ����̺� �ִ� ������ �ֹ���ȣ�� ������.
// �ֹ��� ���� ������ �ֹ���ȣ�� 1�� �����ϹǷ�, MAX(ordNo)�� ordNo�� �ִ밪, �� 
//  ������ �ֹ���ȣ�� �ǹ���.
	String jsql = "select MAX(bNo) from bookinfo";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery(); 

	int bNo;
	if(rs.next())                             // �ֹ���ȣ�� orderinfo ���̺� �����Ѵٸ�,  "���� �ֹ���ȣ" + 1 �� ����
		bNo = rs.getInt(1) + 1;       //  rs.getInt(1)�� �ǹ�:   rs.next()�� ����Ű�� �ִ� ���ڵ��� ù��° �ʵ忡 
		                                             //  �ش��ϴ� �ʵ尪�� �ǹ��� 
		                                             //  �� ���, rs.getInt(1)��  rs.getInt("MAX(ordNo)")�� ������ �ǹ̰� ��.
  												     //  => mysql�󿡼� sql���� �����Ͽ� �� �����ǹ̰� �Ǵ��� �� Ȯ���� �� ��!
	else                     
		bNo = 1;   // �ֹ���ȣ�� �������� �ʴ´ٸ�, �ֹ���ȣ�� 1���� �����ϵ��� ��
	                         // (���� �� �Ѱ��� �ֹ��� �������� ���� ���¶��, �ֹ���ȣ�� �������� ���� ���� ����) 

	String jsql2 = "select e_no, b_qty from tempcart where ctNo = ?";   //  tempcart ���̺��� ����ϰ� ������ ����!
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, ctNo);		

	ResultSet rs2 = pstmt2.executeQuery(); 

//  tempcart ���̺� �ִ� �������� �о�ͼ�,
//  �ֹ���ǰ ���̺�(ordProduct)�� �ֹ���ȣ(ordNo), ��ǰ��ȣ(prdNo), �ֹ�����(ordQty)�� �����Ŵ!
	while(rs2.next())   // �ֹ���ǰ���̺�(orderProduct)�� �ֹ���ȣ(ordNo), ��ǰ��ȣ(prdNo), 
	{			                    // �ֹ�����(ordQty)�� �����ϱ� ���� tempcart ���̺�κ���
	                                //  prdNo�� ctQty�� �����´�.
			String e_no = rs2.getString("e_no");	//  tempcart ���̺�κ��� ��ǰ��ȣ ����
    		int b_qty = rs2.getInt("b_qty");	                //  tempcart ���̺�κ��� �ֹ����� ���� 

			String jsql3 = "INSERT INTO bookproduct (bNo, e_no, bookQty) VALUES (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, Integer.toString(bNo));
			pstmt3.setString(2, e_no);
			pstmt3.setInt(3, b_qty);

			pstmt3.executeUpdate();
	 }

//  �ֹ����� ���̺�(ordInfo)�� �����ų �ʵ���� ���� 
	String jsql4 = "INSERT INTO bookinfo (bNo, u_id, r_date, r_phone,  r_address, r_name, b_date, b_time, delivery)  VALUES(?,?,?,?,?,?,?,?,?)";

Date date = new Date();
		System.out.println("���� ���� �� : " + date);
		
        
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm"); 
        	//���ϴ� ������ ���� ����
		String oDate = simpleDateFormat.format(date); 

	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, Integer.toString(bNo));
	pstmt4.setString(2, sid);
	pstmt4.setString(3, oDate);
	pstmt4.setString(4, r_phone);
    pstmt4.setString(5, r_address);
	pstmt4.setString(6, r_name);
	pstmt4.setString(7, b_date);
	pstmt4.setString(8, b_time);
	pstmt4.setString(9, delivery);

	pstmt4.executeUpdate();

//  �ֹ������� ���õ� ��ü�� �������� ���� orderproduct ���̺�� orderinfo ���̺� 
//  �����Ų ��, tempcart ���̺� ���⸦ ������.

	 response.sendRedirect("mpbookinfo.jsp");    //  forward �׼��±׸� ����ص� ������

   }  catch(Exception e)  {
        out.println(e);
} 
%>



</body>
</html> 