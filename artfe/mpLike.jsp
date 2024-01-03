<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
  <%@include file="header.jsp" %>
	<link rel="stylesheet" href="css/mpLike.css">
<%
	if(sid == null){
	//로그인페이지이동
	response.sendRedirect("login.jsp");
} 
else 
			request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/artfe";   //  DB명이 project임에 주의!(모든 소스코드 확인!)
     String DB_ID="dada"; 
     String DB_PASSWORD="1123";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	     //  로그인폼(login.jsp)에서 입력한 ID를 포함한 레코드를 member 테이블에서 조회함
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
            <li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">내 정보</a></li>
            <li style="margin-left:30px;"><a href="mpInfoUpdate.jsp" style=" font-size:17px; font-weight:500; margin-bottom:10px; color:gray;">회원정보 수정</a></li>

			<li><a style="font-size:20px; font-weight:700; margin-bottom:-10px;">예매확인</a></li>
			<li style="margin-left:30px;"><a href="mpbookinfo.jsp" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">예매 내역</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">행사관리</a></li>
			<li style="margin-left:30px;"><a href="mpCart.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">행사바구니</a></li>
			<li style="margin-left:30px;"><a href="mpLike.jsp" style="color:#514FF0; font-size:17px; font-weight:400; margin-bottom:10px; ">관심행사</a></li>

			<li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">고객센터</a></li>
			 <li style="margin-left:30px;"><a href="faq.jsp" style="font-size:17px; font-weight:normal; margin-bottom:10px; color:gray;">자주 묻는 질문</a></li>

			 <li><a style="font-size:20px; font-weight:600; margin-bottom:-10px;">계정관리</a></li>
			<li style="margin-left:30px;"><a href="logout.jsp" style="font-size:17px; font-weight:400; margin-bottom:-10px; color:gray;">로그아웃</a></li>
			<li style="margin-left:30px;"><a href="deleteuser.jsp?id=<%=id%>" style="font-size:17px; font-weight:400; margin-bottom:10px; color:gray;">회원 탈퇴</a></li>
            <br><br><br>
        </ul>  
       </div>
		 <div id="mypage2"><div class="book-form">
		 <br>
		<h2>관심행사</h2><br>
	<hr width="100%" style="height: 2px; float:left; margin-bottom:10px;">
	  
	<%

		 String likeNo = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장


		// 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
		// cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
		//  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
		//         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
		String jsql = "select * from booklike where likeNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, likeNo);

		ResultSet rs = pstmt.executeQuery();

if(!rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	{                       //  따라서,  !rs.next()의 값은 true가 됨 
%>
		<br><br><br>
		 <center><h1 style="margin-top:55px; color:gray;"><b>관심행사가 비어있습니다.</b></h1></center><br><br><br><br><br>
			<center><div class="btn" onclick="location.replace('exhi_art.jsp')">
        행사보러 가기
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
			String e_no = rs2.getString("e_no");	//  cart테이블로부터 상품번호 추출
    		      

    		String jsql3 = "select e_name, e_term, e_price from event where e_no = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, e_no);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	e_name =  rs3.getString("e_name");	
			String	e_term =  rs3.getString("e_term");//  goods 테이블로부터 상품명 추출
			int e_price =  rs3.getInt("e_price");                 //  goods 테이블로부터 상품단가 추출
				
    	
%> 
		<div id="like" style="border-bottom:1px solid #dedede;">
		<div id="likeDiv">
		<a href="sangse.jsp?e_no=<%=e_no%>">
		<div id="section" style="background-image: url(images/<%=e_no%>.jpg); background-size: cover; background-repeat: no-repeat;"></div>
			
		<div id="sec-content">
		  <h3><%= e_name %></h3>
		  <p style=" color:gray; margin-bottom:10%;"><%=e_term %></p>
		    <b><p style="color:#514FF0"><a href="deletelike.jsp?no=<%=e_no%>"><input type="button" class="deleteButton"  value="관심행사삭제" style="cursor:pointer; font-size:10pt;font-family:맑은 고딕"  onclick="delLike()"></a>&nbsp;&nbsp;</p></b><br>
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
        // 콘솔창을 보면 둘다 동일한 값이 나온다

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

				alert('관심행사에서 삭제되었습니다.');
				document.location.href="mpCart.jsp";
		}


	</script>
  <%@include file="footer.jsp" %>
</center>
</body>
</html>