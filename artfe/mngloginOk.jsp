<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="css/login.css">
<link rel="icon" href="images/logo.png">
<%
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");            //  �α�����(login.jsp)���� �Է��� ID�� �Ѱܹ���
    String pw = request.getParameter("pw");  //  �α�����(login.jsp)���� �Է��� PW�� �Ѱܹ���

     //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺��� ��ȸ��
    String jsql = "select  *  from manager where manager_id = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   //  (1) �Է��� ID�� ������ ���ڵ尡 member���̺� �����ϴ� ���
    {
        if (pw.equals(rs.getString("manager_pw")))  
    	//  (1.1) �Է��� ID�� ������ ���ڵ尡 �����ϸ鼭, 
	    //	        �Է��� ��й�ȣ�� member���̺���� ��й�ȣ�͵� ��ġ�ϴ� ���
        {
             session.setAttribute("mid", id);
 	      // �α��� ������, ������ ������� ID�� "sid" �Ӽ��� �Ӽ������� ������.
          // ���� �α��� �� ���¿��� ���� ID�� ���õ� ������ �ʿ�� �Ҷ�,
	      // (String)session.getAttribute("sid")�� �̿��Ͽ� ���� ID ������ ������ �� �ִ�.
     	  // �ܼ���, �α��� ���� �Ǻ��� �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	      //  (�α����� �ȵ� ���, �� ���� null���� ����)

             response.sendRedirect("allUser.jsp");   	//  <jsp:forward page="index.jsp"/> �� ������

		 } else {   // (1.2) �Է��� ID�� ������ ���ڵ尡 member���̺� ����������, ��й�ȣ�� ����ġ�� ���
%>
  <%@include file="header.jsp" %>
		<center>
	  <div class="login-form">
      <h2><b>�α��� ����</b></h2><br><br>
     <font color="black" style="font-size:18px;">��й�ȣ�� Ʋ�Ƚ��ϴ�.</font><br><br><br>
<a href="mnglogin.jsp"><input type="button" class="submit-btn" value="�ٽ� �α����ϱ�" style="font-size:16px; background-color:white; color:#514FF0; border:1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif; cursor:pointer; margin-bottom:20px;"> </a><br>
			<font color="gray" style="font-size:15px">
            <a href="findId.jsp" style="font-size:15px; color:gray;">���̵� ã��</a> &nbsp|&nbsp <a href="findPw.jsp"  style="font-size:15px; color:gray;">��й�ȣ ã��</a>
			</font>        <br><br>
		</div></center><%@include file="footer.jsp" %></div>
<%       
        }   //  �ι�° if-else���� ��      
    } else {    //  (2)  �Է��� ID�� ������ ���ڵ尡 member���̺� �������� �ʴ� ���
 %>
       <%@include file="header.jsp" %>
	 
      <center>
	  <div class="login-form">
	   <h2><b>�α��� ����</b></h2><br><br>
	  <font color="black" style="font-size:18px;">���̵� �������� �ʽ��ϴ�. </font><br><br><br>

 <a href="mnglogin.jsp"><input type="button" class="submit-btn" value="�ٽ� �α����ϱ�" style="font-size:16px; background-color:white; color:#514FF0; border:1px solid #dedede; border-radius: 5px; font-family: Pretendard Variable, sans-serif; cursor:pointer; margin-bottom:20px;"> </a><br>
			<font color="gray" style="font-size:15px">
            <a href="findId.jsp" style="font-size:15px; color:gray;">���̵� ã��</a> &nbsp|&nbsp <a href="findPw.jsp"  style="font-size:15px; color:gray;">��й�ȣ ã��</a>
			</font><br><br>
	  
	   </div></center><%@include file="footer.jsp" %></div>
<%
   }  // ù��° if-else���� ��
%>
