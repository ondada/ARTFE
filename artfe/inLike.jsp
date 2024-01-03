<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>���ɳ���</title>


 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:blue; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>

</head>
<body>
<%
	//  �α��� ������(loginOK.jsp�� 42~51�� �κ�)�� �ο��� "sid" �Ӽ��� �Ӽ����� 
	//  "Ư��ȸ���� ID"�� ��Ÿ����,  �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	//  (�α����� �ȵ� ���, �� ���� null���� ����)
	//  => loginOK.jsp�� 43�࿡��, session.setAttribute("sid", id); ��  �̹� ������ ������.
	//  ����, �̷��� ID���� �������� ���ؼ��� (String)session.getAttribute("sid"); �� �̿��ϸ� ��!
	String sid = (String)session.getAttribute("sid");  
	%>

<%
 	 	request.setCharacterEncoding("euc-kr");


	String likeNo = session.getId();
	String e_no =  request.getParameter("e_no");

	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String jsql = "insert into booklike (likeNo, e_no)  VALUES  (?, ?)"; 

	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, likeNo);
	pstmt.setString(2, e_no);

	 pstmt.executeUpdate();

	 response.sendRedirect("mpLike.jsp"); /*
		// (72~76��):  Ư��ȸ���� �α��� �� �ִ� ���ȿ�(Ư�� ���ǹ�ȣ),  ������ ��ǰ�� 
		// ��ٱ��� ���̺� �̹� ��Ҿ����� �ƴ����� Ȯ���ϱ� ���ؼ� select���� �̿���!

		//  (1) ����� �ϴ� ��ǰ���ڵ尡 �̹� ��ٱ������̺�(cart)�� �����ϴ� ���(76~87�� �κ�) :
		//      => ��ٱ������̺� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ű�� ���� �ƴ϶�, 
		//           �̹� �����ϴ� ��ǰ���ڵ忡 ��ǰ�������� ����(update)��Ų��.
		//  (2) ����� �ϴ� ��ǰ���ڵ尡 ��ٱ������̺�(cart)�� �������� �ʴ� ���(88~97�� �κ�):
		//      => ��ٱ������̺� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ų��.


   	if(rs.next())   // ���� ��ǰ�� �̹� ��ٱ��Ͽ� �����Ѵٸ� �������� �߰���Ŵ.
		{		               // ��, update���� ����Ͽ� �̹� �����ϴ� ��ǰ�������� �����κи��� ���Ž�Ŵ.
			int sum = rs.getInt("ctQty") + ctQty;  //  �̹� ������ �ִ� �������� ���� �߰���ų ������ �ջ���.

			String jsql2 = "update cart set ctQty=? where ctNo=? and prdNo=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, prdNo);

			pstmt2.executeUpdate();
		}
		else  // ���� ��ǰ�� ��ٱ��Ͽ� �������� �ʴ´ٸ�, ���ο� ��ǰ���ڵ带 ��ٱ��� ���̺� �߰���Ŵ
		{
			String jsql3 = "insert into cart (ctNo, prdNo, ctQty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,prdNo);
			pstmt3.setInt(3,ctQty);	

			pstmt3.executeUpdate();
		}  //  76��~97�� if-else���� ��
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch�� �ݱ�		

     //  ��ٱ��Ͽ� ��ǰ�� ��� �Ǵ� ���Ž�Ų ��, ��ٱ��� ������ �����ֵ��� showCart.jsp�� ȣ����.   
	    response.sendRedirect("showCart.jsp");   //  <jsp:forward page="showCart.jsp"/> �� ������ �ǹ�
}  // 24~104�� if-else���� ��	                                     
*/%>
</body>
</html>