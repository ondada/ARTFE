<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>



<link rel="stylesheet" href="css/order.css">
<script language="javascript" src="js_package.js"> 
</script>

<body>

<%
	//  �α��� ������(loginOK.jsp�� 42~51�� �κ�)�� �ο��� "sid" �Ӽ��� �Ӽ����� 
	//  "Ư��ȸ���� ID"�� ��Ÿ����,  �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	//  (�α����� �ȵ� ���, �� ���� null���� ����)
	//  => loginOK.jsp�� 43�࿡��, session.setAttribute("sid", id); ��  �̹� ������ ������.
	//  ����, �̷��� ID���� �������� ���ؼ��� (String)session.getAttribute("sid"); �� �̿��ϸ� ��!

if (sid == null)    //  �α��� ���� ���� ���¿���, ��ٱ��ϸ� ������ �ϴ� ����� ó��(24~34��)
{                             //   =>  ���� �α����� �ϵ��� ������ 
%>
<center>
<br><br><br> 
<font style="font-size:10pt;font-family:���� ���">
		<br><br><br><br><br> <b>�α����� �ʿ��մϴ�</b> <br><br><br><br>
		<font style="font-color:red" ><a href="login.jsp"> <input type="button" class="submit-btn" value="�α��� �������� �̵�" onClick="checkValue()" style="cursor:pointer"> </a></font>
<br><br><br><br><br><br><br><br><br><br><br><br>
</font>
  <%@include file="footer.jsp" %>
</center>
<%
}
else    //  �̹� �α��εǾ� �ִ� ���,  ��ٱ��� ���� ó�� �κ�(35��~�� ����)
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  ���� DB�� project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String ctNo = session.getId();  //���� ��ȣ�� ��ٱ��� ��ȣ(ctNo)�μ� �̿��ϱ� ���� ctNo�� ����
 	                                                          // session.getId()�Լ��� ���ϰ�(�����)��  ���ǹ�ȣ(����ID)��.

        // [���ǰ� ������ ���� �ο� ����] :
        // Ŭ���̾�Ʈ�� ������ �����ϰ� �Ǹ� �����κ��� ���ǹ�ȣ(���������� �ĺ���ȣ)�� �ο�����.
        //  => �ο����� ���ǹ�ȣ�� ���α׷��󿡼� ���������� session.getId()�� �����.
        // �ο����� ���ǹ�ȣ�� �α��� �� ���� ����(������ �����Ǵ� ����) �״�� �����ȴ�.
        // ����, ������ ID�� ������ �������ϰ� �Ǵ��� �� ���ο� ���ǹ�ȣ�� �ο�����.
        // => ����, �̷��� ������ �̿��ϸ�, ��ٱ����� ������ �״�� ǥ�������� �� �� �ִ�. 

         
		 //  ��ٱ������̺�(cart ���̺�)�� �����ϴ� �� �ʵ尡 ctNo, prdNo, ctQty�ӿ� �ָ�!
		String e_no = request.getParameter("e_no"); // ��ǰ��ȣ
		int b_qty = Integer.parseInt(request.getParameter("b_qty")); //  �ֹ�����(��ٱ��Ͽ� ���� ��ǰ����)


		// (72~76��):  Ư��ȸ���� �α��� �� �ִ� ���ȿ�(Ư�� ���ǹ�ȣ),  ������ ��ǰ�� 
		// ��ٱ��� ���̺� �̹� ��Ҿ����� �ƴ����� Ȯ���ϱ� ���ؼ� select���� �̿���!

		//  (1) ����� �ϴ� ��ǰ���ڵ尡 �̹� ��ٱ������̺�(cart)�� �����ϴ� ���(76~87�� �κ�) :
		//      => ��ٱ������̺� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ű�� ���� �ƴ϶�, 
		//           �̹� �����ϴ� ��ǰ���ڵ忡 ��ǰ�������� ����(update)��Ų��.
		//  (2) ����� �ϴ� ��ǰ���ڵ尡 ��ٱ������̺�(cart)�� �������� �ʴ� ���(88~97�� �κ�):
		//      => ��ٱ������̺� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ų��.
		String jsql = "select * from cart where ctNo = ? and e_no = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ctNo);
		pstmt.setString(2, e_no);
		ResultSet rs = pstmt.executeQuery(); 

	   	if(rs.next())   // ���� ��ǰ�� �̹� ��ٱ��Ͽ� �����Ѵٸ� �������� �߰���Ŵ.
		{		               // ��, update���� ����Ͽ� �̹� �����ϴ� ��ǰ�������� �����κи��� ���Ž�Ŵ.
			int sum = rs.getInt("b_qty") + b_qty;  //  �̹� ������ �ִ� �������� ���� �߰���ų ������ �ջ���.

			String jsql2 = "update cart set b_qty=? where ctNo=? and e_no=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, e_no);

			pstmt2.executeUpdate();
		}
		else  // ���� ��ǰ�� ��ٱ��Ͽ� �������� �ʴ´ٸ�, ���ο� ��ǰ���ڵ带 ��ٱ��� ���̺� �߰���Ŵ
		{
			String jsql3 = "insert into cart (ctNo, e_no, b_qty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,e_no);
			pstmt3.setInt(3,b_qty);	

			pstmt3.executeUpdate();
		}  //  76��~97�� if-else���� ��
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch�� �ݱ�		

     //  ��ٱ��Ͽ� ��ǰ�� ��� �Ǵ� ���Ž�Ų ��, ��ٱ��� ������ �����ֵ��� showCart.jsp�� ȣ����.   
	    response.sendRedirect("mpCart.jsp");   //  <jsp:forward page="showCart.jsp"/> �� ������ �ǹ�
}  // 24~104�� if-else���� ��	                                     
%>
</body>
</html>
