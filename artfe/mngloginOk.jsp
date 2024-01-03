<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="css/login.css">
<link rel="icon" href="images/logo.png">
<%
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");            //  로그인폼(login.jsp)에서 입력한 ID를 넘겨받음
    String pw = request.getParameter("pw");  //  로그인폼(login.jsp)에서 입력한 PW를 넘겨받음

     //  로그인폼(login.jsp)에서 입력한 ID를 포함한 레코드를 member 테이블에서 조회함
    String jsql = "select  *  from manager where manager_id = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   //  (1) 입력한 ID를 가지는 레코드가 member테이블에 존재하는 경우
    {
        if (pw.equals(rs.getString("manager_pw")))  
    	//  (1.1) 입력한 ID를 가지는 레코드가 존재하면서, 
	    //	        입력한 비밀번호가 member테이블상의 비밀번호와도 일치하는 경우
        {
             session.setAttribute("mid", id);
 	      // 로그인 성공시, 접속한 사용자의 ID를 "sid" 속성의 속성값으로 설정함.
          // 추후 로그인 된 상태에서 접속 ID와 관련된 정보를 필요로 할때,
	      // (String)session.getAttribute("sid")를 이용하여 접속 ID 정보를 가져올 수 있다.
     	  // 단순히, 로그인 여부 판별은 이 속성값이 null인지 아닌지로 로그인 여부를 확인함. 
	      //  (로그인이 안된 경우, 이 값은 null값을 가짐)

             response.sendRedirect("allUser.jsp");   	//  <jsp:forward page="index.jsp"/> 와 동일함

		 } else {   // (1.2) 입력한 ID를 가지는 레코드가 member테이블에 존재하지만, 비밀번호가 불일치한 경우
%>
  <%@include file="header.jsp" %>
		<center>
	  <div class="login-form">
      <h2><b>로그인 오류</b></h2><br><br>
     <font color="black" style="font-size:18px;">비밀번호가 틀렸습니다.</font><br><br><br>
<a href="mnglogin.jsp"><input type="button" class="submit-btn" value="다시 로그인하기" style="font-size:16px; background-color:white; color:#514FF0; border:1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif; cursor:pointer; margin-bottom:20px;"> </a><br>
			<font color="gray" style="font-size:15px">
            <a href="findId.jsp" style="font-size:15px; color:gray;">아이디 찾기</a> &nbsp|&nbsp <a href="findPw.jsp"  style="font-size:15px; color:gray;">비밀번호 찾기</a>
			</font>        <br><br>
		</div></center><%@include file="footer.jsp" %></div>
<%       
        }   //  두번째 if-else문의 끝      
    } else {    //  (2)  입력한 ID를 가지는 레코드가 member테이블에 존재하지 않는 경우
 %>
       <%@include file="header.jsp" %>
	 
      <center>
	  <div class="login-form">
	   <h2><b>로그인 오류</b></h2><br><br>
	  <font color="black" style="font-size:18px;">아이디가 존재하지 않습니다. </font><br><br><br>

 <a href="mnglogin.jsp"><input type="button" class="submit-btn" value="다시 로그인하기" style="font-size:16px; background-color:white; color:#514FF0; border:1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif; cursor:pointer; margin-bottom:20px;"> </a><br>
			<font color="gray" style="font-size:15px">
            <a href="findId.jsp" style="font-size:15px; color:gray;">아이디 찾기</a> &nbsp|&nbsp <a href="findPw.jsp"  style="font-size:15px; color:gray;">비밀번호 찾기</a>
			</font><br><br>
	  
	   </div></center><%@include file="footer.jsp" %></div>
<%
   }  // 첫번째 if-else문의 끝
%>
