<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/mpCart.css">

  <%//1. �α��ο���üũ (�α���x->�α������������̵�)

if(sid == null){
	//�α����������̵�
	response.sendRedirect("login.jsp");
} 
else 
	try{
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
			<li style="margin-left:30px;"><a href="mpbookinfo.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">���� ����</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">������</a></li>
			<li style="margin-left:30px;"><a href="mpCart.jsp" style="color:#514FF0; font-size:17px; font-weight:400; margin-bottom:-10px;">���ٱ���</a></li>
			<li style="margin-left:30px;"><a href="mpLike.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">�������</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">������</a></li>
			 <li style="margin-left:30px;"><a href="faq.jsp" style="font-size:17px; font-weight:normal; margin-bottom:10px; color:gray;">���� ���� ����</a></li>

			 <li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">��������</a></li>
			<li style="margin-left:30px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">�α׾ƿ�</a></li>
			<li style="margin-left:30px;"><a href="deleteuser.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">ȸ�� Ż��</a></li>
            <br><br><br>
        </ul>  
       </div>
    <div id="mypage2">
      <div class="book-form">

	  <br>
		<h2>���ٱ���</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:20px;">

<form name="form" action="cartorder.jsp" method="post">

 <%
 

	String ctNo = session.getId();   //���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����


	// ��ٱ��Ͽ� ������ ��� ����, mysql�󿡼� select * from cart;�� ����� �Բ� Ȯ��/�� �ذ��鼭
	// cart���̺� �����ִ� ��ǰ���ڵ������� ��ٱ��Ϲ�ȣ(ctNo)�� �Բ� ������ ������ �� ��!
	//  =>  Ȩ�������󿡼� �������� ��ٱ��� ������ ���Ե� ���ڵ����, ������ cart���̺�󿡼��� 
	//         ������ �ǹ��ϰ� �ִ��� ������ ������ �� ��! (�߿�!)
	String jsql = "select * from cart where ctNo = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())    // ��ȸ ����� �������� ������,  rs.next()�� false�� ������. 
	{                       //  ����,  !rs.next()�� ���� true�� �� 
%>
		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>���ٱ��ϰ� ����ֽ��ϴ�.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        ��纸�� ����
    </div></center>
<%
	}
	else
	{
%>
 <table style="border-collapse: collapse; width:100%;">
  <tr>
  
  <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">����</td>
 <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">�Ⱓ</td>
 <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">����</td>
  <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">����</td>
 <td id="cate" align=center style="color:gray; padding-bottom:10px; font-weight:500;">������</td>
 </tr>
 
<%

		String jsql2 = "select e_no, b_qty from cart where ctNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String e_no = rs2.getString("e_no");	//  cart���̺�κ��� ��ǰ��ȣ ����
    		int b_qty = rs2.getInt("b_qty");	                //  cart���̺�κ��� �ֹ����� ���� 

    		String jsql3 = "select e_name, e_term, e_time, e_price, e_date from event where e_no = ?";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, e_no);

			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();
			

		    String	e_date = request.getParameter("e_date");
		    String	e_time = request.getParameter("e_time");
			String	e_name =  rs3.getString("e_name");	
			String	e_term =  rs3.getString("e_term");//  goods ���̺�κ��� ��ǰ�� ����
			int e_price =  rs3.getInt("e_price");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
				
    		
			

				DecimalFormat df = new DecimalFormat("###,###");
				int amount = e_price * b_qty;    //  �ֹ��� ���
				total = total + amount;                  //  ��ü �ֹ��Ѿ� ���

%> 
        	<tr>
		
			 
	<input  type="hidden" name="e_no" value="<%=e_no%>">
         <td id="con" align=center style="padding:50px 0; height:100px; width:160px; text-align:center; font-weight:600; border-bottom:1px solid #dedede;">
		 <a href="sangse.jsp?e_no=<%=e_no%>"><%=e_name%></a></td>

  			<td id="con" align=center style="padding:20px; width:140px; height:100px; border-bottom:1px solid #dedede;">
	<a href="sangse.jsp?e_no=<%=e_no%>" style="color:gray;"><%=e_term%></a></td>

				<td id="con" align=center style="width:40px; height:100px; border-bottom:1px solid #dedede;"><b><%= b_qty%></b></td>

			<td id="con" align=center style="width:80px; height:100px; color:#514FF0; font-weight:bold; border-bottom:1px solid #dedede;"><%=df.format(amount)%>��</td>

			<td id="con" align="center" style="width:160px; border-bottom:1px solid #dedede;">
			<a href="sangse.jsp?e_no=<%=e_no%>">
			<div id="pic" style = "background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;">
			</div></a></td>

			<td align="left" style="width:60px; border-bottom:1px solid #dedede; margin-right:40px;"><a href="deletecart.jsp?e_no=<%=e_no%>"><input type="button" class="deleteButton"  value="����"  onclick="delcart()"></td>
		</tr>
		
	   <input  type="hidden" name="e_no" value="<%=e_no%>">
	  <input  type="hidden" name="e_name" value="<%=e_name%>">
	  <input  type="hidden" name="e_term" value="<%=e_term%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
<% } 
      rs.close();
      pstmt.close();  
      con.close();    
 %>

 </table>
 <%DecimalFormat df = new DecimalFormat("###,###");%>
<span style="float:left; width:140px; height:100px; margin-top:40px; font-size:20px; padding-left:30px; margin-bottom:20px;">
         <b>�� �����ݾ� </b>
         <input name="total" type="text" size="10" placeholder="0" readonly style="border:none; color:#514FF0;  margin-top:10px; font-weight:bold; font-size:30px;" value="<%=df.format(total)%>��">
         </span>
         <span style="float:right;  margin-top:36px; font-size:20px; padding-left:30px;">
         <input type="submit" value=" " class="mainbtn" onclick="directOrd()" style="background-image: url(images/kakaopay.png); background-size: cover; background-repeat: no-repeat;"></input>
		 

</form>
<br><br><br><br>
<%
		}	

%>


   </div>
    </div>
  </div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
   <script type="text/javascript">
function delcart(){

			alert('���ٱ��Ͽ��� �����Ǿ����ϴ�.');
			document.location.href="deletecart.jsp";
	}

var i = 0;
function cartSum(frm)
{


   var sum = 0;


   var count = frm.chk.length;
   for(var i=0; i<count; i++ ){
       if( frm.chk[i].checked == true ){ 
       sum = sum + parseInt(frm.chk[i].value);
       }
   }
   

   frm.total.value = sum.toLocaleString() + "��";
   return sum;
}

					function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
		{
			var str=directOrd.e_no.value;
			var frm = document.directOrd;
			frm.action = "order.jsp";
			frm.submit();
		}

      
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

   </script>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>

  <%@include file="footer.jsp" %>
</center>
</body>
</html>