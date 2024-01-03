<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/mnguserupdate.css">
<body>

<%
	try{
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


     //  로그인폼(login.jsp)에서 입력한 ID를 포함한 레코드를 member 테이블에서 조회함
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
	<h2>회원정보 수정</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:50px;">
   	   <h4><b>아이디</b></h4>
            <input type=hidden id="id" name="id" value="<%=id%>" class="text-field">
			 &nbsp<font color="gray"><%=id%></font>
            <br><br><br>

      <h4><b>비밀번호</b></h4>
             <input type="password" id="pw" value="<%=pw%>" name="pw" class="text-field" placeholder="(대소문자/숫자/특수문자 중 2가지 이상 조합, 10-16자)" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
            <br><br><br>
            
        <h4><b>비밀번호 확인</b></h4>
           <input type="password" id="pw2" value="<%=pw%>" name="pw2" class="text-field" placeholder="비밀번호 재입력" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
			<br><br><br>

       <h4><b>이름</b></h4>
            <input type="text" id="name" value="<%=name%>" name="name" class="text-field" placeholder="이름 입력" style="border:1px solid #dedede; padding:10px; width:200px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
			<br><br><br>

	  <h4><b>생년월일</b></h4>
	 <%
	    	String[ ]  birthArr = birth.toString().split("-");  
//  split()함수는 String 타입에서만 사용가능하므로, toString()메소드를 사용하여 birth의
//  타입을 Date타입에서 String타입으로 형(type) 변환 후, split()함수를 적용시켜 년,월,일을 분리함.
//  즉, birthArr[0]에는 "년",  birthArr[1]에는 "월", birthArr[2]에는 "일"이 각각 분리되어 저장됨
%>		
		
      <input id="YY" name="YY"  value="<%=birthArr[0]%>" type="text" size="4" maxlength="4" placeholder="예) YYYY" style="border:1px solid #dedede; padding:10px; width:70px; font-weight:500; font-family: Pretendard Variable, sans-serif;">&nbsp;년 &nbsp;&nbsp;
      <input id="MM" name="MM" value="<%=birthArr[1]%>" type="text" size="2" maxlength="2" placeholder="MM" style="border:1px solid #dedede; padding:10px; width:50px; font-weight:500; font-family: Pretendard Variable, sans-serif;">&nbsp;월 &nbsp;&nbsp;
	  <input id="DD" name="DD"  value="<%=birthArr[2]%>" type="text" size="2" maxlength="2" placeholder="DD" style="border:1px solid #dedede; padding:10px; width:50px; font-weight:500; font-family: Pretendard Variable, sans-serif;">&nbsp;일 &nbsp;&nbsp;
	  <br><br><br>
            
      <h4><b>휴대폰번호</b></h4>

<%
	    	String[ ] phoneArr  = phone.split("-");  
       //  String hpArr[ ]  = phone.split("-"); 와 동일
       // 하이픈(-)을 중심으로 휴대폰번호 앞자리, 중간자리, 뒷자리를 각각 분리 후
       // hpArr[0], hpArr[1], hpArr[2]에 각각 저장시킴

			String[ ]  phoneSelected = new String[3];  
    	// "selected" 문자열을 저장하기 위한 용도의 배열 생성

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

   
      <h4><b>주소</b></h4>
         <input type="text" id="address" name="address" value="<%=address%>" class="text-field" placeholder="주소 입력" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
		 <br><br><br>
            
      <h4><b>이메일</b></h4>
        <input type="text" id="email" name="email" value="<%=email%>" class="text-field" placeholder="이메일 입력" style="border:1px solid #dedede; padding:10px; font-weight:500; font-family: Pretendard Variable, sans-serif;">
 		<br><br><br>
      
            <input type="button" class="mainbtn" value="수정완료" onClick="checkValue()" style="cursor:pointer"> 
     <input type="reset" class="mainbtn-reset" value="취소" onClick="location.href='main.jsp'" style="cursor:pointer"> 
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


function checkValue()             // 주문서의 미입력항목 부분을 체크하는 자바스크립트 함수
{
	if (document.mpInfoUpdate.id.value == "") 
	{
		alert("아이디를 입력해주세요. ");
		document.mpInfoUpdate.id.focus();
		return false;			
	}			

	if (document.mpInfoUpdate.pw.value == "") 
	{
		alert("비밀번호를 입력해주세요.");
		return false;			
	}

	if (document.mpInfoUpdate.pw2.value == "") 
	{
		alert("비밀번호를 입력해주세요. ");
		document.mpInfoUpdate.pw2.focus();
		return false;			
	}

	if (document.mpInfoUpdate.YY.value == "") 
	{
		alert("생년월일을 입력해주세요. ");
		document.mpInfoUpdate.YY.focus();
		return false;			
	}

	if (document.mpInfoUpdate.MM.value == "") 
	{
		alert("생년월일을 입력해주세요. ");
		document.mpInfoUpdate.MM.focus();
		return false;			
	}

	if (document.mpInfoUpdate.DD.value == "") 
	{
		alert("생년월일을 입력해주세요. ");
		document.mpInfoUpdate.DD.focus();
		return false;			
	}


	if (document.mpInfoUpdate.phone1.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.mpInfoUpdate.phone1.focus();
		return false;			
	}
 
	if (document.mpInfoUpdate.phone2.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.mpInfoUpdate.phone2.focus();
		return false;			
	}

    	if (document.mpInfoUpdate.phone3.value == "") 
	{
		alert("전화번호를 입력해주세요. ");
		document.mpInfoUpdate.phone3.focus();
		return false;			
	}

if (document.mpInfoUpdate.address.value == "") 
	{
		alert("주소를 입력해주세요. ");
		document.mpInfoUpdate.address.focus();
		return false;			
	}

if (document.mpInfoUpdate.email.value == "") 
	{
		alert("이메일을 입력해주세요. ");
		document.mpInfoUpdate.email.focus();
		return false;			
	}

   if(mpInfoUpdate.pw.value==mpInfoUpdate.pw2.value) 
			{ 
			mpInfoUpdate.submit();
			console.log("보내짐")
			}
			else{
				alert("비밀번호가 맞지 않습니다. ");
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