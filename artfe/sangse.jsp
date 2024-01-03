<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
  <%@include file="header.jsp" %>
<link rel="stylesheet" href="css/sangse.css">

<%

	request.setCharacterEncoding("euc-kr");

    String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB���� project�ӿ� ����!(��� �ҽ��ڵ� Ȯ��!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
     
    Class.forName("org.gjt.mm.mysql.Driver"); 
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

   String key = request.getParameter("e_no");   //  ����ȸ�ϰ��� �ϴ� ��ǰ��ȣ�� �Ѱܹ޾ƿ�

    String jsql = "select * from event where e_no = ?";   
   PreparedStatement pstmt  = con.prepareStatement(jsql);
   pstmt.setString(1, key);

   ResultSet rs = pstmt.executeQuery();
    rs.next();

   String e_no = rs.getString("e_no");
   String e_name =  rs.getString("e_name");               
   String e_term = rs.getString("e_term");
   String e_place =  rs.getString("e_place");
   String e_price = rs.getString("e_price");
   String e_time = rs.getString("e_time");
   String e_description =  rs.getString("e_description");
   String e_genre =  rs.getString("e_genre");
   String e_img =  rs.getString("e_img");
   String e_site =  rs.getString("e_site");
   String e_map =  rs.getString("e_map");
   String e_ctg = rs.getString("e_ctg");
   String e_date = rs.getString("e_date");
   String e_mindate = rs.getString("e_mindate");
   String e_maxdate = rs.getString("e_maxdate");


	DecimalFormat df = new DecimalFormat("###,###");
	int sum = Integer.parseInt(rs.getString("e_price"));

%>

<form id="cart" method="get" action="inCart.jsp">

 <div id="content">

	  <input  type="hidden" name="e_no" value="<%=e_no%>">
	  <div id="sectionPic" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></div> 

	  <div id="sectionContent">
         
		 <p style="font-size:17px;"><%=e_ctg%> <font color="#b0b0b0">|</font> <%=e_genre%></p>

        <h1 style="display:inline-block;"><%= e_name%></h1>
        <p style="color:gray; margin:10px 0px;"><%=e_term%></p>
      <p style="margin-bottom:30px;"><%=e_place %></p>
<font style="font-weight: 500;">
      ��¥���� &nbsp;&nbsp; 
			 <form>
			  <input type="date" min="<%=e_mindate%>" max="<%=e_maxdate%>"name="e_date" value="e_date" id="now_date">
			
			<br>

              ȸ������ &nbsp;&nbsp;

			   <select id="e_time" name="e_time">
                <option value="1ȸ��" name="e_time">1ȸ�� (09:00~12:00)</option>
                <option value="2ȸ��" name="e_time">2ȸ�� (12:00~15:00)</option>
                <option value="3ȸ��" name="e_time">3ȸ�� (15:00~18:00)</option>
            </select>
       
	   <input  type="hidden" name="e_no" value="<%=e_no%>">
	  <input  type="hidden" name="e_name" value="<%=e_name%>">
	  <input  type="hidden" name="e_term" value="<%=e_term%>">
	    <input  type="hidden" name="e_place" value="<%=e_place%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
          <br>

		 ���ż��� &nbsp;&nbsp;</font>
		  
<div id="qtyDiv"><form>
<input type="button" id="qtySub" value="-" onClick="javascript:this.form.b_qty.value--; subNum()">
<input type="text" id="b_qty" name="b_qty" value="1" onblur="javascript:amountCheck();">
<input type="button" id="qtyAdd" value="+" class="qtyButton2" onClick="javascript:this.form.b_qty.value++; addNum()">
</form></div>

<br>
		<span style="color:black; font-weight:500; float:left;">Ƽ�ϱݾ�&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "text" id="result" class="txtNumResult" disabled="disabled" value="<%=df.format(sum)%>��" onKeyup="inputNumberAutoComma(this);"><span style="color:#514FF0; font-size:20px; font-weight:bold; border: none; width:80px; font-family: Pretendard Variable, sans-serif;"></span>


               
		<div id="heartBox">
        <input type="submit" class="btn1" value="���ٱ��� ���" onClick="javascript:inCart()"><input type="image" name=e_no  src="images/heart.png" id="test" form="like" onclick="document.getElementById('like').submit(); toggle_object(1); return false;"><iframe id="iframe1" name="iframe1" style="visibility:hidden; display:none;"></iframe></div>
		<br><div id="heartBox">
		 <input type="submit" name="directOrd" formaction="order.jsp" class="btn2" value="�����ϱ�" onClick="javascript:directOrd()"></div>
		</div>
  
</form>

<br><br>

	<table class="thesangse">
		<tr>
			<td><a id="button1" class="button" href="#sectionInfoA">��� �Ұ�</a></td>
			<td><a id="button2" class="button" href="#place">��� ���</a></td>
			<td><a id="button3" class="button" href="#cancel">���/ȯ��</a></td>
			<td><a id="button4" class="button" href="#website">���� ����Ʈ</a></td>
		</tr>
	</table>

	<div id="sectionInfoA"></div>
 <br> <br><br><br>
<div id="sectionInfo" >

	<input  type="hidden" name="e_img" value="<%=e_img%>">
	  <div id="infopic" style="background-image: url(images/<%=e_img%>.jpg); background-size: cover; background-repeat: no-repeat;"></div> 

	<div id="description">
	<h1 style="margin-top: 40px;"> <%=e_name%></h1>
	<p style="font-size:20px; color:gray; font-weight:300;"><input  type="hidden" name="e_term" value="<%=e_term%>"><%=e_term%></p>
	<p style="color:#514FF0; margin-top: 120px;  font-size:24px; font-weight:bold;">��� �Ұ�</p>
	<hr id="hrInfo">
	<p style="margin-top: 10px; font-size:19px; font-weight:normal;"><input  type="hidden" name="e_description" value="<%=e_description%>"><%=e_description%></p>
	</div>
	
	<div id="place" ><br><br><br>
	<p style="color:#514FF0; font-size:24px; font-weight:bold; margin-top:4px;">��� ���</p>
	<hr id="hrInfo">
	<p style=" font-size:19px; font-weight:500; margin-bottom:20px;"><input  type="hidden" name="e_description" 
	value="<%=e_place%>"><%=e_place%></p>
	<div id="map" >
		<%=e_map%>
	</div>
	</div>

	<div id="cancel"><br><br><br>
	<p style="color:#514FF0; font-size:24px; font-weight:bold; margin-top:6px;">��� �� ȯ�� ����</p>
	<hr id="hrInfo">
	<p style=" font-size:18px; font-weight:400; color:gray; line-height:30px;">
- ����� ���/ȯ�� �Ⱓ�� ��� ȣ��Ʈ�� ������ ��û�Ⱓ�� �����մϴ�.<br>
- ���� ����, ȯ�� ��û ����, ȯ�� ������ ���� ȯ�� �����ᰡ �ΰ��� �� �ֽ��ϴ�.<br>
- ���� ���� �ڼ��� ������ ����� �� ȯ�ұ��������� Ȯ���� �� �ֽ��ϴ�.<br>
- ��û�Ⱓ ���� ������ ��û ���� ���� �� ���/ȯ���� ��� ȣ��Ʈ���� ���� ��Ź�帳�ϴ�.<br>
<span style="color:#e61919;">*��Ʈ��� ����Ǹ� �߰����̸�, �ش� ����� ȣ��Ʈ�� �ƴմϴ�.</span></p>
	</div>

	<div id="website"><br><br><br>
	<p style="color:#514FF0; font-size:24px; font-weight:bold; margin-top:6px;">���� ����Ʈ</p>
	<hr id="hrInfo">
	<p style="color:gray; font-size:19px; font-weight:400;"><input  type="hidden" name="" 
	value=""><a href="<%=e_site%>"><%=e_site%></a></p>
	</div>


</div>
  </div>

<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>


  <%@include file="footer.jsp" %>
  
</div>
<form id="like" action="inLike.jsp" method="get" target="iframe1">
		<input  type="hidden" name=e_no value="<%=e_no%>">
	    <input  type="hidden" name="e_name" value="<%=e_name%>">
		<input  type="hidden" name="e_price" value="<%=e_price%>">
		<input  type="hidden" name="e_term" value="<%=e_term%>">
</form>


</center>
<%  
	  rs.close();         
      pstmt.close();  
      con.close();     
 %>
<script language="javascript" src="js_package.js">
</script>

<script>

document.getElementById('now_date').valueAsDate = new Date();




		function inCart(){
				if (sid == null) {
				}
				
				else{
					alert('���ٱ��Ͽ� �߰��Ǿ����ϴ�.');
					var str=cart.b_qty.value;
					var frm = document.cart;
					frm.action = "inCart.jsp";
					frm.submit();

			}
			
					function directOrd()        //  "��ñ����ϱ�" ��ư�� Ŭ���� ȣ��
		{
			var str=directOrd.e_no.value;
			var frm = document.directOrd;
			frm.action = "order.jsp";
			frm.submit();
		}


		function ChangeValue(){
			var valur_str = document.getElementById('select_value');
			alert("value:" + value_str.options[value_str.selectedIndex].value +
				"text:" + value_str.options[value_str.selectedIndex].text);
		}
function count(type)  {
  // ����� ǥ���� element
  const resultElement = document.getElementById('result');
  
  // ���� ȭ�鿡 ǥ�õ� ��
  let number = resultElement.innerText;
  
  // ���ϱ�/����
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // ��� ���
  resultElement.innerText = number;
}

function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}

function count(type)  {
  // ����� ǥ���� element
  const resultElement = document.getElementById('result');
  
  // ���� ȭ�鿡 ǥ�õ� ��
  let number = resultElement.innerText;
  
  // ���ϱ�/����
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // ��� ���
  resultElement.innerText = number;
}
}

 document.getElementById("button1").style.color ="#514FF0";
