<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>�ֹ� �Ϸ�</title></head>
<body>
<center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  //  ���� DB�� project
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //  ���ǹ�ȣ�� ������
	// String caseNo = request.getParameter("case");

	String jsql = "delete from tempcart where ctNo=?";    //  tempcart ���̺��� ����Կ� ����!
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	
    pstmt.executeUpdate();
%>

<br><br>
<font size=6 color=blue><b>[��ǰ �ֹ� �Ϸ�]</b></font><p>
	��ǰ �ֹ��� �Ϸ�Ǿ����ϴ�.<br><br>
	�ֹ��Ͻ� ��ǰ�� �ֹ� �Ϸ� �� 2�� �̳��� ��۵� �����Դϴ�.<br><br>
	������ ��Ƽ���θ�(��)�� �̿��� �ּż� �����մϴ�!

<%
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>