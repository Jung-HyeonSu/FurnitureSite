<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>24 Brand Main</title>
<link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
<style type="text/css">
	table {
				
				margin-left: auto;			
				margin-right: auto;
				width: 80%;
				border: 1px black;			
			}
	table, td, th {
				border-collapse : collapse;
			}
	.leftt{
		text-align:left;
	}
    </style>

	<style media="screen">
	#customer_blue{
		margin:0 auto; 
		width: 700px; 
		border: 5px double black;
		background-color: gray;
		text-emphasis-color: white;
		padding: 0px;
		border-radius: 50px;
	}
	</style>
			<!-- 실시간 채팅-->
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Noto-Sans 폰트-->
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
			<!-- JUA 폰트-->
			<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="resources/css/talk.css">
			<audio id='audio_play' src='resources/pop.mp3'></audio>ㄴ
			<script type="text/javascript"> 
			function play() { 
				var audio = document.getElementById('audio_play'); 
				if (audio.paused) { 
					audio.play(); 
				}else{ 
					audio.pause(); 
					audio.currentTime = 0 
				} 
			} 
			</script>

</head>
<body>
    
<!-- --------------------------------------------------------------------HTML------------------------------------------------------ -->
<!-- 카테고리 -->

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

 
<br><br><br>




<!-- 카카오톡 실시간 상담 -->
<a href="http://pf.kakao.com/_yZatb/chat" target="_blank">
	<img class="kakaoChat" src="/image/kakaotalk.png" alt="카카오톡투명로고"/></a>

	<script>
		$(window).scroll(function(){
			if ($(this).scrollTop() > 300){
				$('.btn_gotop').show();
			} else{
				$('.btn_gotop').hide();
			}
		});
		$('.btn_gotop').click(function(){
			$('html, body').animate({scrollTop:0},400);
			return false;
		});
	</script>
	<!--실시간 상담-->
	<a href = "../../chat.jsp" onclick="window.open(this.href,'팝업창','width=500,height=700'); return false;">
		<img class="live_chat" src="/image/live_chat.png"  alt="실시간 상담"></a>
<!--상단바-->
<div class="box__top box__top--visible" data-montelena-acode="200003793">
	<a href="" class="link__top">
		<span class="sprite__common">Top으로 이동</span>
	</a>
</div>
<!--상단바-->

<!--본문-->
<center><font size="10em" color="black">
	고객지원<br></font></center><br><br>
		<div id="customer_blue">
			<p style="padding: 45px;">월요일 ~ 금요일: 오전 08:30 ~ 오후 17:30 ㅣ<br class="mBr"/> 점심시간:12:00~13:00 ㅣ 주말 및 공휴일:휴무<br><br>
			<span style="color:#ccc">매주 월,화요일과 공휴일 다음날은 상담전화가 많아 고객응대가 다소 지연될 수 있습니다. <br>
			해당일을 제외하고 연락주시면 더욱 빠른 상담을 받으실 수 있으니 참고부탁드립니다. </span><br><br>
			<span class="customNum">고객센터 안내 <span>1234-5678</span></span>
			</p>
			<table width=auto height="100">
				<tr>
					<td width="33.3%" >
						<dl>
							<center>
							<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
							<dd><img width="50px"src="/image/kakaotalk.png"></dd>
							<dd>카카오톡 상담</dd>
							</a>
							</center>
						</dl>
					</td>
					<td width="33.3%">
						<dl>
							<center>
							<a href="/boardlist.jsp">
							<dd><img width="50px"src="/image/123.png"></dd>
							<dd>간편문의</dd>
							</a>
							</center>
						</dl>
					</td>
					<td width="33.3%">
						<dl>
							<center>
							<a href="/chat.jsp" onclick="window.open(this.href,'팝업창','width=500,height=700'); return false;">
							<dd><img width="50px"src="/image/live_chat.png"></dd>
							<dd>실시간 상담</dd>
							</a>
							</center>
						</dl>
					</td>
				</tr>
				</table>
		</div>
