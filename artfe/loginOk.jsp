<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="css/login.css">
<link rel="icon" href="images/logo.png">
<body>
<%
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");            //  �α�����(login.jsp)���� �Է��� ID�� �Ѱܹ���
    String pw = request.getParameter("pw");  //  �α�����(login.jsp)���� �Է��� PW�� �Ѱܹ���

     //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺��� ��ȸ��
    String jsql = "select  *  from user where u_id = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   //  (1) �Է��� ID�� ������ ���ڵ尡 member���̺� �����ϴ� ���
    {
        if (pw.equals(rs.getString("u_pw")))  
    	//  (1.1) �Է��� ID�� ������ ���ڵ尡 �����ϸ鼭, 
	    //	        �Է��� ��й�ȣ�� member���̺���� ��й�ȣ�͵� ��ġ�ϴ� ���
        {
             session.setAttribute("sid", id);
 	      // �α��� ������, ������ ������� ID�� "sid" �Ӽ��� �Ӽ������� ������.
          // ���� �α��� �� ���¿��� ���� ID�� ���õ� ������ �ʿ�� �Ҷ�,
	      // (String)session.getAttribute("sid")�� �̿��Ͽ� ���� ID ������ ������ �� �ִ�.
     	  // �ܼ���, �α��� ���� �Ǻ��� �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	      //  (�α����� �ȵ� ���, �� ���� null���� ����)

             response.sendRedirect("main.jsp");   	//  <jsp:forward page="index.jsp"/> �� ������

		 } else {   // (1.2) �Է��� ID�� ������ ���ڵ尡 member���̺� ����������, ��й�ȣ�� ����ġ�� ���
%>
	
	<script language="javascript">
     alert("���̵� �Ǵ� ��й�ȣ�� Ȯ���� �ּ���.");
	history.go(-1) ;
</script>
<%       
        }   //  �ι�° if-else���� ��      
    } else {    //  (2)  �Է��� ID�� ������ ���ڵ尡 member���̺� �������� �ʴ� ���
 %>
	  <script language="javascript">
     alert("���̵� �Ǵ� ��й�ȣ�� Ȯ���� �ּ���.");
	history.go(-1) ;
</script>
<%
   }  // ù��° if-else���� ��
%>


<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.login.id.value == "") 
	{
		alert("���̵� �Է����ּ���. ");
		document.login.id.focus();
		return false;			
	}			

	if (document.login.pw.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���. ");
		document.login.pw.focus();
		return false;			
	}

			login.submit();
}

	</script>

</body>
</html>