<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
	<link rel="stylesheet" href="css/mpLike.css">
<%
	if(sid == null){
	//�α����������̵�
	response.sendRedirect("login.jsp");
} 
else 
			request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	     //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺��� ��ȸ��
    String jsql00 = "select  *  from user where u_id = ? "; 
    PreparedStatement pstmt00 = con.prepareStatement(jsql00);
    pstmt00.setString(1, sid);
    ResultSet rs00 = pstmt00.executeQuery(); 
	 rs00.next();
			
	 String id = rs00.getString("u_id");
%>
	  
	 <div id="mypage_wrap">
		<div id="mypage">
		   <div id="mp">
			<ul class="mpmenu">
            <li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">�� ����</a></li>
            <li style="margin-left:30px;"><a href="mpInfoUpdate.jsp" style=" font-size:17px; font-weight:500; margin-bottom:10px; color:gray;">ȸ������ ����</a></li>

			<li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">����Ȯ��</a></li>
			<li style="margin-left:30px;"><a href="mpbookinfo.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">���� ����</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">������</a></li>
			<li style="margin-left:30px;"><a href="mpCart.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">���ٱ���</a></li>
			<li style="margin-left:30px;"><a href="mpLike.jsp" style="color:#514FF0; font-size:17px; font-weight:400; margin-bottom:10px; ">�������</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">������</a></li>
			 <li style="margin-left:30px;"><a href="faq.jsp" style="font-size:17px; font-weight:normal; margin-bottom:10px; color:gray;">���� ���� ����</a></li>

			 <li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">��������</a></li>
			<li style="margin-left:30px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">�α׾ƿ�</a></li>
			<li style="margin-left:30px;"><a href="deleteuser.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">ȸ�� Ż��</a></li>
            <br><br><br>
        </ul>  
       </div>
		 <div id="mypage2"><div class="book-form">
		 <br>
		<h2>�������</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:10px;">
	  
	<%

		 String likeNo = session.getId();   //���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����


		// ��ٱ��Ͽ� ������ ��� ����, mysql�󿡼� select * from cart;�� ����� �Բ� Ȯ��/�� �ذ��鼭
		// cart���̺� �����ִ� ��ǰ���ڵ������� ��ٱ��Ϲ�ȣ(ctNo)�� �Բ� ������ ������ �� ��!
		//  =>  Ȩ�������󿡼� �������� ��ٱ��� ������ ���Ե� ���ڵ����, ������ cart���̺�󿡼��� 
		//         ������ �ǹ��ϰ� �ִ��� ������ ������ �� ��! (�߿�!)
		String jsql = "select * from booklike where likeNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, likeNo);

		ResultSet rs = pstmt.executeQuery();

if(!rs.next())    // ��ȸ ����� �������� ������,  rs.next()�� false�� ������. 
	{                       //  ����,  !rs.next()�� ���� true�� �� 
%>
		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>������簡 ����ֽ��ϴ�.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        ��纸�� ����
    </div></center>
<%
	}
	else
	{
%>
	<%
		String jsql2 = "select e_no from booklike where likeNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, likeNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String e_no = rs2.getString("e_no");	//  cart���̺�κ��� ��ǰ��ȣ ����
    		      

    		String jsql3 = "select e_name, e_term, e_price from event where e_no = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, e_no);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	e_name =  rs3.getString("e_name");	
			String	e_term =  rs3.getString("e_term");//  goods ���̺�κ��� ��ǰ�� ����
			int e_price =  rs3.getInt("e_price");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
				
    	
%> 
		<div id="like" style="border-bottom:1px solid #dedede;">
		<div id="likeDiv">
		<a href="sangse.jsp?e_no=<%=e_no%>">
		<div id="section" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
			
		<div id="sec-content">
		  <h3><%= e_name %></h3>
		  <p style=" color:gray; margin-bottom:10%;"><%=e_term %></p>
		    <b><p style="color:#514FF0"><a href="deletelike.jsp?no=<%=e_no%>"><input type="button" class="deleteButton"  value="����������" style="cursor:pointer; font-size:10pt;font-family:���� ���"  onclick="delLike()"></a>&nbsp;&nbsp;</p></b><br>
		  </div></a>
		  </div>
		</div>
	
<%  } 
	  rs.close();         
      pstmt.close();  
      con.close();     
 %>
 
  

        
    </div>
  

  
  <br><br>
  
  <%
		}

%>

    </div>
  </div></div>

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
		
		 var mpmenu = document.getElementsByClassName("mpmenu");

      function handleClick(event) {
        console.log(event.target);
        // console.log(this);
        // �ܼ�â�� ���� �Ѵ� ������ ���� ���´�

        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
          event.target.classList.remove("clicked");
        } else {
          for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
          }

          event.target.classList.add("clicked");
        }
      }

      function init() {
        for (var i = 0; i < mpmenu.length; i++) {
          mpmenu[i].addEventListener("click", handleClick);
        }
      }

      init();

	function delLike(){

				alert('������翡�� �����Ǿ����ϴ�.');
				document.location.href="mpCart.jsp";
		}


	</script>
  <%@include file="footer.jsp" %>
</center>
</body>
</html>