<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/insert.css">

<body>
 
  <div class="login-form">
    <form method=post action="mnginsertuserOk.jsp" name="insert">

    	<h2><b>�ű�ȸ�� ���</b></h2>
        <br>
			<h4><b>���̵� <font color="#514FF0">*</font></b>
<a href="javascript:checkID()"> <input type="button"  value="���̵� �ߺ�Ȯ��" style="width:100px; height:30px; padding:6px; margin-bottom:4px; font-size:12px; font-weight:600; background-color:white; color:black; border:1px solid #b0b0b0; float:right; cursor: pointer; font-family: Pretendard Variable, sans-serif;"></a></h4>
            <input type="text" id="id" name="id" class="text-field" placeholder="(��ҹ���/����, 4-8��)">	 
			<br><br>
           
       <h4><b>��й�ȣ <font color="#514FF0">*</font></b></h4>
            <input type="password" id="password" name="pw" class="text-field" placeholder="(��ҹ���/����/Ư������ �� 2���� �̻� ����, 10-16��)">
<br><br>
            
       <h4><b>��й�ȣ Ȯ�� <font color="#514FF0">*</font></b></h4>
            <input type="password" id="password" name="pw2" class="text-field" placeholder="��й�ȣ ���Է�">
<br><br>

       <h4><b>�̸� <font color="#514FF0">*</font></b></h4>
            <input type="text" id="Name" name="name" class="text-field" placeholder="�̸� �Է�">
<br><br>

	<h4><b>������� <font color="#514FF0">*</font></b></h4>
      <input id="YY" name="YY"  type="text" size="4" maxlength="4" placeholder="��) YYYY" style="font-size: 16px; border:1px solid #dedede; padding:10px 16px;  width: 26%; height:7%; font-family: Pretendard Variable, sans-serif;">&nbsp;�� &nbsp;&nbsp;
      <input id="MM" name="MM" type="text" size="2" maxlength="2" placeholder="MM" style="font-size: 16px; border:1px solid #dedede; padding:10px 16px; width: 16%; height:7%; font-family: Pretendard Variable, sans-serif;">&nbsp;�� &nbsp;&nbsp;
	  <input id="DD" name="DD" type="text" size="2" maxlength="2" placeholder="DD" style="font-size: 16px; border:1px solid #dedede; padding:10px 16px;  width: 16%; height:7%; font-family: Pretendard Variable, sans-serif;">&nbsp;��
<br><br>
            
      <h4><b>�޴�����ȣ <font color="#514FF0">*</font></b></h4>
      <select id="phone1" name="phone1" style="font-size: 16px; border:1px solid #dedede; font-weight:bold; width: 26%; height:7%; padding:10px 16px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
                <option>010</option>
                <option>011</option>
                <option>012</option>
            </select> &nbsp;-&nbsp;
      <input id="phone2" name="phone2"  type="text" size="5" maxlength="4" style="font-size: 16px; border:1px solid #dedede; width: 26%; height:7%; padding:10px 16px; font-family: Pretendard Variable, sans-serif;"> &nbsp;-&nbsp;
      <input id="phone3" name="phone3" type="text" size="5" maxlength="4" style="font-size: 16px; border:1px solid #dedede; width: 26%;height:7%; padding:10px 16x;  font-family: Pretendard Variable, sans-serif;" >
<br><br>
          
       <h4><b>�ּ� <font color="#514FF0">*</font></b></h4>
	  <input id="address1" name="address1" type="text"  placeholder="�����ȣ" readonly onclick="findAddr()"style="border:1px solid #dedede; width: 30%; height:7%; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;">
	  <input id="addressfind" name="addressfind" type="button" value="�����ȣ �˻�" readonly style="cursor:pointer;" onclick="findAddr()"style="width: 36%;  height:7%; border:1px solid #dedede; padding:10px 16px;  font-size: 16px;  font-family: Pretendard Variable, sans-serif;">
	  <input id="address2" name="address2"type="text" placeholder="�ּ�" style="width: 100%; border:1px solid #dedede; height:7%; padding:10px 16px; font-size:16px;  font-family: Pretendard Variable, sans-serif;"readonly><br>
	  <input id="address3" name="address3" type="text" placeholder="���ּ� �Է�"style="width: 100%; height:7%; border:1px solid #dedede; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;">
