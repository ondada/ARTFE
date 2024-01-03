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

     String jsql = "select * from bookinfo";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

 <center>
  <div class="userform" >
    <form action="loginOk.jsp" method=post name="login">

    <h2><b>������������</b></h2>
    <br><br>
	<div class="usertb">
	


<%
		while(rs.next()){
			String bNo = rs.getString("bNo");   //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ�����
    		String u_id =  rs.getString("u_id");	
			String r_date = rs.getString("r_date");
    		String r_name =  rs.getString("r_name");	
			String r_address = rs.getString("r_address");
    		String b_time =  rs.getString("b_time");	
			String b_date = rs.getString("b_date");
			String r_phone = rs.getString("r_phone");
%>
	 <%

	String jsql0 = "select * from bookproduct where bNo=?";
	PreparedStatement pstmt0 = con.prepareStatement(jsql0);
	pstmt0.setString(1,bNo);

	ResultSet rs0 = pstmt0.executeQuery();


%>


<%
	
	

		String jsql2 = "select e_no, bookQty from bookproduct where bNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, bNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		rs2.next();
	

			String	e_no =  rs2.getString("e_no");	
    		int bookQty = rs2.getInt("bookQty");	

			String jsql3 = "select e_name, e_time from event where e_no = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, e_no);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	e_name =  rs3.getString("e_name");	
			String	e_time =  rs3.getString("e_time");//  goods ���̺�κ��� ��ǰ�� ����

%>  
  <table style="border-collapse: collapse; width:50%;">
		 <tr rowspan=10>
			<td align=center style="color:gray; padding:10px; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>���Ź�ȣ</b></td>
			<td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=bNo%></td>
			</tr>
			<tr>
			<td align=center style="color:gray; padding:10px; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>����</b></td>
			<td align=center style="font-size: 14px; padding:10px; width:300px; height:20px; border-bottom:1px solid #dedede;"><%=e_name%></td>
		</tr>

		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>������</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=b_date%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>����ȸ��</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=b_time%></td>
		</tr>
		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>���ż���</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=bookQty%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding:10px; padding-bottom:2px; font-weight:100; width:20px;"><b>������</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_date%></td>

		</tr>

		<tr rowspan=10>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>������</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_name%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:20px;"><b>�޴���ȭ</b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_phone%></td>
			 </tr>
			 <tr>
			 <td align=center style="color:gray; font-size: 17px; padding-bottom:2px; font-weight:100; width:200px;"><b>�����<b></td>
			 <td align=center style="font-size: 14px; padding:10px; width:80px; height:20px; border-bottom:1px solid #dedede;"><%=r_address%></td>
		</tr>
		
 </table>
 <br><br>
 
	  <td align=center style="padding:10px; width:70px; height:40px; border-bottom:1px solid #dedede;"><a href="mngticketupdate.jsp?bNo=<%=bNo%>">
		<input type="button" class="updateButton"  value="����"></a></td><td align=center style="padding:10px; width:70px; height:40px; border-bottom:1px solid #dedede;"><a href="mngdeletetk.jsp?bNo=<%=bNo%>">
		<input type="button" class="updateButton"  value="����"></a></td>
<%
		}  // while���� ��
%>
</table>
</div>
<p>
<br>





</form>
 <br><br>
           <a href="mngindex.jsp"><input type="button" class="indexButton" value="������ �ɼ� ��ü����"></a>
</div>
  


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