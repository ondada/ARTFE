<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/findid.css">

<body>

<%
String id = null, msg = null;

try {
 String DB_URL="jdbc:mysql://localhost:3306/artfe";   
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
     
    Class.forName("org.gjt.mm.mysql.Driver");  
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
Statement stmt = con.createStatement();
 request.setCharacterEncoding("euc-kr");

 String name = request.getParameter("name");
 String phone = request.getParameter("phone");

  String jsql = "select * from user where u_name=? and u_phone=? "; 

PreparedStatement pstmt  = con.prepareStatement(jsql);
 pstmt.setString(1,name);
 pstmt.setString(2,phone);
  
 ResultSet rs = pstmt.executeQuery();
  

  if(rs.next()){ 
   // id ã�⸦ ȣ���� �������� ã�� ���̵� �����ֱ� ���� �뵵 
   session.setAttribute("u_id", rs.getString("u_id")); 
   id = rs.getString("u_id");
 } 
  
else {    
   %>

    <script language="javascript">
   alert('��ġ�ϴ� ȸ�������� �����ϴ�.');
     window.location = 'findId.jsp';
</script>

<%
 }
 
 
 }finally{

    %>
       
    
   <script> fn_alert(); </script>
<%
   
}
%>

<script language="javascript">

function fn_alert()
   {
       alert('<%=msg%>');
     window.location = 'findId.jsp';
}
}


</script>





  
    <div class="login-form">
 <center>
	<h2><b>���̵� ã��</b></h2><br><br>
	<form action="login.jsp">
	 <%
       if (id != null) {
      %>
    <p>������ ���̵�� <font color="#514FF0"><%=id%></font>�Դϴ�.</p>
	<br><br><br>
	 <input type="button" class="mainbtn" value="�α����Ϸ� ����" onClick="location.href='login.jsp'" style="cursor:pointer"> 
     <input type="button" class="mainbtn-fgpw" value="��й�ȣ ã��" onClick="location.href='findPw.jsp'" style="cursor:pointer"> 
    <br><br>
	  <%
  } else {
 %>

       <%
  }
 %> 
   
    </center>
</form>
      
       
  
  <br><br></div> 
  <%@include file="footer.jsp" %>
</center>
</body>
</html>