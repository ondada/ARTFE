<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>�ֹ� �Ϸ� or  ��ٱ��ϳ��� ����</title></head>
<body>
<center>
<link rel="stylesheet" href="css/cartorder.css">
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //  ���ǹ�ȣ(��ٱ��Ϲ�ȣ)�� ������
	String caseNo = request.getParameter("case");

	String jsql = "delete from cart where ctNo=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	
    pstmt.executeUpdate();

	if(caseNo!= null)  //  (1) �ֹ��Ϸ�� ���� ��ٱ��� ���� �����ϰ� �� ���� �ֹ��Ϸ� �޽��� ���
	{                             //   orderOK.jsp�� 107�� ����
%>

<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>���Ű� �Ϸ�Ǿ����ϴ�.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('mpbookinfo.jsp')">
        ���ų��� Ȯ��
    </div></center>
<%
	}
	  else   //  (2) �ֹ��� ������� ��ٱ��� ���⸦ ������ ����� ���
	 {
%>
<br><br><br>
<center><h1 style="margin-top:55px; color:gray;"><b>���ٱ��� ������ �����Ͽ����ϴ�.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        ��� ���� ����
    </div></center>
<%
	  }
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>