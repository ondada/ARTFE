<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="stylesheet" href="css/insertOk.css">
<link rel="icon" href="images/logo.png">

</head>

<body>
  
<%

	request.setCharacterEncoding("euc-kr");  // �Է������� ���۵� �ѱ۵����� ó��

	// �Է������� �޴� �����ʹ� ��� String����
    String e_ctg = request.getParameter("e_ctg");
	String e_no = request.getParameter("e_no");
	String e_name = request.getParameter("e_name");
	String e_genre = request.getParameter("e_genre");
	String e_term = request.getParameter("e_term");
	String e_time = request.getParameter("e_time");
	
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String e_place = address1 + " " + address2 +  " " +address3;

	String e_p_ctg = request.getParameter("e_p_ctg");
	String e_description = request.getParameter("e_description");
   	int e_price =  Integer.parseInt(request.getParameter("e_price")); // String => int ��ȯ

		

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";  
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	  Class.forName("org.gjt.mm.mysql.Driver");  // JDBC ����̹� �ε�
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
     // DB�� ����           

	//SQL�� �ۼ� : ���̺� �ʵ��
    String jsql = "INSERT INTO event  (e_ctg, e_no, e_name, e_genre, e_term, ";
	jsql = jsql + "e_time, e_place, e_p_ctg, e_description, e_price)  VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
      
    //PreparedStatement ����(SQL���� ��Ʋ�� ������)
	PreparedStatement pstmt = con.prepareStatement(jsql); 

	//���� SQL������ ?�� �ش�Ǵ� ���� ������ ������ �ϳ��� �Ҵ��� (�μ� ����)
	//�������� ��쿡�� setInt()�� �����
    pstmt.setString(1, e_ctg); 
	pstmt.setString(2, e_no); 
    pstmt.setString(3, e_name);
	pstmt.setString(4, e_genre);
	pstmt.setString(5, e_term);
	pstmt.setString(6, e_time);
	pstmt.setString(7, e_place);
	pstmt.setString(8, e_p_ctg);
	pstmt.setString(9, e_description);
	pstmt.setInt(10, e_price);

	pstmt.executeUpdate(); // SQL�� ����

  } catch(Exception e) { 
		out.println(e);
}


	
%>

 <div class="login-form2">
 <center><br>
     <p style="font-size:24px;"><b>�ű���� ����� �Ϸ�Ǿ����ϴ�.</b></p>
    <br><br>

<div class="usertb" style="width:600px; margin:10px auto;">
 <table>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">ī�װ�</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_ctg%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����ȣ</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_no%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_name%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�帣</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_genre%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�Ⱓ</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_term%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">ȸ��</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_time%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">��� ���</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_place%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_p_ctg%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">��� ����</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_description%></td></tr>
		<tr><td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
		<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=e_price%> ��</td></tr>
</table>
<br><br>
<input type="button" class="mainbtn" value="����ǰ ����Ȯ��" onClick="location.href='allEvent.jsp'" style="cursor:pointer"> 
    </center>
</form>
      
       
  
  <br><br>
 
</div>
</center>
</div><%@include file="footer.jsp" %>
</body>
</html>