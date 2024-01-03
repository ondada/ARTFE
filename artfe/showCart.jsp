<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>장바구니 내역 조회</title>
</head>

<center>
<br><br>
<font color="blue" size='6'><b>[장바구니 내역]</b></font><p>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/artfe";    // 접속 DB는 project
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String c_no = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장


	// 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
	// cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
	//  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
	//         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
	String jsql = "select * from cart where c_no = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, c_no);

	ResultSet rs = pstmt.executeQuery();

	if(rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{                       //  따라서,  !rs.next()의 값은 true가 됨 
%>
		관심내역이 비었습니다.
<%
	}
	else
	{
%>

<table border=1  style="font-size:10pt;font-family:맑은 고딕">
<tr>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p align="center"><font size="2" color="#ECFAE4"><strong>행사번호</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>행사명</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>행사가격</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>예매수량</strong></font></td>     
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="#ECFAE4"><strong>주문액(원)</strong></font></td>  
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="red"><b>[상품삭제]</b></font></td>
 </tr> 		

<%
//  [74행~109행 설명] :
//  장바구니에 담긴 상품내역을 웹페이지상에 보여주고자 할 때, 각각의 항목들이
//  상품번호(prdNo),  상품명(prdName),  상품단가(prdPrice),  주문수량(ctQty), 
//  주문액(prdPrice*ctQty ),  전체주문총액(total)으로 구성되고 있음에 유의할 것! 
//   => 장바구니담기 실행 후 보여지는 해당 웹페이지의 출력결과를 토대로 각 구성요소들을 확인 요망!

//  cart 테이블:  상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 올 수 있음.
//  goods 테이블:  상품명(prdName)과 상품단가(prdPrice) 값을 추출해 올 수 있음.
//  따라서, cart테이블과 goods테이블로부터, 동일한 상품번호(prdNo)에 해당하는 각 항목들의 값을 
//  추출해 올 수 있다. (mysql상에서 cart테이블과 goods테이블에 어떠한 필드들이 존재하는지 확인 요망!)
//  =>  <알고리즘 설명>:  cart테이블로부터 상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 오고, 
//         여기서 추출한 상품번호(prdNo)에 근거하여 goods테이블로부터
//         상품명(prdName)과 상품단가(prdPrice) 를 추출해 낸다.
//         이를 토대로, 주문액(prdPrice*ctQty )과  전체주문총액(total)을 계산해 낸다.
//         그런 다음, 추출해 낸 각 필드들 및 계산된 결과값들을 웹브라우저상에 출력해 준다. 
//         이후, 이러한 레코드단위의 필드추출 및 웹브라우저로의 출력하는 과정을 
//         더 이상 장바구니에 상품레코드가 없을 때까지(총 상품레코드 수 만큼) 반복한다.  


		String jsql2 = "select e_no, b_qty from cart where c_no = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, c_no);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String e_no = rs2.getString("e_no");	//  cart테이블로부터 상품번호 추출
    		int b_qty = rs2.getInt("b_qty");	                //  cart테이블로부터 주문수량 추출 

    		String jsql3 = "select e_name, e_price from event where e_no = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, e_no);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	e_name =  rs3.getString("e_name");	  //  goods 테이블로부터 상품명 추출
			int e_price =  rs3.getInt("e_price");                 //  goods 테이블로부터 상품단가 추출
				
    		int amount = e_price * b_qty;    //  주문액 계산
			total = total + amount;                  //  전체 주문총액 계산
%>
 <tr>       
    <td  bgcolor="#eeeede" height="30" align="center"><font size="2"><%=e_no%></font></td>     
	<td  bgcolor="#eeeede" height="30"align="center"><font size="2"><%=e_name%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=e_price%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=b_qty%></font> 매</td>
    <td  bgcolor="#eeeede" height="30"align="right"><font size="2"><%=amount%> 원</font></td>  
    <td  bgcolor="#eeeede" height="30"align="center"><a href="deleteCart.jsp?eno=<%=e_no%>"><font size="2" color=blue><b>삭제</b></a></font></td> 	
  </tr>   
<%
	     }  // while문의 끝
 %>
  <tr>
	<td colspan = 4 align=center><font size="2" color="red"><b>전체 주문총액</b></font></td>
	<td  bgcolor="#eeeede" height="30" align=right><font size="2" color="red"><b><%=total%> 원</b></font></td>
	<td align=center><font size=2 color=green>(선택물품 총합)</font></td>
  </tr>
 </table>      

<br><br>
<a href="deleteAllCart.jsp" ><font size=2>장바구니 비우기</font></a> &nbsp&nbsp
<a href="order.jsp" ><font size=2>주문하기</font></a>

<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>
 </center>                
</body>  
</html> 