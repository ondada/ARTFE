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
 <div id="mypage_wrap">
    <div id="mypage">
       <div id="mp">
		<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700;">������ �ɼ�</a></li>
            <li style="margin-left:20px;"><a href="allUser.jsp" style="font-size:17px; font-weight:400; color:gray;">ȸ����������</a></li>
			<li style="margin-left:20px;"><a href="allEvent.jsp" style="font-size:17px; font-weight:400;  color:gray; ">����ǰ��������</a></li>
			<li style="margin-left:20px;"><a href="allTicket.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:#514FF0;">������������</a></li>


			 <li><a style="font-size:20px; font-weight:600; margin-bottom:30px;"></a></li> 
			<li style="margin-left:20px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">������ �α׾ƿ�</a></li> 
			<br><br><br> 
</ul>  </div> 
<div id="mypage2">
  <div class="userform">
    <form action="allTicket.jsp" method=post name="login">
    
    <h2><b>������������</b></h2>
    <br><br>
	<div class="usertb">
	<table>
	<tr style="border-bottom:3px solid #514FF0; padding-bottom:20px;">
	<td colspan =6 height="30px" align="left" style="padding-bottom:20px; font-size:20px;"><b>��ü ��������</b></td>
	<p class="insertuser" style="float:right;"><input type="button" style="display:hidden;" ></p><br><br>
	<tr>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">���Ź�ȣ</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">���̵�</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�����ڸ�</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">����</td>
		<td align=center style="color:gray; padding-top: 20px; padding-bottom:10px; font-weight:400;">�����Ͻ�</td>
		
	</tr>	

<%
		while(rs.next()){  		
		String bNo = rs.getString("bNo");
		String u_id =  rs.getString("u_id");			      
		String r_date = rs.getString("r_date");
		String r_phone =  rs.getString("r_phone");
		String r_address =  rs.getString("r_address");
		String r_name =  rs.getString("r_name");
		String b_date =  rs.getString("b_date");
		String b_time =  rs.getString("b_time");
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
   <tr>                     <!--  �������� ��Ÿ�� ������ ��ũ�κп� ȸ�� ���̵� �Բ� �Ѱ��� -->
 	  <td align=center style="padding:10px; width:20px; height:40px; border-bottom:1px solid #dedede;"><%=bNo%></a></td>
       <td align=center style="padding:10px; width:40px; height:40px; border-bottom:1px solid #dedede;"><%=u_id%></td>
	  <td align=center style="padding:10px; width:40px; height:40px; border-bottom:1px solid #dedede;"><%= r_name%></td>
<td align=center style="padding:10px; width:140px; height:40px; border-bottom:1px solid #dedede;"><%=e_name%></td>
<td align=center style="padding:10px; width:140px; height:40px; border-bottom:1px solid #dedede;"><%=r_date%></td>
	   <td align=center style=" padding:10px; width:60px; height:40px; border-bottom:1px solid #dedede;"><a href="mngticketupdate.jsp?bNo=<%=bNo%>"><input type="button" class="sangseButton"  value="����"></a>
	   <a href="mngdeletetk.jsp?bNo=<%=bNo%>"><input type="button" class="sangseButton"  value="����"></a></td>
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

</div></div></div></div>
  

  
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