<br><br>
				
       <h4><b>�̸��� <font color="#514FF0">*</font></b></h4>
        <input type="text" id="email" name="email" class="text-field" style="width: 100%; height:7%; border:1px solid #dedede; padding:10px 16px; font-size: 16px;; font-family: Pretendard Variable, sans-serif;" placeholder="��) example@artfe.com">
 		
      <!-- üũ�ڽ� -->
<!--<form action="" id="joinForm">-->

      <!--  </form>-->
<br><br><br>
      
            <input type="button" class="submit-btn" value="ȸ������" onClick="checkValue()" style="cursor:pointer"> 
</form>
        
    </div>
  
  <br><br><br>
  
  <%@include file="footer.jsp" %>
</div>
</center>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">

function checkValue()             // �ֹ����� ���Է��׸� �κ��� üũ�ϴ� �ڹٽ�ũ��Ʈ �Լ�
{
	if (document.insert.id.value == "") 
	{
		alert("���̵� �Է����ּ���. ");
		document.insert.id.focus();
		return false;			
	}			

	if (document.insert.pw.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���.");
		document.insert.pw.focus();
		return false;			
	}

	if (document.insert.pw2.value == "") 
	{
		alert("��й�ȣ�� �Է����ּ���. ");
		document.insert.pw2.focus();
		return false;			
	}

	if (document.insert.YY.value == "") 
	{
		alert("��������� �Է����ּ���. ");
		document.insert.YY.focus();
		return false;			
	}

	if (document.insert.MM.value == "") 
	{
		alert("��������� �Է����ּ���. ");
		document.insert.MM.focus();
		return false;			
	}

	if (document.insert.DD.value == "") 
	{
		alert("��������� �Է����ּ���. ");
		document.insert.DD.focus();
		return false;			
	}


	if (document.insert.phone1.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.insert.phone1.focus();
		return false;			
	}
 
	if (document.insert.phone2.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.insert.phone2.focus();
		return false;			
	}

    	if (document.insert.phone3.value == "") 
	{
		alert("��ȭ��ȣ�� �Է����ּ���. ");
		document.insert.phone3.focus();
		return false;			
	}

if (document.insert.address1.value == "") 
	{
		alert("�ּҸ� �Է����ּ���. ");
		document.insert.address.focus();
		return false;			
	}

 if(document.insert.address3.value == "") 
    {
		alert("���ּҸ� �Է��� �ּ���!");
		document.insert.address2.focus();
		return;
    }


if (document.insert.email.value == "") 
	{
		alert("�̸����� �Է����ּ���. ");
		document.insert.email.focus();
		return false;			
	}

   if(insert.pw.value==insert.pw2.value) 
			{
			insert.submit();
			console.log("������")
			}
			else{
				alert("��й�ȣ�� ���� �ʽ��ϴ�. ");
			}
}

function checkID()		// ID�� �Է¹��� �Ŀ� �˾�â�� ����ָ鼭 
{  										//   checkId.jsp (�ߺ��˻� ����)�� ȣ���� �ִ� �ڹٽ�ũ��Ʈ �Լ�
	var id = insert.id.value;		//  form�� �̸��� newMem�� �Ϳ� �ָ��� ��!

    if (id  == "")				//   11~16��:  ID�� �Է¾��� ID �ߺ�üũ ��ư�� Ŭ���� ����� ó��
    {
		alert("ID�� �Է��� �ּ���!"); 
		insert.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
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


</body>
</html>