<!--본문-->
<br><br>
<!--자주찾는 질문-->
		<table border="1" style="width: 80%;">
			<tr>
				<td width="50%" bgcolor="gray">		
		<center>
		<font size="5em" color="white">
			자주찾는 질문
		</font>
		<hr style="border : solid 1px Red;" width="100%" >
		</center>
				</td>
				<td width="50%" bgcolor="gray">
		<Center>
		<font size="5em" color="white">
			공지 사항
		</font>
		<hr style="border : solid 1px Red;" width="100%" >
		</center>
				</td>
			</tr>
			<tr>
				<td width="50%" class="leftt" bgcolor="lightgray">
					<Br>
					<table width="500px" border="1">
						 <% // MySQL JDBC Driver Loading
							 Class.forName("com.mysql.cj.jdbc.Driver"); 
							 Connection conn =null;
							 Statement stmt =null;
							 ResultSet rs =null;
							 try {
													 
								 String jdbcDriver ="jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC"; 
								 String dbUser ="Padmin"; //mysql id
								 String dbPass ="24"; //mysql password
								 String query ="select * from board2 order by num"; //query
			 
			 
								 // Create DB Connection
								 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			 
								
								 // Create Statement
								 stmt = conn.createStatement();
			 
			 
								 // Run Qeury
								 rs = stmt.executeQuery(query);
			 
			 
								 // Print Result (Run by Query)
								 while(rs.next()) {
						  %>
						  
						 <tr>
							 <td width="50px;"><%= rs.getString("num") %></td>
							 <td style="text-align:left;">&nbsp<%= rs.getString("name") %></td>
							 <td><%= rs.getString("date") %></td>
			 
						 </tr>
						 <%
							 }
						 }
						 
						 
						 catch(SQLException ex) {
							 out.println(ex.getMessage());
							 ex.printStackTrace();
						 } finally {
							 // Close Statement
							 if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
							 if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
							 // Close Connection
							 if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
						 }
						 %>
					 </table>
					 <Br>
							</td>
					<td width="50%" bgcolor="lightgray">
						<Br>
						<table width="500px" border="1">
							<title>제품 목록</title>
							<style>
								table{
									width:700px;
									height:200px;
									margin: auto;
								}
								td{
									text-align: center;
								}
							</style>
				
							 <% // MySQL JDBC Driver Loading
								 Class.forName("com.mysql.cj.jdbc.Driver"); 
								 conn =null;
								 stmt =null;
								 rs =null;
								 try {
														 
									 String jdbcDriver ="jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC"; 
									 String dbUser ="Padmin"; //mysql id
									 String dbPass ="24"; //mysql password
									 String query ="select * from board3 order by num"; //query
				 
				 
									 // Create DB Connection
									 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				 
				 
									 // Create Statement
									 stmt = conn.createStatement();
				 
				 
									 // Run Qeury
									 rs = stmt.executeQuery(query);
				 
				 
									 // Print Result (Run by Query)
									 while(rs.next()) {
							  %>
							  
							 <tr>
								 <td width="50px;"><%= rs.getString("num") %></td>
								 <td style="text-align:left;">&nbsp<%= rs.getString("name") %></td>
								 <td><%= rs.getString("date") %></td>
				 
							 </tr>
							 <%
								 }
							 }
							 
							 
							 catch(SQLException ex) {
								 out.println(ex.getMessage());
								 ex.printStackTrace();
							 } finally {
								 // Close Statement
								 if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
								 if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
								 // Close Connection
								 if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
							 }
							 %>
						 </table>
	<br>
		
					</td>
			</tr>
		</table>
		<Br><Br><Br>
<!--자주찾는 질문-->
<!--테이블-->
		<br>
	
		<br>
<!--테이블-->
<Br><BR><Br>
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
<!--하단바-->
</body>
</html>