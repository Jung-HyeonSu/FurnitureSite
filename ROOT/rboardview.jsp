<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC";
	String id = "Padmin";
	String pass = "24";
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	try {
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC","Padmin","24");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT, review_buy_opt, review_star FROM board1 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		 if(rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String memo = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
                int review_buy_opt = rs.getInt(6);
                int review_star = rs.getInt(7);
				hit++;
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>24게시판</title>
 <link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
 <link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
 <link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
 </head>
 <body>
  <%String sessionid = (String)session.getAttribute("id");%>
  <div id="menu">
    <ul>
      <li>
        <a href="/main.jsp"><img src="/image/24T LOGO2.png" style="width: 40px; top: 10px"></a>
      </li>
    </ul>
    <ul>
      <li><a href="/Mainbar/Introduce.jsp">소개</a>
      </li>
      <li><a href="/Mainbar/Product.jsp">제품</a>
      </li>
      <li>커뮤니티
        <ul>
          <li><a href="/Mainbar/CommunityBar/Review.jsp">리뷰</a></li>
          <li><a href="/Mainbar/CommunityBar/Event.jsp">이벤트</a></li>
        </ul>
      </li>
      <li><a href="/Mainbar/CustomerSupport.jsp">고객지원</a>
      </li>
      <li><a href="/Mainbar/Exhibition.jsp">전시회</a></li>
    </ul>
    <ul>
      <li>
        <img src="/image/user.png" style="width: 27px; top: 10px;">
        <ul>
          <li>
            <%
            
            boolean sessionlogin = sessionid == null ? false : true;
              if(sessionlogin) {
                
                %><a href="/logout.jsp"><%= sessionid %>님 로그아웃</a><%
              }
              else{
                %><a href="/index.jsp">로그인</a><%
              }
            %>
          </li>
          <%if (sessionlogin){
            if(sessionid.equals("root")){
            %>
              <li>
                <a href="/managementUser.jsp">회원 정보 관리</a>
              </li>
              <li>
                <a href="/managementProduct.jsp">상품 정보 관리</a>
              </li>
      
              <li>
                <a href="/managementQnA.jsp">게시판 관리</a>
              </li>
              <li>
                <a href="/managementPayProduct.jsp">상품 주문 관리</a>
              </li>
              <li>
                <a href="/managementRevenue.jsp">매출 관리</a>
              </li><%
            }
            else{%>
              <li>
                <a href="/modify.jsp">회원 정보 수정</a>
              </li>
              <li>
                <a href="/ShoppingBag.jsp">장바구니</a>
              </li>
      
              <li>
                <a href="/PayProduct.jsp">결제목록</a>
              </li>
            <%}
          }
          %>
        </ul>
      </li>
    </ul>
  </div>

  <br><br><br><br>
  <center>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('image/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="image/table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="image/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=hit%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=name%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=time%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=title%></td>
      <td width="0">&nbsp;</td>
     </tr>
    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0"></td>
      <td width="399" colspan="2" height="200"><%=memo %></td>
    </tr>
    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">재구매여부</td>
       <td>
         <%if(review_buy_opt == 1){%>
             <td>O</td>
         <%}else{%>
             <td>X</td>
         <%}%>
       </td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
    <td width="0">&nbsp;</td>
    <td align="center" width="76">별점</td>
    <td width="319">
      <%if(review_star == 1){%>
        <td>★☆☆☆☆</td>
      <%}else if(review_star == 2){%>
        <td>★★☆☆☆</td>
      <%}else if(review_star == 3){%>
        <td>★★★☆☆</td>
      <%}else if(review_star == 4){%>
        <td>★★★★☆</td>
      <%}else{%>
        <td>★★★★★</td>
      <%}%>
    </td>
 <td width="0">&nbsp;</td>
                               
<% 
 	sql = "UPDATE board1 SET HIT=" + hit + " where NUM=" +idx;
 	stmt.executeUpdate(sql);
 	rs.close();
 	stmt.close();
 	conn.close();
	 	} 
	}catch(SQLException e) {
}

%>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399">
        <input type=button value="목록" OnClick="window.location='Mainbar/CommunityBar/Review.jsp'">
        <input type=button value="수정" OnClick="window.location='rboardmodify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
        <input type=button value="삭제" OnClick="window.location='rboarddelete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </center>

<!-- 카카오톡 실시간 상담 -->
<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
	<img class="kakaoChat" src="/image/kakaotalk.png" alt="카카오톡투명로고"/></a>

<!--실시간 상담-->
    	<a href = "chat.jsp" onclick="window.open(this.href,'팝업창','width=500,height=700'); return false;">
		<img class="live_chat" src="/image/live_chat.png"  alt="실시간 상담"></a>
<!--상단바-->
		<div class="box__top box__top--visible" data-montelena-acode="200003793">
			<a href="" class="link__top">
				<span class="sprite__common">Top으로 이동</span>
			</a>
		</div>
<!--상단바-->
<!--상단바-->
  <!--하단바-->
      <div id="bottom">
      <hr style="border : solid 1px black;" width="100%" ></p><Br><Br>
          <font size="2px" color="BLACK">
              <p>상호: (주)24가구 | 대표: 윤정현 | 개인정보관리책임자: 윤정현 | 전화: 000-0000-0000 | 이메일: asde48@naver.com</p>
              <p>주소: 동의대학교 정보공학관 (주)24가구 | 사업자등록번호: 000-00-00000 | 통신판매: 제2022-부산-0000호 | 호스팅제공자: (주)동의샵</p>
              <p>안전구매(에스크로) 서비스 가맹점이용약관 개인정보처리방침 사업자정보확인</p>
          </font>
      <br><br>
      </div>
</body>
</html>