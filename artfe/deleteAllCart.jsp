<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>주문 완료 or  장바구니내용 삭제</title></head>
<body>
<center>
<link rel="stylesheet" href="css/cartorder.css">
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //  세션번호(장바구니번호)를 가져옴
	String caseNo = request.getParameter("case");

	String jsql = "delete from cart where ctNo=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	
    pstmt.executeUpdate();

	if(caseNo!= null)  //  (1) 주문완료로 인한 장바구니 비우기 수행하고 난 후의 주문완료 메시지 출력
	{                             //   orderOK.jsp의 107행 참조
%>

<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>예매가 완료되었습니다.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('mpbookinfo.jsp')">
        예매내역 확인
    </div></center>
<%
	}
	  else   //  (2) 주문과 상관없이 장바구니 비우기를 수행한 경우의 출력
	 {
%>
<br><br><br>
<center><h1 style="margin-top:55px; color:gray;"><b>행사바구니 내역을 삭제하였습니다.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        행사 보러 가기
    </div></center>
<%
	  }
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>