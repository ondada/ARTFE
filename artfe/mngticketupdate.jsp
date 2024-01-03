<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="icon" href="images/logo.png">
<link rel="stylesheet" href="css/insert.css">
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
	 String key = request.getParameter("bNo");   
	 String jsql = "select * from bookinfo where bNo = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

    ResultSet rs = pstmt.executeQuery(); 

	 rs.next();
			
			String bNo = rs.getString("bNo");   //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ�����
    		String u_id =  rs.getString("u_id");	
			String r_date = rs.getString("r_date");
    		String r_name =  rs.getString("r_name");	
			String r_address = rs.getString("r_address");
    		String b_time =  rs.getString("b_time");	
			String b_date = rs.getString("b_date");
			String phone = rs.getString("r_phone");


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

 <div class="login-form">
 
  <div class="userform">
        <form action="mngtkupdateResult.jsp" method=post name="ticketupdate">

    <h2><b>�������� ����</b></h2>
    <br>
	<div class="usertb">

			  <h4><b>���Ź�ȣ</b></h4>
			<input type="hidden" id="bNo" value="<%=bNo%>" name="bNo" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=bNo%></font><br><br><br>
	
			<h4><b>���̵�</b></h4>
			<input type="hidden" id="u_id" value="<%=u_id%>" name="u_id" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=u_id%></font><br><br><br>

			<h4><b>�����ڸ�</b></h4>
			<input type="hidden" id="r_name" value="<%=r_name%>" name="r_name" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=r_name%></font><br><br><br>
			
			<h4><b>������</b></h4>
			<input type="hidden" id="r_date" value="<%=r_date%>" name="r_date" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=r_date%></font><br><br><br>
			
			<h4><b>���ż���</b></h4>
			<input type="hidden" id="bookQty" value="<%=bookQty%>" name="bookQty" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=bookQty%></font><br><br><br>

			<h4><b>����</b></h4>
			<input type="hidden" id="e_name" value="<%=e_name%>" name="e_name" class="text-field">&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><%=e_name%></font><br><br><br>
			
			<h4><b>������</b></h4>
			<input type="date" id="b_date" value="<%=b_date%>" name="b_date" class="text-field"><br><br>
		
			<h4><b>����ȸ��</b></h4>
			<select id="b_time" name="b_time" value="<%=b_time%>" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif; border-radius: 5px;">
                <option value="1ȸ��" name="e_time">1ȸ�� (09:00~12:00)</option>
                <option value="2ȸ��" name="e_time">2ȸ�� (12:00~15:00)</option>
                <option value="3ȸ��" name="e_time">3ȸ�� (15:00~18:00)</option>
            </select><br><br>
		
			<h4><b>�����</b></h4>
			<input id="address1" name="address1" type="text"  placeholder="�����ȣ" readonly onclick="findAddr()" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
	  <input id="addressfind" name="addressfind" type="button" value="�����ȣ �˻�" readonly style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;" onclick="findAddr()" ><br>
	  <input id="address2" name="address2"type="text" value="<%=r_address%>" placeholder="�ּ�" readonly style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br>
	  <input id="address3" name="address3" type="text" placeholder="���ּ� �Է�" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;"><br><br>
		
			 <h4><b>�޴�����ȣ</b></h4>

<%
	    	String[ ] phoneArr  = phone.split("-");  
       //  String hpArr[ ]  = phone.split("-"); �� ����
       // ������(-)�� �߽����� �޴�����ȣ ���ڸ�, �߰��ڸ�, ���ڸ��� ���� �и� ��
       // hpArr[0], hpArr[1], hpArr[2]�� ���� �����Ŵ

			String[ ]  phoneSelected = new String[3];  
    	// "selected" ���ڿ��� �����ϱ� ���� �뵵�� �迭 ����

			if(phoneArr[0].equals("010"))
			{
				phoneSelected[0] = "selected";
			}  
			else if(phoneArr[0].equals("011"))
			{
				phoneSelected[1] = "selected";
			}
			else if(phoneArr[0].equals("012"))
			{
				phoneSelected[2] = "selected";
			}

%>

     <select id="phone1" name="phone1" style="border:1px solid #dedede; font-weight:bold; height:40px; padding-left:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
                <option value="010" <%=phoneSelected[0]%>>010
                <option value="011" <%=phoneSelected[1]%>>011
                <option value="012" <%=phoneSelected[2]%>>012
            </select> &nbsp;-&nbsp;
      <input id="phone2" name="phone2"  value="<%=phoneArr[1]%>" type="text" size="3" maxlength="4" style="border:1px solid #dedede; height:40px; padding-left:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;"> &nbsp;-&nbsp;
      <input id="phone3" name="phone3"  value="<%=phoneArr[2]%>" type="text" size="3" maxlength="4" style="border:1px solid #dedede; height:40px; padding-left:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
		<br><br><br>
		
		


	<br><br><br>
	<input type="submit" class="submit-btn" value="�����Ϸ�" style="cursor:pointer"> 
	

</form>
</div> 
  
  
	<br><br>
	<br>

</div> 
</center>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
            var jibunAddr = data.jibunAddress; // ���� �ּ� ����
            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById('address1').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address2").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address3").value = jibunAddr;
            }
        }
    }).open();
}


	</script>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div>
<%@include file="footer.jsp" %>
</body>
</html>