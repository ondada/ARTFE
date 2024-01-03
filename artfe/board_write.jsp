<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/board_write.css">

 <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr"); 
	%>

      <script language="javascript">
      function in_check()
	  {
			if (document.input.in_subject.value == "") {
			  alert("제목을 입력하세요!");
			  return;
			}

			if (document.input.in_name.value == "") {
			  alert("닉네임을 입력하세요!");
			  return;
			}

			if (document.input.pwd.value == "") {
			  alert("비밀번호를 입력하세요!");
			  return;
			}

			if (document.input.in_content.value == "") {
			  alert("내용을 입력하세요!");
			  return;
			}

			document.input.submit();
		}
     </script>	
	
  

	<div id="content">
     <form method="post" action="board_write_process.jsp" name="input">
        <table width="100%" border="0" cellspacing="2" cellpadding="3">
 	    <tr>
 	      <td>
 	         <input type="text" size="30" style="font-size:26px; width:100%; height:50px; padding:10px 12px; margin:6px 0px; font-weight:600; font-family: Pretendard Variable, sans-serif;" class="in_subject" name="in_subject" Maxlength="40" placeholder="제목에 핵심 내용을 요약해 보세요.">
 	      </td>
 	   </tr>
 	   <tr>
 	       
 	      <td><input type="text" size="30" style="font-size:18px; width:30%; height:40px; padding:10px 12px; margin:4px 0px; font-family: Pretendard Variable, sans-serif;" name="in_name" Maxlength="10" placeholder="닉네임"></td>
 	    </tr>
 	   <tr>
 	      
 	      <td>
		  <textarea rows="15" cols="60" style="font-size:18px; width:100%; line-height:30px; height:300px; padding:20px; margin:4px 0px; border: 1px solid #dedede; border-radius: 8px; font-family: Pretendard Variable, sans-serif; margin-top:20px;" name="in_content" placeholder="- 이곳에 공유하고 싶은 후기를 작성해 주세요. &#13;&#10;- 관람후기, 질문, 정보공유 모두 다 자유롭게 남겨요 :) &#13;&#10;- 이용자를 비방하는 글은 무통보 삭제될 수 있어요. &#13;&#10;- 잠깐! 아트페 서비스 운영 관련 정보는 FAQ를 참고해 주세요."></textarea>
		  </td>
 	    </tr> 	    
 	   <tr>

 	      <td>
<input type="password" class="pwd" name="pwd" style="font-size:18px; width:40%; height:40px; padding:10px 12px; margin:10px 0px; font-family: Pretendard Variable, sans-serif;" placeholder="비밀번호" Maxlength="4">
                     <input type="button" style="float:right; width:100px; height:50px; margin-top:8px; border: 1px solid #514FFF0; border-radius: 8px; background-color: #514FF0; font-size: 18px; color:white; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="write_submit" value="등록" OnClick="in_check()">
          	     <input type="button" style="float:right; width:100px; height:50px; margin-top:8px; margin-right: 10px;  border: 1px solid #dedede; border-radius: 8px; background-color: white; font-size: 18px; color:black; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="reset" value="취소" onclick="location.href='board.jsp'">
</td>
 	    </tr>

         </table>
		 <br><br><br>

       </div>  

      </form>
	 <%@include file="footer.jsp" %>
   </body>
</html>	