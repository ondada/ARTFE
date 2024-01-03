<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>

<link rel="stylesheet" href="css/board.css">
<link rel="icon" href="images/logo.png">
<head>
</head>
<body>
 <%
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  ���� DB�� project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");

		String group_index;
		int list_index;

		group_index = request.getParameter("group_index");
		//ù �������� group_index ���� 0
		   
		if (group_index != null) 	
				list_index = Integer.parseInt(group_index);  
		else 
				list_index = 0;     //���� ������ �� 

		//board ���̺� �ִ� �� �ڷ��� ��(���� ����) �˾� ����
		String jsql = "select count(*) from board";
		PreparedStatement pstmt1 = con.prepareStatement(jsql);
		ResultSet cntRs = pstmt1.executeQuery();	

		cntRs.next();
		int cnt = cntRs.getInt(1);//���� �� ����

		//�� �������� 20���� �� ����ϱ� ����
		//���� ������ 20���� ������ ������ ���
		int cntList = cnt/20; // ������ �� ����ϱ� ���� ���� 
		int remainder = cnt%20; //������
		int cntList_1;//�������� ��
			
		//1(21, 41, 61, 81, ...)��° ���� �ö�� �� �� ������ �� 1 ����
		if (cntList != 0) //���� 20���̻��̸�
		{
			   if (remainder == 0)	 //20���� ���� �������� ������		
				  cntList_1 = cntList;  //���� ������ ��          
			   else                    //�������� ������
				   cntList_1 = cntList + 1; //�� 1 ���� ���� �������� ��		  
		 } 
		 else 		 
			  cntList_1 = cntList + 1; //�������� ��		
			   
		cntRs.close();
			
		String jsql2 = "select * from board order by masterid desc, replynum, step, no";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs = pstmt2.executeQuery();
   %>
  <div id="content">
   <div id="contentNav">
<p><b>Ŀ�´�Ƽ</b></p>
<p style="font-size:17px; color:gray">�����ı�, ����, �亯, �������� ��� ��Ʈ�信��</p>
</div>
</ul>
	  
	<input type="button" id="button" style="cursor:pointer;" value="�۾���" width="100px" height="50px" onclick="location.href='board_write.jsp'"></button>
	<br><br><br>
	
	 <table style="border-collapse:collapse;" cellspacing="2" cellpadding="3">
 	   <tr bgcolor='white' style=" border-bottom:1px solid #514FF0;">
<td align=center style="width:20px; color:gray; padding-bottom:20px; font-weight:500;">��ȣ</td>
 <td id="tdpadding" align=center style="width:340px; color:gray; padding-bottom:20px;  font-weight:500;">����</td>
 <td id="tdpadding" align=center style="width:60px; color:gray; padding-bottom:20px; font-weight:500;">�г���</td>
  <td id="tdpadding" align=center style="width:200px; color:gray; padding-bottom:20px; font-weight:500;">�ۼ���</td>
 <td id="tdpadding" align=center style="width:20px; color:gray; padding-bottom:20px; font-weight:500; padding-right:40px;">��ȸ��</td>
 	   </tr>
 	   
    <%
	if (!rs.wasNull()) 
	{
	   for(int i = 0; i < list_index * 20; i++) 
	      rs.next();

       int cursor = 0;
       while (rs.next()) 
	   {
              int idx = rs.getInt("idx");
              int no = rs.getInt("no");
              String subject = rs.getString("subject");
			  String name = rs.getString("name");
              String ymd = rs.getString("ymd");
              int readcount = rs.getInt("readcount");
              int step = rs.getInt("step");
    %> 	   
   
 	   <tr>
 	      <td align=center style="padding:20px 30px; font-weight:400; border-bottom:1px solid #dedede; color:gray;">
 	         <div align="center"><%=no%></div>
 	      </td>
 	      <td id="tdpadding" style="font-weight:500; border-bottom:1px solid #dedede;">
    <%
		   //�亯���� ��� �� ĭ ������ �鿩 ����
             if (step > 0) 
		   {
                    for(int vacant=0; vacant < step; vacant++) 
					{
    %>
    		 &nbsp;&nbsp;
    		 
    <%
    		        }
           }
    %>
 	         <a href="board_view.jsp?idx=<%=idx%>"><%=subject%></a>
 	      </td> 	      
 	      <td align=center id="tdpadding" style="font-weight:500; border-bottom:1px solid #dedede;">
 	         <div align="center"><a href="board_view.jsp?idx=<%=idx%>"><%=name%></a></div>
 	      </td>

 	     <td align=center id="tdpadding" style="font-weight:400; border-bottom:1px solid #dedede;">
 	         <div align="center"><a href="board_view.jsp?idx=<%=idx%>" style="color:gray;"><%=ymd%></a></div>
 	      </td> 	      
 	      <td align=center id="tdpadding" style="font-weight:400; border-bottom:1px solid #dedede; padding-right:40px;">
 	         <div align="center"><a href="board_view.jsp?idx=<%=idx%>" style="color:gray;"><%=readcount%></a></div>
 	      </td>
 	   </tr>  	   

   <%
	   //while ���� �ݺ� ����� ������ cursor�� 1�� ����
		 cursor ++;
         if (cursor >= 20) break; 
        }   // while���� ��
    }  //  if���� ��
   %> 

<br><br>
     <center>
        <table border="0" cellspacing="0" cellpadding="5">
          <tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
             <td colspan="5">        
                <div id="pagination">
		<%
			//ù������ (group_index ���� 0)�� �̵��� �� �ְԲ� ��ũ
		%>
        <a href="board.jsp?group_index=0"> &laquo; </a>

                
   <% 
   //������ ��ȣ�� ��� �� ��ũ��Ű�� ���� �������� ����
       int startpage=1;
       int maxpage = cntList_1;
       int endpage = startpage + maxpage -1;

	//������ �������� ���� �׷��� ù��° ���������� ������ ������������ ��ũ�� �߰�
       for (int j=startpage; j<=endpage; j++) 
	   {
           if(j == list_index+1) 
		   {
   %>

              <a href="#"> <%= j %></a>
   <%
            } 
            else 
			{
   %>

        <a href="board.jsp?group_index=<%= j - 1 %>"><%= j %></a>
   <%
            }
       }
   %>
    
	  <%
			//������ �������� �̵��� �� �ְԲ� ��ũ
	   %>
      <a href="board.jsp?group_index=<%= cntList_1 - 1 %>"> &raquo; </a>
    
             </td>
          </tr>                
          <tr>
             <td colspan="5">
                <div align="center">  
		<br><br>
	 </div>
        </td>
      </tr>
    </table>
	</center>
<br>
	</div>
  <%@include file="footer.jsp" %>
</div>
</center>
</body>
</html>