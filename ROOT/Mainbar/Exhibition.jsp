<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>24 Brand Main</title>
<link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
<style type="text/css"> 
	table {
				text-align: center;
				margin-left: auto;			
				margin-right: auto;
				width: 80%;
			}
	table, td, th {
				border-collapse : collapse;
			}
    </style>

	<style media="screen">
	#customer_blue{
		margin:0 auto; 
		width: 700px; 
		border: 5px double black;
		background-color: gray;
		text-emphasis-color: white;
		padding: 45px;
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
 
<br><br><br><br>

 
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
	<a href = "../chat.jsp" onclick="window.open(this.href,'팝업창','width=500,height=700'); return false;">
		<img class="live_chat" src="/image/live_chat.png"  alt="실시간 상담"></a>
<!--상단바-->
<div class="box__top box__top--visible" data-montelena-acode="200003793">
	<a href="" class="link__top">
		<span class="sprite__common">Top으로 이동</span>
	</a>
</div>
<!--상단바-->
	<!--실시간 채팅-->

<!---->
<br><br><br>
        <center>
            <font size= 3px color="BLACK">
                24T EXHIBITION
            </font><br><br>
            <font size= 5px color="BLACK">
                <b>디자인을 경험해보세요</b>
            </font><br><br>
            <font size= 3px color="BLACK">
                24T의 역량있는 아티스트들의 작품을 전시하고, 소개하며 <br>
                동시대 예술의 진정한 의미와 가치를 알립니다.
            </font><br><br><br>
            <div id="exhibit">
                <table border="0">
                    <tr>
                        <td>
							<a href = "../3d/SweetHome3DJSViewer1.html" onclick="window.open(this.href,'팝업창', 'width=820 height=720'); return false;"><img src = "/image/exhibit1.jpg"></a>

                        </td>
                        <td>
							<a href = "../3d/SweetHome3DJSViewer2.html" onclick="window.open(this.href,'팝업창', 'width=820 height=720'); return false;"><img src = "/image/exhibit2.jpg"></a>
                        </td>
                        <td>
                            <a href = "../3d/SweetHome3DJSViewer3.html" onclick="window.open(this.href,'팝업창', 'width=820 height=720'); return false;"><img src = "/image/exhibit3.jpg"></a>
						</td>
                    </tr>
                    <tr>
                        <td>
                            <font size= 2px color="BLACK">
                                JUNG HYEON SU / 22.05.12 ~ 22.07.06<br>
                                24T와 함께하는 첫번째 아티스트, 정현수님을 만나보세요.
                            </font>
                        </td>
                        <td>
                            <font size= 2px color="BLACK">
                                KWON SEONG YUL / 22.04.22 ~ 22.06.12<br>
                                24T와 함께하는 두번째 아티스트, 권성율님을 만나보세요.
                            </font>
                        </td>
                        <td>
                            <font size= 2px color="BLACK">
                                KANG JUN HEE / 22.04.06 ~ 22.05.27<br>
                                24T와 함께하는 세번째 아티스트, 강준희님을 만나보세요.
                            </font>
                        </td>
                    </tr>
        
                </table>
            </div>
            </center>
    </div>
	<Br><br><Br><Br>
    </center>
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