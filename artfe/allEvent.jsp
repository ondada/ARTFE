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

     String jsql = "select * from event";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>
   <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700;">������ �ɼ�</a></li>
            <li style="margin-left:20px;"><a href="allUser.jsp" style="font-size:17px; font-weight:400; color:gray;">ȸ����������</a></li>
			<li style="margin-left:20px;"><a href="allEvent.jsp" style="font-size:17px; font-weight:400; color:#514FF0; ">����ǰ��������</a></li>
			<li style="margin-left:20px;"><a href="allTicket.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">������������</a></li>


			 <li><a style="font-size:20px; font-weight:600; margin-bottom:30px;"></a></li> 
			<li style="margin-left:20px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">������ �α׾ƿ�</a></li> 
			<br><br><br> 
</ul>  </div> 
<div id="mypage2">
  <div class="userform">
    <form action="allEvent.jsp" method=post name="login">

    <h2><b>����ǰ��������</b></h2>
    <br><br>
	<div class="usertb">
	<table>
	<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
	<td colspan =6 height="30px" align="left" style="padding-bottom:20px; font-size:20px;"><b>��ü ����ǰ����</b></td>
	<p class="insertuser" style="float:right;"><a href="mnginsertEvent.jsp"><input type="button" class="insertButton"  value="+ �ű���� ���"></a></p>

	<tr>
	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400; padding-right:10px;">����ȣ</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">ī�װ�</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�帣</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">����</td>	
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">����</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">���</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�Ⱓ</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">����</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;"></td>
	</tr>	
<%
		while(rs.next()){
	
    		String no =  rs.getString("e_no");	
			String ctg = rs.getString("e_ctg");   //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ�����
			String genre = rs.getString("e_genre");
    		String name =  rs.getString("e_name");	
			String price = rs.getString("e_price");
    		String place =  rs.getString("e_place");	
			String term = rs.getString("e_term");
			String time = rs.getString("e_time");
			String description = rs.getString("e_description");
%>
   <tr>                     <!--  �������� ��Ÿ�� ������ ��ũ�κп� ȸ�� ���̵� �Բ� �Ѱ��� -->
 	  <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><a href="selectDetailMember.jsp?e_no=<%=no%>"><%=no%></a></td>
       <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=ctg%></td>
	   <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=genre%></td>
	   <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=name%></td>
	  <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=price%></td>
 	   <td align=center style="padding:10px; width:10px; height:40px; border-bottom:1px solid #dedede;"><%=place%></td> 
	   <td align=center style="padding:10px; width:40px; height:40px; border-bottom:1px solid #dedede;"><%=term%></td> 
	 <td align=center style="padding:10px; width:500px; height:40px; border-bottom:1px solid #dedede;"><%=description%></td> 
	   <td align=center style="padding:4px; height:40px; border-bottom:1px solid #dedede;"><a href="mngeventupdate.jsp?no=<%=no%>"><input type="button" class="updateButton"  value="����"></a></td>
  	   <td align=center style="padding:4px; height:40px; border-bottom:1px solid #dedede;"><a href="mngdeleteEvent.jsp?no=<%=no%>">	<input type="button" class="deleteButton"  value="����"></a></td>
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
</div>
</center>

<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
			allEvent.submit();
}

	</script>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>