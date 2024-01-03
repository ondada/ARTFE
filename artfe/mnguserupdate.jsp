<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/mnguserupdate.css">
<body>

<%
	try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


     //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺��� ��ȸ��
	 String key = request.getParameter("id");   
	 String jsql = "select * from user where u_id = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

    ResultSet rs = pstmt.executeQuery(); 

	 rs.next();
			
	 String id = rs.getString("u_id");
   	 String pw = rs.getString("u_pw");
	 String name = rs.getString("u_name");
	 Date birth = rs.getDate("u_birth");
	 String address = rs.getString("u_address");
	 String phone = rs.getString("u_phone");
	 String email = rs.getString("u_email");

%>
 <div id="mypage_wrap">
<div id="mypage">
	 <div id="mypage2">
		<div class="login-form">
 
    <form action="mnguserupdateresult.jsp" method=post name="mpInfoUpdate">
  <br>
	<h2>ȸ������ ����</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:50px;">
   	   <h4><b>���̵�</b></h4>
            <input type=hidden id="id" name="id" value="<%=id%>" class="text-field">
			 &nbsp<font color="gray"><%=id%></font>
            <br><br><br>

      <h4><b>��й�ȣ</b></h4>
             <input type="password" id="pw" value="<%=pw%>" name="pw" class="text-field" placeholder="(��ҹ���/����/Ư������ �� 2���� �̻� ����, 10-16��)" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
            <br><br><br>
            
        <h4><b>��й�ȣ Ȯ��</b></h4>
           <input type="password" id="pw2" value="<%=pw%>" name="pw2" class="text-field" placeholder="��й�ȣ ���Է�" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
			<br><br><br>

       <h4><b>�̸�</b></h4>
            <input type="text" id="name" value="<%=name%>" name="name" class="text-field" placeholder="�̸� �Է�" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
			<br><br><br>

	  <h4><b>�������</b></h4>
	 <%
	    	String[ ]  birthArr = birth.toString().split("-");  
//  split()�Լ��� String Ÿ�Կ����� ��밡���ϹǷ�, toString()�޼ҵ带 ����Ͽ� birth��
//  Ÿ���� DateŸ�Կ��� StringŸ������ ��(type) ��ȯ ��, split()�Լ��� ������� ��,��,���� �и���.
//  ��, birthArr[0]���� "��",  birthArr[1]���� "��", birthArr[2]���� "��"�� ���� �и��Ǿ� �����
%>		
		
      <input id="YY" name="YY"  value="<%=birthArr[0]%>" type="text" size="4" maxlength="4" placeholder="��) YYYY" style="border:1px solid #dedede; padding:10px; width:70px; font-weight:500; font-family: Pretendard Variable, sans-serif;">&nbsp;�� &nbsp;&nbsp;
      <input id="MM" name="MM" value="<%=birthArr[1]%>" type="text" size="2" maxlength="2" placeholder="MM" style="border:1px solid #dedede; padding:10px; width:50px; font-weight:500; font-family: Pretendard Variable, sans-serif;">&nbsp;�� &nbsp;&nbsp;
	  <input id="DD" name="DD"  value="<%=birthArr[2]%>" type="text" size="2" maxlength="2" placeholder="DD" style="border:1px solid #dedede; padding:10px; width:50px; font-weight:500; font-family: Pretendard Variable, sans-serif;">&nbsp;�� &nbsp;&nbsp;
	  <br><br><br>
            
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

   
      <h4><b>�ּ�</b></h4>
         <input type="text" id="address" name="address" value="<%=address%>" class="text-field" placeholder="�ּ� �Է�" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
		 <br><br><br>
            
      <h4><b>�̸���</b></h4>
        <input type="text" id="email" name="email" value="<%=email%>" class="text-field" placeholder="�̸��� �Է�" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
 		<br><br><br>
      
            <input type="button" class="mainbtn" value="�����Ϸ�" onClick="checkValue()" style="cursor:pointer"> 
     <input type="reset" class="mainbtn-reset" value="���" onClick="location.href='main.jsp'" style="cursor:pointer"> 
</form>
        
    </div>
    </div></div>

  
  
  <br><br>
  




<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});


function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.mpInfoUpdate.id.value == "") 
	{
		alert("���̵� �Է����ּ���. ");
		document.mpInfoUpdate.id.focus();
		return false;			
	}			

	if (document.mpInfoUpdate.pw.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���.");
		return false;			
	}

	if (document.mpInfoUpdate.pw2.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���. ");
		document.mpInfoUpdate.pw2.focus();
		return false;			
	}

	if (document.mpInfoUpdate.YY.value == "") 
	{
		alert("��������� �Է����ּ���. ");
		document.mpInfoUpdate.YY.focus();
		return false;			
	}

	if (document.mpInfoUpdate.MM.value == "") 
	{
		alert("��������� �Է����ּ���. ");
		document.mpInfoUpdate.MM.focus();
		return false;			
	}

	if (document.mpInfoUpdate.DD.value == "") 
	{
		alert("��������� �Է����ּ���. ");
		document.mpInfoUpdate.DD.focus();
		return false;			
	}


	if (document.mpInfoUpdate.phone1.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.mpInfoUpdate.phone1.focus();
		return false;			
	}
 
	if (document.mpInfoUpdate.phone2.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.mpInfoUpdate.phone2.focus();
		return false;			
	}

    	if (document.mpInfoUpdate.phone3.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.mpInfoUpdate.phone3.focus();
		return false;			
	}

if (document.mpInfoUpdate.address.value == "") 
	{
		alert("�ּҸ� �Է����ּ���. ");
		document.mpInfoUpdate.address.focus();
		return false;			
	}

if (document.mpInfoUpdate.email.value == "") 
	{
		alert("�̸����� �Է����ּ���. ");
		document.mpInfoUpdate.email.focus();
		return false;			
	}

   if(mpInfoUpdate.pw.value==mpInfoUpdate.pw2.value) 
			{ 
			mpInfoUpdate.submit();
			console.log("������")
			}
			else{
				alert("��й�ȣ�� ���� �ʽ��ϴ�. ");
			}
}

	</script>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
    <%@include file="footer.jsp" %></div>
</body>
</html>