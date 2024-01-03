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
 	    String DB_URL="jdbc:mysql://localhost:3306/artfe";    //  접속 DB는 project
        String DB_ID="dada"; 
        String DB_PASSWORD="1123";
 	 
	   Class.forName("org.gjt.mm.mysql.Driver");  
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");

		String group_index;
		int list_index;

		group_index = request.getParameter("group_index");
		//첫 페이지는 group_index 값이 0
		   
		if (group_index != null) 	
				list_index = Integer.parseInt(group_index);  
		else 
				list_index = 0;     //현재 페이지 수 

		//board 테이블에 있는 총 자료의 수(글의 개수) 알아 오기
		String jsql = "select count(*) from board";
		PreparedStatement pstmt1 = con.prepareStatement(jsql);
		ResultSet cntRs = pstmt1.executeQuery();	

		cntRs.next();
		int cnt = cntRs.getInt(1);//글의 총 개수

		//한 페이지에 20개의 글 출력하기 위해
		//글의 개수를 20으로 나누어 페이지 계산
		int cntList = cnt/20; // 페이지 수 계산하기 위한 변수 
		int remainder = cnt%20; //나머지
		int cntList_1;//총페이지 수
			
		//1(21, 41, 61, 81, ...)번째 글이 올라올 때 총 페이지 수 1 증가
		if (cntList != 0) //글이 20개이상이면
		{
			   if (remainder == 0)	 //20으로 나눈 나머지가 없으면		
				  cntList_1 = cntList;  //몫이 페이지 수          
			   else                    //나머지가 있으면
				   cntList_1 = cntList + 1; //몫에 1 더한 값이 총페이지 수		  
		 } 
		 else 		 
			  cntList_1 = cntList + 1; //총페이지 수		
			   
		cntRs.close();
			
		String jsql2 = "select * from board order by masterid desc, replynum, step, no";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs = pstmt2.executeQuery();
   %>
  <div id="content">
   <div id="contentNav">
<p><b>커뮤니티</b></p>
<p style="font-size:17px; color:gray">관람후기, 질문, 답변, 정보공유 모두 아트페에서</p>
</div>
</ul>
	  
	<input type="button" id="button" style="cursor:pointer;" value="글쓰기" width="100px" height="50px" onclick="location.href='board_write.jsp'"></button>
	<br><br><br>
	
	 <table style="border-collapse:collapse;" cellspacing="2" cellpadding="3">
 	   <tr bgcolor='white' style=" border-bottom:1px solid #514FF0;">
<td align=center style="width:20px; color:gray; padding-bottom:20px; font-weight:500;">번호</td>
 <td id="tdpadding" align=center style="width:340px; color:gray; padding-bottom:20px;  font-weight:500;">제목</td>
 <td id="tdpadding" align=center style="width:60px; color:gray; padding-bottom:20px; font-weight:500;">닉네임</td>
  <td id="tdpadding" align=center style="width:200px; color:gray; padding-bottom:20px; font-weight:500;">작성일</td>
 <td id="tdpadding" align=center style="width:20px; color:gray; padding-bottom:20px; font-weight:500; padding-right:40px;">조회수</td>
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
		   //답변글일 경우 두 칸 안으로 들여 쓰기
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
	   //while 문이 반복 수행될 때마다 cursor를 1씩 증가
		 cursor ++;
         if (cursor >= 20) break; 
        }   // while문의 끝
    }  //  if문의 끝
   %> 

<br><br>
     <center>
        <table border="0" cellspacing="0" cellpadding="5">
          <tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
             <td colspan="5">        
                <div id="pagination">
		<%
			//첫페이지 (group_index 값이 0)로 이동할 수 있게끔 링크
		%>
        <a href="board.jsp?group_index=0"> &laquo; </a>

                
   <% 
   //페이지 번호를 출력 및 링크시키기 위한 변수들을 선언
       int startpage=1;
       int maxpage = cntList_1;
       int endpage = startpage + maxpage -1;

	//보여줄 페이지가 속한 그룹의 첫번째 페이지부터 마지막 페이지까지의 링크를 추가
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
			//마지막 페이지로 이동할 수 있게끔 링크
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