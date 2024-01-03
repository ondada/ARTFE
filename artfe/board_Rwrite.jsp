<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/board_write.css">
   
   <script language="javascript">
		function in_check()
		{
				if (document.input.in_subject.value == "") 
				{
					alert("제목을 입력하세요!");
					return;
				}

				if (document.input.in_name.value == "") 
				{
					alert("닉네임을 입력하세요!");
					return;
				}

				if (document.input.pwd.value == "") 
				{
					alert("비밀번호를 입력하세요!");
					return;
				}

				if (document.input.in_content.value == "") 
				{
					alert("내용을 입력하세요!");
					return;
				}

			document.input.submit();
		}
     </script> 
   <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");

		String idx = request.getParameter("idx");
       
		int pos = 0;
   
       String jsql = "select * from board where idx = ?";
       PreparedStatement pstmt =con.prepareStatement(jsql);
       pstmt.setInt(1, Integer.parseInt(idx));
       ResultSet rs = pstmt.executeQuery();

       if(!rs.wasNull()) {
			rs.next();
			//대상글의 답변글임을 나타내기 위해 제목 앞에 [Re] 표시
			String sub = "[답글] " + rs.getString("subject").trim();
            String name = rs.getString("name").trim();
            String cont = ">" + rs.getString("content").trim();		
        	  //답변글의 각 줄 앞에 ">" 추가하여 대상글임을 표시

			//줄바꿈이 있는지 검사하여
			//cont변수에 줄이 바뀔때마다 ">"표시 출력 
			//indexOf(찾을문자열, 시작위치) - 위치값 반환, 			
			//포함되어 있지 않으면 -1 반환
			//인덱스값은 0부터 시작
            while ((pos = cont.indexOf("\n", pos)) != -1) 
			{			
				//substring(시작, 끝) - (끝-1 위치까지)
				String left = cont.substring(0, pos+1);
                String right = cont.substring(pos+1, cont.length());
                cont = left + ">" + right;
                pos++;
             }

			String ymd = rs.getString("ymd");
			int readcount = rs.getInt("readcount");
			String pwd = rs.getString("pwd").trim();
			int midd = rs.getInt("masterid");
            int rnum = rs.getInt("replynum");
            int step = rs.getInt("step");
			readcount ++;
   %>    

     <div id="content" >
       <form method="post" action="board_Rwrite_process.jsp" name="input">       
        <table width="100%" border="0" cellspacing="2" cellpadding="3">
 	   <tr>
 	      <td>
 	         <input type="text" size="30" style="font-size:26px; width:100%; height:50px; padding:10px 12px; margin:6px 0px; font-weight:600; font-family: Pretendard Variable, sans-serif;" name="in_subject" value="<%= sub %>" Maxlength="40" placeholder="제목에 핵심 내용을 요약해 보세요."></td>
 	   </tr>
 	   <tr>
 	      <td>
 	         <input type="text" size="30"  size="30" style="font-size:18px; width:30%; height:40px; padding:10px 12px; margin:4px 0px; font-family: Pretendard Variable, sans-serif;" name="in_name" Maxlength="10" placeholder="닉네임">  <input type="hidden" name="idx" value="<%= idx %>"></td>
 	   </tr>
 	   <tr>
 	      <td><textarea rows="15" cols="60" style="font-size:18px; width:100%; line-height:30px; height:300px; padding:20px; margin:4px 0px; border: 1px solid #dedede; border-radius: 8px; font-family: Pretendard Variable, sans-serif; margin-top:20px;" name="in_content">
<%= cont %>     
</textarea>
</td>
 	   </tr>
  	   <tr>
 	      <td><input type="password" class="pwd"  name="pwd" style="font-size:18px; width:40%; height:40px; padding:10px 12px; margin:10px 0px;  font-family: Pretendard Variable, sans-serif;" placeholder="비밀번호" Maxlength="4">
	<input type="button"  style="float:right;  width:100px; height:50px; margin-top:8px; border: 1px solid #514FFF0; border-radius: 8px; background-color: #514FF0; font-size: 18px; color:white; cursor:pointer; font-family: Pretendard Variable, sans-serif;" value="등록" OnClick="in_check()">&nbsp;&nbsp;
          	     <input type="reset" style="float:right;  width:100px; height:50px; margin-top:8px; margin-right: 10px; border: 1px solid #dedede; border-radius: 8px; background-color: white; font-size: 18px; color:black; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="reset" value="취소" onClick="history.go(-1)">
</td>
 	   </tr>
         </table>
         <input type="hidden" name="step" value="<%=step%>">
         <input type="hidden" name="midd" value="<%=midd%>">
         <input type="hidden" name="rnum" value="<%=rnum%>">         
   <%
      }
        rs.close();
       con.close();
   %>         
      </form>
	  <br><br><br>
	  	 </div>
		 <%@include file="footer.jsp" %>
   </body>
</html>