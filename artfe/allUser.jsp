<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/allUser.css">

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe"; 
     String DB_ID="dada";  
     String DB_PASSWORD="1123"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from user";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

 <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700;">������ �ɼ�</a></li>
            <li style="margin-left:20px;"><a href="allUser.jsp" style="font-size:17px; color:#514FF0; font-weight:400;">ȸ����������</a></li>
			<li style="margin-left:20px;"><a href="allEvent.jsp" style="font-size:17px; font-weight:400; color:gray;">����ǰ��������</a></li>
			<li style="margin-left:20px;"><a href="allTicket.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">������������</a></li>


			 <li><a style="font-size:20px; font-weight:600; margin-bottom:30px;"></a></li> 
			<li style="margin-left:20px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">������ �α׾ƿ�</a></li> 
			<br><br><br> 
</ul>  </div> 
<div id="mypage2">
  <div class="userform">
    <form action="loginOk.jsp" method=post name="login">

    <h2>ȸ����������</h2>
    <br><br>
	<div class="usertb">
	
	<table>
	<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
	<td colspan =6 height="30px" align="left" style="padding-bottom:20px; font-size:20px;"><b>��ü ȸ������</b></td>
<p class="insertuser" style="float:right;"><a href="mnginsertuser.jsp"><input type="button" class="insertButton"  value="+ �ű�ȸ�� ���"></a></p>
	
	</tr>
	<tr>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">���̵�</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">��й�ȣ</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�̸�</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�������</td>	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�޴�����ȣ</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�ּ�</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�̸���</td>
		<td align=center style="padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
		<td align=center style="padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("u_id");   //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ�����
    		String pw =  rs.getString("u_pw");	
			String name = rs.getString("u_name");
    		String birth =  rs.getString("u_birth");	
			String phone = rs.getString("u_phone");
    		String address =  rs.getString("u_address");	
			String email = rs.getString("u_email");
%>
   <tr>                     <!--  �������� ��Ÿ�� ������ ��ũ�κп� ȸ�� ���̵� �Բ� �Ѱ��� -->
 	  <td align=center style="padding:10px; width:50px; height:40px; border-bottom:1px solid #dedede;"> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td align=center style="padding:10px; width:50px; height:40px; border-bottom:1px solid #dedede;"><%=pw%></td>
	  <td align=center style="padding:10px; width:50px; height:40px; border-bottom:1px solid #dedede;"><%=name%></td>
	  <td align=center style="padding:10px; width:100px; height:40px; border-bottom:1px solid #dedede;"><%=birth%></td>
	  <td align=center style="padding:10px; width:100px; height:40px; border-bottom:1px solid #dedede;"><%=phone%></td>
 	  <td align=center style="padding:10px; width:240px; height:60px; border-bottom:1px solid #dedede;"><%=address%></td> 
	  <td align=center style="padding:10px; width:80px; height:40px; border-bottom:1px solid #dedede;"><%=email%></td> 
	  <td align=center style="padding:10px; width:30px; height:40px; border-bottom:1px solid #dedede;"><a href="mnguserupdate.jsp?id=<%=id%>">
		<input type="button" class="updateButton"  value="����"></a></td>
  	  <td align=center style="padding:10px; width:30px; height:40px; font-size:15px; border-bottom:1px solid #dedede;"><a href="mngdeleteuser.jsp?id=<%=id%>">
		<input type="button" class="deleteButton"  value="����"></a></td>
  </tr>
<%
		}  // while���� ��
%>
</table>
</div>
<p>
<br>





</form>
 <br><br>
</div></div></div>
  


  <br><br>
  
   <%@include file="footer.jsp" %>

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