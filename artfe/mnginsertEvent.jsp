<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
  <%@include file="header.jsp" %>
<html>
<head>
<meta charset="euc-kr">
<title>ARTFE</title>

<link rel="stylesheet" href="css/insert.css">
<link rel="icon" href="images/logo.png">

</head>

<body>
  <div class="login-form">
    <form method="post" action="mnginsertEventOk.jsp" name="insert">

    	<h2><b>�ű���� ���</b></h2>
        <br>

   	  <h4><b>��� ��ȣ</b></h4>
            <input type="text"  id="e_no" name="e_no" class="text-field"><br><br>

	  <h4><b>����</b></h4>
			<input type="text" id="e_name" name="e_name" class="text-field"><br><br>

      <h4><b>ī�װ�</b></h4>
            <input type="text"  id="e_ctg" name="e_ctg" class="text-field"><br><br>

      <h4><b>�帣</b></h4>
            <input type="text" id="e_genre" name="e_genre" class="text-field"><br><br>
    
	 <h4><b>�Ⱓ</b></h4>
			<input type="text" id="e_term" name="e_term" class="text-field"><br><br>
		
	<h4><b>ȸ��</b></h4>
			<input type="text" id="e_time" name="e_time" class="text-field"><br><br>

	
      <h4><b>��� ���</b></h4>
			  <input id="address1" name="address1" type="text"  placeholder="�����ȣ" readonly onclick="findAddr()" style="border:1px solid #dedede; width: 30%; height:7%; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;">&nbsp;
			  <input id="addressfind" name="addressfind" type="button" value="�����ȣ �˻�" readonly style="cursor:pointer;" onclick="findAddr()" style="width: 36%;  height:7%; border:1px solid #dedede; padding:10px 16px;  font-size: 16px;  font-family: Pretendard Variable, sans-serif;">
			  <input id="address2" name="address2" type="text" placeholder="�ּ�" style="width: 100%; border:1px solid #dedede; height:7%; padding:10px 16px; font-size:16px;  font-family: Pretendard Variable, sans-serif;" readonly><br>
			  <input id="address3" name="address3" type="text" placeholder="���ּ� �Է�" style="width: 100%; height:7%; border:1px solid #dedede; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;"><br><br>

	  <h4><b>����</b></h4>
            <input type="text" id="e_p_ctg" name="e_p_ctg" class="text-field"><br><br>
				
				
	<h4><b>��� ����</b></h4>
			<textarea rows="10" cols="50" name="e_description" style="font-size:16px; width:100%; height:300px; padding:16px 16px; border: 1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif;"></textarea>
		<br><br>

	<h4><b>����</b></h4>
			<input type="text"  id="e_price" name="e_price" class="text-field">

 		<br><br><br>

            <input type="button" class="submit-btn" value="��ǰ���" onClick="checkValue()" style="cursor:pointer"> 
</form>
        
    </div>
  
  <br><br><br>
  
  
</div>
</center>


	<script type="text/javascript">
		

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.insert.e_no.value == "") 
	{
		alert("����ȣ�� �Է����ּ���. ");
		document.insert.e_no.focus();
		return false;			
	}			

	if (document.insert.e_name.value == "") 
	{
		alert("������ �Է����ּ���.");
		document.insert.e_name.focus();
		return false;			
	}

	if (document.insert.e_ctg.value == "") 
	{
		alert("ī�װ��� �Է����ּ���. ");
		document.insert.e_ctg.focus();
		return false;			
	}

	if (document.insert.e_genre.value == "") 
	{
		alert("�帣�� �Է����ּ���. ");
		document.insert.e_genre.focus();
		return false;			
	}

	if (document.insert.e_term.value == "") 
	{
		alert("�Ⱓ�� �Է����ּ���. ");
		document.insert.e_term.focus();
		return false;			
	}

	if (document.insert.e_time.value == "") 
	{
		alert("ȸ���� �Է����ּ���. ");
		document.insert.e_time.focus();
		return false;			
	}

	if (document.insert.e_p_ctg.value == "") 
		{
			alert("��������� �Է����ּ���. ");
			document.insert.e_p_ctg.focus();
			return false;			
		}

	if (document.insert.e_description.value == "") 
	{
		alert("��缳���� �Է����ּ���. ");
		document.insert.e_description.focus();
		return false;			
	}

	if (document.insert.e_price.value == "") 
	{
		alert("��簡���� �Է����ּ���. ");
		document.insert.e_price.focus();
		return false;			
	}
	insert.submit();
}
           


function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}


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


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</div><%@include file="footer.jsp" %>
</body>
</html>