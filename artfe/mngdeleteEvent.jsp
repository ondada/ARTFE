<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<html><head><title>ARTFE</title>


<link rel="stylesheet" href="css/deleteuser.css">
<link rel="icon" href="images/logo.png">
</head>
<body>

<%
	try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


     //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺��� ��ȸ��
	 String key = request.getParameter("no");   
	 String jsql = "select * from event where e_no = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);


  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String no = rs.getString("e_no");
   	 String ctg = rs.getString("e_ctg");
	 String genre = rs.getString("e_genre");
	 String name = rs.getString("e_name");
	 int price = rs.getInt("e_price");
	 String place = rs.getString("e_place");
	 String pctg = rs.getString("e_p_ctg");
	 String term = rs.getString("e_term");
	 String time = rs.getString("e_time");
	 String description = rs.getString("e_description");

%>

	<div class="userform">
    <form action="mngdeleteEventResult.jsp" method=post name="login">
	<center><br>
	<h2><b>������ ��������� �����Ͻðڽ��ϱ�?</b></h2>
<br><br>
	<div class="usertb" style="width:600px; margin:10px auto;">
		<table>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����ȣ</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=no%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">ī�װ�</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=ctg%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�帣</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=genre%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=name%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=price%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">���</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=place%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=pctg%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">�Ⱓ</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=term%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">ȸ��</td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=time%></td>
		</tr>
		<tr>
			<td width="100" align="center" style="color:gray; font-size: 16px; font-weight:400; border-right:1px solid #514FF0; padding:10px;">����</b></td>
			<td style="font-size: 16px; font-weight:400; padding-left:20px;"><%=description%></td>
		</tr>
  </tr>
</table>
</div>
<br><br>

<a href="mngdeleteEventResult.jsp?no=<%=no%>" ><input type="button" class="userdelete" value="��� ����" onClick="checkValue()" style="cursor:pointer"></a>&nbsp;&nbsp;
<a href="allEvent.jsp"><input type="reset" class="userdeleteno" value="���" onClick="location.href='allEvent.jsp'" style="cursor:pointer"> </a>
  <br><br><br><br>
  <br><br>
  
  <%@include file="footer.jsp" %>
</div>
</center>

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

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>