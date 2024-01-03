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
					alert("������ �Է��ϼ���!");
					return;
				}

				if (document.input.in_name.value == "") 
				{
					alert("�г����� �Է��ϼ���!");
					return;
				}

				if (document.input.pwd.value == "") 
				{
					alert("��й�ȣ�� �Է��ϼ���!");
					return;
				}

				if (document.input.in_content.value == "") 
				{
					alert("������ �Է��ϼ���!");
					return;
				}

			document.input.submit();
		}
     </script> 
   <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  ���� DB�� project
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
			//������ �亯������ ��Ÿ���� ���� ���� �տ� [Re] ǥ��
			String sub = "[���] " + rs.getString("subject").trim();
            String name = rs.getString("name").trim();
            String cont = ">" + rs.getString("content").trim();		
        	  //�亯���� �� �� �տ� ">" �߰��Ͽ� �������� ǥ��

			//�ٹٲ��� �ִ��� �˻��Ͽ�
			//cont������ ���� �ٲ𶧸��� ">"ǥ�� ��� 
			//indexOf(ã�����ڿ�, ������ġ) - ��ġ�� ��ȯ, 			
			//���ԵǾ� ���� ������ -1 ��ȯ
			//�ε������� 0���� ����
            while ((pos = cont.indexOf("\n", pos)) != -1) 
			{			
				//substring(����, ��) - (��-1 ��ġ����)
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
 	         <input type="text" size="30" style="font-size:26px; width:100%; height:50px; padding:10px 12px; margin:6px 0px; font-weight:600; font-family: Pretendard Variable, sans-serif;" name="in_subject" value="<%= sub %>" Maxlength="40" placeholder="���� �ٽ� ������ ����� ������."></td>
 	   </tr>
 	   <tr>
 	      <td>
 	         <input type="text" size="30"  size="30" style="font-size:18px; width:30%; height:40px; padding:10px 12px; margin:4px 0px; font-family: Pretendard Variable, sans-serif;" name="in_name" Maxlength="10" placeholder="�г���">  <input type="hidden" name="idx" value="<%= idx %>"></td>
 	   </tr>
 	   <tr>
 	      <td><textarea rows="15" cols="60" style="font-size:18px; width:100%; line-height:30px; height:300px; padding:20px; margin:4px 0px; border: 1px solid #dedede; border-radius: 8px; font-family: Pretendard Variable, sans-serif; margin-top:20px;" name="in_content">
<%= cont %>     
</textarea>
</td>
 	   </tr>
  	   <tr>
 	      <td><input type="password" class="pwd"  name="pwd" style="font-size:18px; width:40%; height:40px; padding:10px 12px; margin:10px 0px;  font-family: Pretendard Variable, sans-serif;" placeholder="��й�ȣ" Maxlength="4">
	<input type="button"  style="float:right;  width:100px; height:50px; margin-top:8px; border: 1px solid #514FFF0; border-radius: 8px; background-color: #514FF0; font-size: 18px; color:white; cursor:pointer; font-family: Pretendard Variable, sans-serif;" value="���" OnClick="in_check()">&nbsp;&nbsp;
          	     <input type="reset" style="float:right;  width:100px; height:50px; margin-top:8px; margin-right: 10px; border: 1px solid #dedede; border-radius: 8px; background-color: white; font-size: 18px; color:black; cursor:pointer; font-family: Pretendard Variable, sans-serif;" name="reset" value="���" onClick="history.go(-1)">
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