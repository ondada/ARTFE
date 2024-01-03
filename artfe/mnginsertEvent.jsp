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

    	<h2><b>신규행사 등록</b></h2>
        <br>

   	  <h4><b>행사 번호</b></h4>
            <input type="text"  id="e_no" name="e_no" class="text-field"><br><br>

	  <h4><b>행사명</b></h4>
			<input type="text" id="e_name" name="e_name" class="text-field"><br><br>

      <h4><b>카테고리</b></h4>
            <input type="text"  id="e_ctg" name="e_ctg" class="text-field"><br><br>

      <h4><b>장르</b></h4>
            <input type="text" id="e_genre" name="e_genre" class="text-field"><br><br>
    
	 <h4><b>기간</b></h4>
			<input type="text" id="e_term" name="e_term" class="text-field"><br><br>
		
	<h4><b>회차</b></h4>
			<input type="text" id="e_time" name="e_time" class="text-field"><br><br>

	
      <h4><b>행사 장소</b></h4>
			  <input id="address1" name="address1" type="text"  placeholder="우편번호" readonly onclick="findAddr()" style="border:1px solid #dedede; width: 30%; height:7%; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;">&nbsp;
			  <input id="addressfind" name="addressfind" type="button" value="우편번호 검색" readonly style="cursor:pointer;" onclick="findAddr()" style="width: 36%;  height:7%; border:1px solid #dedede; padding:10px 16px;  font-size: 16px;  font-family: Pretendard Variable, sans-serif;">
			  <input id="address2" name="address2" type="text" placeholder="주소" style="width: 100%; border:1px solid #dedede; height:7%; padding:10px 16px; font-size:16px;  font-family: Pretendard Variable, sans-serif;" readonly><br>
			  <input id="address3" name="address3" type="text" placeholder="상세주소 입력" style="width: 100%; height:7%; border:1px solid #dedede; padding:10px 16px; font-size: 16px; font-family: Pretendard Variable, sans-serif;"><br><br>

	  <h4><b>지역</b></h4>
            <input type="text" id="e_p_ctg" name="e_p_ctg" class="text-field"><br><br>
				
				
	<h4><b>행사 설명</b></h4>
			<textarea rows="10" cols="50" name="e_description" style="font-size:16px; width:100%; height:300px; padding:16px 16px; border: 1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif;"></textarea>
		<br><br>

	<h4><b>가격</b></h4>
			<input type="text"  id="e_price" name="e_price" class="text-field">

 		<br><br><br>

            <input type="button" class="submit-btn" value="상품등록" onClick="checkValue()" style="cursor:pointer"> 
</form>
        
    </div>
  
  <br><br><br>
  
  
</div>
</center>


	<script type="text/javascript">
		

function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.insert.e_no.value == "") 
	{
		alert("행사번호를 입력해주세요. ");
		document.insert.e_no.focus();
		return false;			
	}			

	if (document.insert.e_name.value == "") 
	{
		alert("행사명을 입력해주세요.");
		document.insert.e_name.focus();
		return false;			
	}

	if (document.insert.e_ctg.value == "") 
	{
		alert("카테고리를 입력해주세요. ");
		document.insert.e_ctg.focus();
		return false;			
	}

	if (document.insert.e_genre.value == "") 
	{
		alert("장르를 입력해주세요. ");
		document.insert.e_genre.focus();
		return false;			
	}

	if (document.insert.e_term.value == "") 
	{
		alert("기간을 입력해주세요. ");
		document.insert.e_term.focus();
		return false;			
	}

	if (document.insert.e_time.value == "") 
	{
		alert("회차를 입력해주세요. ");
		document.insert.e_time.focus();
		return false;			
	}

	if (document.insert.e_p_ctg.value == "") 
		{
			alert("행사지역을 입력해주세요. ");
			document.insert.e_p_ctg.focus();
			return false;			
		}

	if (document.insert.e_description.value == "") 
	{
		alert("행사설명을 입력해주세요. ");
		document.insert.e_description.focus();
		return false;			
	}

	if (document.insert.e_price.value == "") 
	{
		alert("행사가격을 입력해주세요. ");
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

</div><%@include file="footer.jsp" %>
</body>
</html>