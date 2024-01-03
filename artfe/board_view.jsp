<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

   <link rel="stylesheet" href="css/board_write2.css">
   <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr"); 

	   String idx = request.getParameter("idx");        
	   
	   String  jsql = "select * from board where idx = ?";
       PreparedStatement pstmt = con.prepareStatement(jsql);
       pstmt.setInt(1, Integer.parseInt(idx));
       ResultSet rs = pstmt.executeQuery();

       if(!rs.wasNull()) {
           rs.next();
           String subject = rs.getString("subject").trim();
           String name = rs.getString("name").trim();
           String content = rs.getString("content").trim();
           String ymd = rs.getString("ymd");
           int readcount = rs.getInt("readcount");
           String pwd = rs.getString("pwd").trim();
           int step = rs.getInt("step");
           readcount ++;
   %> 
 
 
 <div id="content">
  
        <table width="100%" border="0" cellspacing="2" cellpadding="3">
 	   <tr>
 	      <td>
		 <input type="text" size="30" style="font-size:26px; width:100%; height:50px; padding:10px 12px; margin:6px 0px; font-weight:600; font-family: Pretendard Variable, sans-serif;" name="subject" value="<%=subject%>" readonly>  <input type="hidden" name="idx" value="<%= idx %>">
		</td>
 	   </tr>
		<tr>
 	      <td style="padding-left:12px; padding-top:10px">
		   <font style="font-size:18px; color:#514FF0;"><b><%= name %></b> </font>
		</td>
 	   </tr>
 	   <tr>
 	      <td>
		  <input type="text" size="30"  style="font-size:16px; height:20px; color: gray; padding:10px 12px; margin:4px 0px; font-family: Pretendard Variable, sans-serif;" name="name" value="<%=ymd%> 작성 · 조회수 <%=readcount%>" readonly>
		  </td>
 	    </tr>
 	   <tr>
 	      <td>
		  <textarea rows="15" cols="60" style="font-size:18px; width:100%; line-height:30px; height:300px; padding:20px; margin:4px 0px; border: 1px solid #dedede; border-radius: 8px; font-family: Pretendard Variable, sans-serif; margin-top:20px;" name="in_content" readonly><%=content%></textarea>
		  </td>
 	    </tr>

  <%   
	    rs.close();
		pstmt.close();

        String jsql2 = "update board set readcount = ? where idx = ?";
        PreparedStatement up_readcount_Pstmt = con.prepareStatement(jsql2);
        up_readcount_Pstmt.setInt(1, readcount);
        up_readcount_Pstmt.setInt(2, Integer.parseInt(idx));
        up_readcount_Pstmt.executeUpdate();
        
		up_readcount_Pstmt.close();  
		con.close();
  %> 
<tr>
         <td width="450">          
				<div> 

<input type="button" style="float:right; width:100px; height:50px; margin-top:8px; border: 1px solid #514FF0; border-radius: 8px; background-color: #514FF0; font-size: 18px; color:white; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="write_submit" value="수정" onclick="location.href='board_modify.jsp?idx=<%=idx%>'">
          	     <input type="button" style="float:right; width:100px; height:50px; margin-top:8px; margin-right: 10px;  border: 1px solid #dedede; border-radius: 8px; background-color: white; font-size: 18px; color:black; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="reset" value="삭제" onclick="location.href='board_delete.jsp?idx=<%=idx%>'">
	<input type="button" style="float:left; width:240px; height:50px; margin-top:8px; border: 2px solid #514FF0; border-radius: 8px; background-color: white; font-size: 18px; font-weight:600; color:#514FF0; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="write_submit" value="답글 달기" onclick="location.href='board_Rwrite.jsp?idx=<%=idx%>'">
        	  </div>   
   <%
      if(step < 2) {
   %>

   <%
         }
      }
   %> 
         </td>
	</td>
       </tr>
     </table>
	 <br><br><br><br>
       </div>  
<%@include file="footer.jsp" %>
   </body>
</html>