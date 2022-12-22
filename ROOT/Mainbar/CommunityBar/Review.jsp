<link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

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

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>
		 <head>
		 <title>24 Brann Main</title>
		 </head>
		 <body>
		 <%
			final int ROWSIZE = 10;
			final int BLOCK = 1;
		
			int pg = 1;
			
			if(request.getParameter("pg")!=null) {
				pg = Integer.parseInt(request.getParameter("pg"));
			}
			
			int start = (pg*ROWSIZE) - (ROWSIZE-1);
			int end = (pg*ROWSIZE);
			
			int allPage = 0;
			
			int startPage = ((pg-1)/BLOCK*BLOCK)+1;
			int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
		
		 %>
		 <Center>
			<font size="10em" color="BLACK">
			<p>REIVIEW</p></font><Br>
		</Center>
		<center>
		 <%
			 Class.forName("com.mysql.jdbc.Driver");
			 String url = "jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC";
			 String id = "Padmin";
			 String pass = "24";
			 int total = 0;
			
			try {
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC","Padmin","24");
				Statement stmt = conn.createStatement();
				Statement stmt1 = conn.createStatement();
				String sql = "";
		
				String sqlCount = "SELECT COUNT(*) FROM board1";
				ResultSet rs = stmt.executeQuery(sqlCount);
				
				if(rs.next()){
					total = rs.getInt(1);
				}
		
				int sort=1;
				String sqlSort = "SELECT NUM from board1 order by ref desc, step asc";
				rs = stmt.executeQuery(sqlSort);
			
				
				while(rs.next()){
					int stepNum = rs.getInt(1);
					sql = "UPDATE board1 SET STEP=" + sort + " where NUM=" +stepNum;
					 stmt1.executeUpdate(sql);
					 sort++;
				}
				
				allPage = (int)Math.ceil(total/(double)ROWSIZE);
				
				if(endPage > allPage) {
					endPage = allPage;
				}
				
				out.print("총 게시물 : " + total + "개");
				
				String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT, review_buy_opt, review_star from board1 where STEP >="+start + " and STEP <= "+ end +" order by step asc";
				rs = stmt.executeQuery(sqlList);
				
		%>
		
		<table width="70%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5"><td width="5"></td></tr>
		 <tr style="background:url('/image/table_mid.gif') repeat-x; text-align:center;">
		   <td width="5"><img src="/image/table_left.gif" width="5" height="30" /></td>
		   <td width="70">번호</td>
		   <td width="200">제목</td>
		   <td width="70">작성자</td>
		   <td width="165">작성일</td>
		   <td width="60">조회수</td>
		   <td width="50">재구매여부</td>
		   <td width="100">별점</td>
		   <td width="5"><img src="/image/table_right.gif" width="5" height="30" /></td>
		  </tr>
		<%
			if(total==0) {
		%>
					 <tr align="center" bgcolor="#FFFFFF" height="30">
					<td colspan="6">등록된 글이 없습니다.</td>
				   </tr>
		<%
				 } else {
					 
				while(rs.next()) {
					int idx = rs.getInt(1);
					String name = rs.getString(2);
					String title = rs.getString(3);
					String time = rs.getString(4);
					int hit = rs.getInt(5);
					int indent = rs.getInt(6);
					int review_buy_opt = rs.getInt(7);
					int review_star = rs.getInt(8);
		
		
					Date date = new Date();
					SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
					String year = (String)simpleDate.format(date);
					String yea = time.substring(0,10);
				
		%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td><%=idx %></td>
			<td align="left">
			<% 
				
			for(int j=0;j<indent;j++){
		%>		&nbsp;&nbsp;&nbsp;<%
			}
			if(indent!=0){
		%>		<img src='/image/reply_icon.gif' />
		<%
			}
		%>
		<a href="/rboardview.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title %></a>
		<%
			if(year.equals(yea)){
		%>
					<img src='/image/new.jpg' />
		<%
				} 
		%>
			</td>
			<td align="center"><%=name %></td>
			<td align="center"><%=yea %></td>
			<td align="center"><%=hit %></td>
		
			<%if(review_buy_opt == 1){%>
				<td>O</td>
			  <%}else{%>
				<td>X</td>
			  <%}%>
			
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
		
			<td>&nbsp;</td>
		</tr>
		  <tr height="1" bgcolor="#D2D2D2"><td colspan="8"></td></tr>
		<% 
				}
			} 
			rs.close();
			stmt.close();
			conn.close();
		} catch(SQLException e) {
		//	out.println( e.toString() );
		}
		%>
		 <tr height="1" bgcolor="#82B5DF"><td colspan="8" width="752"></td></tr>
		 </table>
		 
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		  <tr><td colspan="4" height="5"></td></tr>
		  <tr>
			<td align="center">
				<%
					if(pg>BLOCK) {
				%>
					[<a href="/Mainbar/CommunityBar/Review.jsp?pg=1">◀◀</a>]
					[<a href="/Mainbar/CommunityBar/Review.jsp?pg=<%=startPage-1%>">◀</a>]
				<%
					}
				%>
				
				<%
					for(int i=startPage; i<= endPage; i++){
						if(i==pg){
				%>
							<u><b>[<%=i %>]</b></u>
				<%
						}else{
				%>
							[<a href="/Mainbar/CommunityBar/Review.jsp?pg=<%=i %>"><%=i %></a>]
				<%
						}
					}
				%>
				
				<%
					if(endPage<allPage){
				%>
					[<a href="/Mainbar/CommunityBar/Review.jsp?pg=<%=endPage+1%>">▶</a>]
					[<a href="/Mainbar/CommunityBar/Review.jsp?pg=<%=allPage%>">▶▶</a>]
				<%
					}
				%>
				</td>
				<tr height="5"><td width="5"></td></tr>
				</tr>
				  <tr align="center">
		   <td><a href="/rboardwrite.jsp"><input type="button" value="글쓰기"></a></td>
  </tr>
 </table>
</center>
 </body>
</html>

<br><br><br><br><bR><br><br><br><br><bR><br><br><br><br><bR><br><br><bR><br><br><br>

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