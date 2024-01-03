<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/insert.css">

<body>
 
  <div class="login-form">
    <form method=post action="mnginsertuserOk.jsp" name="insert">

    	<h2><b>신규회원 등록</b></h2>
        <br>
			<h4><b>아이디 <font color="#514FF0">*</font></b>
<a href="javascript:checkID()"> <input type="button"  value="아이디 중복확인" style="width:100px; height:30px; padding:6px; margin-bottom:4px; font-size:12px; font-weight:600; background-color:white; color:black; border:1px solid #b0b0b0; float:right; cursor: pointer; font-family: Pretendard Variable, sans-serif;"></a></h4>
            <input type="text" id="id" name="id" class="text-field" placeholder="(대소문자/숫자, 4-8자)">	 
			<br><br>
           
       <h4><b>비밀번호 <font color="#514FF0">*</font></b></h4>
            <input type="password" id="password" name="pw" class="text-field" placeholder="(대소문자/숫자/특수문자 중 2가지 이상 조합, 10-16자)">
<br><br>
            
       <h4><b>비밀번호 확인 <font color="#514FF0">*</font></b></h4>
            <input type="password" id="password" name="pw2" class="text-field" placeholder="비밀번호 재입력">
<br><br>

       <h4><b>이름 <font color="#514FF0">*</font></b></h4>
            <input type="text" id="Name" name="name" class="text-field" placeholder="이름 입력">
<br><br>

	<h4><b>생년월일 <font color="#514FF0">*</font></b></h4>
      <input id="YY" name="YY"  type="text" size="4" maxlength="4" placeholder="예) YYYY" style="font-size: 16px; border:1px solid #dedede; padding:10px 16px;  width: 26%; height:7%; font-family: Pretendard Variable, sans-serif;">&nbsp;년 &nbsp;&nbsp;
      <input id="MM" name="MM" type="text" size="2" maxlength="2" placeholder="MM" style="font-size: 16px; border:1px solid #dedede; padding:10px 16px; width: 16%; height:7%; font-family: Pretendard Variable, sans-serif;">&nbsp;월 &nbsp;&nbsp;
	  <input id="DD" name="DD" type="text" size="2" maxlength="2" placeholder="DD" style="font-size: 16px; border:1px solid #dedede; padding:10px 16px;  width: 16%; height:7%; font-family: Pretendard Variable, sans-serif;">&nbsp;일
<br><br>
            
      <h4><b>휴대폰번호 <font color="#514FF0">*</font></b></h4>
      <select id="phone1" name="phone1" style="font-size: 16px; border:1px solid #dedede; font-weight:bold; width: 26%; height:7%; padding:10px 16px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
                <option>010</option>
                <option>011</option>
                <option>012</option>
            </select> &nbsp;-&nbsp;
      <input id="phone2" name="phone2"  type="text" size="5" maxlength="4" style="font-size: 16px; border:1px solid #dedede; width: 26%; height:7%; padding:10px 16px; font-family: Pretendard Variable, sans-serif;"> &nbsp;-&nbsp;
      <input id="phone3" name="phone3" type="text" size="5" maxlength="4" style="font-size: 16px; border:1px solid #dedede; width: 26%;height:7%; padding:10px 16x;  font-family: Pretendard Variable, sans-serif;" >
<br><br>
          
       <h4><b>주소 <font color="#514FF0">*</font></b></h4>
	  <input id="address1" name="address1" type="text"  placeholder="우편번호" readonly onclick="findAddr()"style="border:1px solid #dedede; width: 30%; height:7%; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;">
	  <input id="addressfind" name="addressfind" type="button" value="우편번호 검색" readonly style="cursor:pointer;" onclick="findAddr()"style="width: 36%;  height:7%; border:1px solid #dedede; padding:10px 16px;  font-size: 16px;  font-family: Pretendard Variable, sans-serif;">
	  <input id="address2" name="address2"type="text" placeholder="주소" style="width: 100%; border:1px solid #dedede; height:7%; padding:10px 16px; font-size:16px;  font-family: Pretendard Variable, sans-serif;"readonly><br>
	  <input id="address3" name="address3" type="text" placeholder="상세주소 입력"style="width: 100%; height:7%; border:1px solid #dedede; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;">
<br><br>
				
       <h4><b>이메일 <font color="#514FF0">*</font></b></h4>
        <input type="text" id="email" name="email" class="text-field" style="width: 100%; height:7%; border:1px solid #dedede; padding:10px 16px; font-size: 16px;; font-family: Pretendard Variable, sans-serif;" placeholder="예) example@artfe.com">
 		
      <!-- 체크박스 -->
<!--<form action="" id="joinForm">-->

      <!--  </form>-->
<br><br><br>
      
            <input type="button" class="submit-btn" value="회원가입" onClick="checkValue()" style="cursor:pointer"> 
</form>
        
    </div>
  
  <br><br><br>
  
  <%@include file="footer.jsp" %>
</div>
</center>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.insert.id.value == "") 
	{
		alert("아이디를 입력해주세요. ");
		document.insert.id.focus();
		return false;			
	}			

	if (document.insert.pw.value == "") 
	{
		alert("비밀번호를 입력해주세요.");
		document.insert.pw.focus();
		return false;			
	}

	if (document.insert.pw2.value == "") 
	{
		alert("비밀번호를 입력해주세요. ");
		document.insert.pw2.focus();
		return false;			
	}

	if (document.insert.YY.value == "") 
	{
		alert("생년월일을 입력해주세요. ");
		document.insert.YY.focus();
		return false;			
	}

	if (document.insert.MM.value == "") 
	{
		alert("생년월일을 입력해주세요. ");
		document.insert.MM.focus();
		return false;			
	}

	if (document.insert.DD.value == "") 
	{
		alert("생년월일을 입력해주세요. ");
		document.insert.DD.focus();
		return false;			
	}


	if (document.insert.phone1.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.insert.phone1.focus();
		return false;			
	}
 
	if (document.insert.phone2.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.insert.phone2.focus();
		return false;			
	}

    	if (document.insert.phone3.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.insert.phone3.focus();
		return false;			
	}

if (document.insert.address1.value == "") 
	{
		alert("주소를 입력해주세요. ");
		document.insert.address.focus();
		return false;			
	}

 if(document.insert.address3.value == "") 
    {
		alert("상세주소를 입력해 주세요!");
		document.insert.address2.focus();
		return;
    }


if (document.insert.email.value == "") 
	{
		alert("이메일을 입력해주세요. ");
		document.insert.email.focus();
		return false;			
	}

   if(insert.pw.value==insert.pw2.value) 
			{
			insert.submit();
			console.log("보내짐")
			}
			else{
				alert("비밀번호가 맞지 않습니다. ");
			}
}

function checkID()		// ID를 입력받은 후에 팝업창을 띄워주면서 
{  										//   checkId.jsp (중복검사 수행)를 호출해 주는 자바스크립트 함수
	var id = insert.id.value;		//  form의 이름이 newMem인 것에 주목할 것!

    if (id  == "")				//   11~16행:  ID를 입력없이 ID 중복체크 버튼을 클릭할 경우의 처리
    {
		alert("ID를 입력해 주세요!"); 
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
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
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