document.getElementById("button1").style.borderBottom ="3px solid #514FF0";

document.getElementById("button1").style.paddingBottom ="18px";
document.getElementById("button2").style.paddingBottom ="18px";
document.getElementById("button3").style.paddingBottom ="18px";
document.getElementById("button4").style.paddingBottom ="18px";

document.getElementById("button2").style.color ="gray";
document.getElementById("button3").style.color ="gray";
document.getElementById("button4").style.color ="gray";


document.getElementById("button1").onclick = function(){
            this.style.color ="#514FF0";
			this.style.borderBottom ="3px solid #514FF0";
			
			document.getElementById("button2").style.border ="none";
			document.getElementById("button3").style.border ="none";
			document.getElementById("button4").style.border ="none";

            document.getElementById("button2").style.color ="gray";
			document.getElementById("button3").style.color ="gray";
			document.getElementById("button4").style.color ="gray";
        };

document.getElementById("button2").onclick = function(){
             this.style.color ="#514FF0";
			 this.style.borderBottom ="3px solid #514FF0";

			 document.getElementById("button1").style.border ="none";
			document.getElementById("button3").style.border ="none";
			document.getElementById("button4").style.border ="none";

			 document.getElementById("button1").style.border ="none";
            document.getElementById("button1").style.color ="gray";
			document.getElementById("button3").style.color ="gray";
			document.getElementById("button4").style.color ="gray";
        };
document.getElementById("button3").onclick = function(){
             this.style.color ="#514FF0";
			 this.style.borderBottom ="3px solid #514FF0";

			 document.getElementById("button1").style.border ="none";
			document.getElementById("button2").style.border ="none";
			document.getElementById("button4").style.border ="none";

            document.getElementById("button1").style.color ="gray";
			document.getElementById("button2").style.color ="gray";
			document.getElementById("button4").style.color ="gray";
        };
 document.getElementById("button4").onclick = function(){
             this.style.color ="#514FF0";
			 this.style.borderBottom ="3px solid #514FF0";

			 document.getElementById("button1").style.border ="none";
			document.getElementById("button2").style.border ="none";
			document.getElementById("button3").style.border ="none";

            document.getElementById("button1").style.color ="gray";
			document.getElementById("button2").style.color ="gray";
			document.getElementById("button3").style.color ="gray";
        };



</script>





</body>

</html>


