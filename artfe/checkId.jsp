<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<link rel="icon" href="images/logo.png">
<%
boolean isExist = false;

try {
    	String DB_URL="jdbc:mysql://localhost:3306/artfe";   // ���� DB�� project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123"; 
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
        
	    String id = request.getParameter("id");
	    
		String jsql = "select * from user where u_id = ?";   
        PreparedStatement  pstmt  = con.prepareStatement(jsql);
	    pstmt.setString(1, id);

	    ResultSet rs = pstmt.executeQuery();  	
        
        if(rs.next())              //   ���ڵ�(������ ID)�� �����ϸ�
              isExist = true;
        else                          //   ���ڵ�(������ ID)�� �������� ������  
             isExist = false;

    } catch (Exception e) {
        	out.println(e);
}
%>

<html>
<head>
<title>ARTFE</title>
</head>

<body bgcolor="#ffffff">
<br>
<table width="230" border="0" cellspacing="1" cellpadding="3" height="50" style="font-size:10pt;font-family:���� ���">
    <tr>
        <td height="25" align=center >
          ID:  <%=request.getParameter("id")%>
        </td>
    </tr>
    
    <tr>
        <td height="25" align=center>
  <%  
		   if(isExist)  
                 out.println("�̹� �����ϴ� ID�Դϴ�.");
	       else 
                 out.println("��� ������ ID�Դϴ�. ");
  %>
        </td>
    </tr>

    <tr>
        <td align=center>
            <a href="javascript:window.close()"><img src=".\images\confirm.gif" border=0></a>
        </td>
    </tr>
</table>
</body>
</html>