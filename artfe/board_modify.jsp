<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

   <link rel="stylesheet" href="css/board_write.css">
   
   <script language="javascript">
      function pass_check()
	 {
 			if (document.modify.pwd.value == "") 
			{
  				alert("��й�ȣ�� �Է��ϼ���!");
  				return;
			}
			document.modify.submit();
	}
   </script>   
   
   <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  ���� DB�� project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");

		String idx = request.getParameter("idx");      
                
		String jsql = "select * from board where idx = ?";
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
   %> 
<div id="content">
  <form method="post" action="board_modify_process.jsp" name="modify">
    <table width="100%" border="0" cellspacing="2" cellpadding="3">
 	  <tr>
 	     <td>
			<input type="text" size="30" style="font-size:26px; width:100%; height:50px; padding:10px 12px; margin:6px 0px; font-weight:600; font-family: Pretendard Variable, sans-serif;" class="in_subject" name="in_subject" value="<%=subject%>" Maxlength="40" placeholder="���� �ٽ� ������ ����� ������.">
			<input type="hidden" name="idx" value="<%= idx %>">
 	     </td>
 	   </tr>   
<tr>
 	      <td style="padding-left:12px; padding-top:10px;">
		   <font style="font-size:18px; color:#514FF0;"><b><%= name %></b> </font>
		</td>
 	   </tr>
<tr>
 	      <td>
		  <span style="font-size:16px; line-height:28px; color: gray; padding:10px 12px; font-family: Pretendard Variable, sans-serif;" name="name"><%=ymd%> �ۼ� �� ��ȸ�� <%=readcount%></span>
		  </td>
 	    </tr>
 	  <tr>
 	      <td><textarea rows="15" cols="60" style="font-size:18px; width:100%; line-height:30px; height:300px; padding:20px; margin:4px 0px; border: 1px solid #dedede; border-radius: 8px; font-family: Pretendard Variable, sans-serif; margin-top:20px;" name="in_content" placeholder="- �̰��� �����ϰ� ���� �ı⸦ �ۼ��� �ּ���. &#13;&#10;- �����ı�, ����, �������� ��� �� �����Ӱ� ���ܿ� :) &#13;&#10;- �̿��ڸ� ����ϴ� ���� ���뺸 ������ �� �־��. &#13;&#10;- ���! ��Ʈ�� ���� � ���� ������ FAQ�� ������ �ּ���."><%=content%></textarea></td>
 	  </tr>
 	   
<% 
        }
       rs.close();
       con.close();
%>
      
 	  <tr> 
 	     <td><input type="password" class="pwd" name="pwd" style="font-size:18px; width:40%; height:40px; font-family: Pretendard Variable, sans-serif; padding:10px 12px; margin:10px 0px; " placeholder="��й�ȣ" Maxlength="4">
		<input type="button" style="float:right; width:100px; height:50px; margin-top:8px; border: 1px solid #514FFF0; border-radius: 8px; background-color: #514FF0; font-size: 18px; color:white; cursor:pointer; font-family: Pretendard Variable, sans-serif;" value="����" OnClick="pass_check()">&nbsp;&nbsp;
          	   <input type="reset" style="float:right; width:100px; height:50px; margin-top:8px; margin-right: 10px; border: 1px solid #dedede; border-radius: 8px; background-color: white; font-size: 18px; color:black; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="reset" value="���" onClick="history.go(-1)">
			   </div>
</td>
 	  </tr>

 	</table>
  <br><br><br>  
      </form>
	  </div>
	 	 <%@include file="footer.jsp" %>
   </body>
</html>	