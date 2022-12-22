<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>24 Brand Main</title>
<br>
<link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
<style type="text/css">
	table {
				text-align: left;
				margin-left: auto;			
				margin-right: auto;
				width: 80%;
				border-spacing: 30px;
 				border-collapse: separate;
			}
	td, th {
				border-collapse : collapse;
				border: 1px solid #444444;
				background-color: rgb(228, 226, 226);
				padding: 30px;
				border-radius: 50px; 

			}
	
    </style>
	<!-- Tab 트랜잭션 시작 -->
		<style type="text/css">
        
			body {
				font-family:"Malgun Gothic";
				font-size: 0.8em;
	
			}
			/*TAB CSS*/
	
			ul.tabs {
				text-align: center;
				display: table;
				margin-left: auto;
				margin-right: auto;
				padding: 0px;
				list-style: none;
				height: 60px;
				border: 2px solid #000;
				width: 15%;
			}
			ul.tabs li {
				margin: 0;
				padding: 0;
				height: 31px; /*--Subtract 1px from the height of the unordered list--*/
				line-height: 31px; /*--Vertically aligns the text within the tab--*/
				border: 1px solid #999;
				border-left: none;
				margin-bottom: -1px; /*--Pull the list item down 1px--*/
				overflow: hidden;
				position: relative;
				background: #e0e0e0;
			}
			ul.tabs li a {
				text-decoration: none;
				color: #000;
				display: block;
				font-size: 1.2em;
				padding: 0 20px;
				/*--Gives the bevel look with a 1px white border inside the list item--*/
				border: 1px solid #fff; 
				outline: none;
			}
			ul.tabs li a:hover {
				background: #ccc;
			}
			html ul.tabs li.active, html ul.tabs li.active a:hover  {
				 /*--Makes sure that the active tab does not listen to the hover properties--*/
				background: #fff;
				/*--Makes the active tab look like it's connected with its content--*/
				border-bottom: 1px solid #fff; 
			}
	
			/*Tab Conent CSS*/
			.tab_container {
				border-top: none;
				overflow: hidden;
				clear: both;
				float: left; 
				width: 100%;
				background: #fff;
			}
			.tab_content {
				padding: 20px;
				font-size: 1.2em;
			}
		</style>
	<!-- Tab 트랜잭션 끝 -->
	<!-- 룰렛 -->
	<style>
		.rouletter{
			position: relative;
			width:400px;
			height:400px;
		}
		.rouletter-bg{
			position: absolute;
			top:50%;
			left:50%;
			transform:translate(-50%,-50%);
			width:350px;
			height:350px;
			border-radius:350px;
			overflow:hidden;
		}
		.rouletter-wacu{
			width:100%;height:100%;
			background:#f5f5f2 url('https://m.lifeplanet.co.kr:444/commons/slink/administrator/openInnovation/img/MO)%20360%ED%94%8C%EB%9E%98%EB%8B%9B_%EB%A3%B0%EB%A0%9B%ED%8C%90_476x476_201026.png') no-repeat;
			background-size:100%;
			transform-origin: center;
		}
		.rouletter-arrow{
			position: absolute;
			top:0;
			left:50%;
			transform:translateX(-50%);
			width:1px;
			height:1px;
			border-right:10px solid transparent;
			border-left:10px solid transparent;
			border-top:40px solid red;
			border-bottom:0px solid transparent;
		}
		.rouletter-btn{
			position: absolute;
			top:50%;
			left:50%;
			transform:translate(-50%,-50%);
			width:80px;
			height:80px;
			border-radius:80px;
			background:#fff;
			border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
			border: 2px solid;
		}
		
		// 돌림판 회전 애니메이션
		.on{
			animation-name: ani;
			animation-duration: 0.1s;
			animation-fill-mode: forwards;  
			animation-iteration-count: infinite;
		}
		
		@keyframes ani{
			0% { 
				transform: rotate(0deg); 
				transition-timing-function: ease-out;
			}
			100%{ 
				transform: rotate(360deg); 
			}
		}
			</style>
			<style>

	.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
		background-color: darkolivegreen;
	}
	.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
		background-color: darkolivegreen;
	}
	.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
		background-color: darkolivegreen;
	}
	.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
		background-color: darkolivegreen;
	}

	.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
		left: 0;
		transition: 1s;
		z-index:1;
	}
	.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
		left: 0;
		transition: 1s;
		z-index:1;
	}
	.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
		left: 0;
		transition: 1s;
		z-index:1;
	}
	.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
		left: 0;
		transition: 1s;
		z-index:1;
	}

    </style>
			<!-- 실시간 채팅-->
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Noto-Sans 폰트-->
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
			<!-- JUA 폰트-->
			<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="resources/css/talk.css">
			<audio id='audio_play' src='resources/pop.mp3'></audio>
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

		<style type="text/css">	
			/* banner */
			.banner {
				 padding:0; 
				 overflow: hidden;
				 position: relative; 
				 top: 50px; 
				 left: 0px;
				 margin: 0 auto;
				 display: block; 
				 z-index: 11; 
				 opacity: 1; 
				 width: 1950px; 
				 height: 501px;
			}
			.banner ul {
				position: absolute; 
				margin: 0px;
				 padding:0; 
				 list-style: none; 
			}
			
			.banner ul li {
				float: left; 
				width: 1950px; 
				height: 501px; 
				margin:0; 
				padding:0;
			}
			   
		</style>
    <Center>
		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked>
			<input type="radio" name="slide" id="slide2">
			<input type="radio" name="slide" id="slide3">
			<input type="radio" name="slide" id="slide4">
			<div class="banner">
				<ul id="imgholder">
					<li><img src="./EventImg/Event1.jpg" style="z-index: 11; opacity: 1; width: 100%; height: 501px;"></li>
					<li><img src="./EventImg/Event11-2.jpg" style= "z-index: 11; opacity: 1; width: 100%; height: 501px;"></li>
					<li><img src="./EventImg/Event11-3.jpg" style="z-index: 11; opacity: 1; width: 100%; height: 501px;"></li>
					<li><img src="./EventImg/Event11-4.jpg" style="z-index: 11; opacity: 1; width: 100%; height: 501px;"></li>
				</ul>
			</div>
		</div>
	</Center>

	<Br><br><Br>
		
	
	





<!-- 탭 -->
			<div id="wrapper">    
				<!--탭 메뉴 영역 -->
				<ul class="tabs" >
					<li><a href="#tab1">
						<font size="2.5em" color="BLACK">
							<center>
							<h1>Event</h1>
							</center>
							</font>
					</a></li>
					<li><a href="#tab2">
						<font size="2.5em" color="BLACK">
							<center>
							<h1>Rullet</h1>
							</font>
						</center>
					</a></li>
				</ul>

				<!--탭 콘텐츠 영역 -->
				<div class="tab_container">

					<div id="tab1" class="tab_content">
						<div class="table">
							<table width=auto height="1000" >
								<tr>
									<td width="50%" bgcolor="#FF0000">
										<center>
											<img src="EventImg/Event2.jpg" width="200" height="200"><Br>
											<font size="5em" color="black">
											24커트러리 브랜드 위크<br>
											</font>
											<font size="3em" color="black">
											2022.05.30 ~ 2022.06.06<Br>
											펜싱 검(Sabre)을 디자인 모티브로 하여 가볍고 유연하며,<br>
											감각적이고 우아한 디자인을 선보이는 프랑스 명품 커트러리 브랜드
											</font>
										</center>
									</td>
						
										<td width="50%">
											<center>
												<img src="EventImg/Event3.jpg" width="200" height="200"><Br>
												<font size="5em" color="black">
												아이데뉴 브랜드전<br>
												</font>
												<font size="3em" color="black">
												2022.06.01 ~ 2022.06.07<Br>
												다양한 디자인 아이템 개발과 차별화된 브랜드 스토리를 갖춘<br>
												종합 디자인 가구 브랜드입니다.
												</font>
											</center>
										</td>
								</tr>
						
								<tr>
									<td width="50%">
										<center>
											<img src="EventImg/Event4.jpg" width="200" height="200"><Br>
											<font size="5em" color="black">
											쇼핑하기 좋은날 FLEX<br>
											</font>
											<font size="3em" color="black">
											2022.05.30 ~ 2022.06.13<Br>
											2대째 아버지의 마음을 담아 만든 원목가구<br>
											우리 아이가 사용 할 수 있도록 믿을 수 있는 브랜드입니다.
											</font>
										</center>
									</td>
									<td width="50%">
										<center>
											<img src="EventImg/Event5.jpg" width="200" height="200"><Br>
											<font size="5em" color="black">
											일상 기분 속전환 Art Stylish 아티쉬<br>
											</font>
											<font size="3em" color="black">
											2022.05.27 ~ 2022.06.21<Br>
											나의 공간을 바꿔 줄 추천 아트 한점<br>
											</font>
										</center>
									</td>
								</tr>
							</table>
					<!--이벤트-->
		
				  </div>
				</div>
					</div>



					<div id="tab2" class="tab_content">
					<!--룰렛-->
						<center>
						<font size="3em" color="red">
							이벤트 당첨시<br> 
							Cu3,000원 상품권, 스타벅스 아메리카노, 햄버거 세트 교환권

						</font>
						<Br>
							<div class="rouletter">
								<div class="rouletter-bg"><div class="rouletter-wacu"></div></div>
								<div class="rouletter-arrow"></div>
								<button class="rouletter-btn">start</button>
							</div>
						</center><Br><Br><Br><Br><Br><Br><Br><Br><br>
					<!--룰렛-->
					</div>
				</div>
			</div>
<!-- 탭 -->
<!-- 하단 바-->
			<div id="bottom">
				<hr style="border : solid 1px black;" width="100%" ></p><Br><Br>
					<font size="2px" color="BLACK">
						<p>상호: (주)24가구 | 대표: 윤정현 | 개인정보관리책임자: 윤정현 | 전화: 000-0000-0000 | 이메일: asde48@naver.com</p>
						<p>주소: 동의대학교 정보공학관 (주)24가구 | 사업자등록번호: 000-00-00000 | 통신판매: 제2022-부산-0000호 | 호스팅제공자: (주)동의샵</p>
						<p>안전구매(에스크로) 서비스 가맹점이용약관 개인정보처리방침 사업자정보확인</p>
					</font>
				<br><br>
				</div>
<!-- 하단 바-->
	</body>	
<!-- 탭 스크립트-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {

				//When page loads...
				$(".tab_content").hide(); //Hide all content
				$("ul.tabs li:first").addClass("active").show(); //Activate first tab
				$(".tab_content:first").show(); //Show first tab content

				//On Click Event
				$("ul.tabs li").click(function() {

					$("ul.tabs li").removeClass("active"); //Remove any "active" class
					$(this).addClass("active"); //Add "active" class to selected tab
					$(".tab_content").hide(); //Hide all tab content

					var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
					$(activeTab).fadeIn(); //Fade in the active ID content
					return false;
				});

			});
		</script>
<!-- 탭 스크립트-->

<!-- 룰렛 스크립트-->
<Script>
	var rolLength = 6; 
	var setNum; //랜덤 숫자 담을 변수
	var hiddenInput = document.createElement("input"); //히든인풋을 사용
	hiddenInput.className = "hidden-input";
	
	// 랜덤 숫자 부여
	const rRandom = () => {
	  var min = Math.ceil(0);
	  var max = Math.floor(rolLength - 1);
	  return Math.floor(Math.random() * (max - min)) + min;
	};
	
	// 돌림판 인터렉션
	const rRotate = () => {
	  var panel = document.querySelector(".rouletter-wacu");
	  var btn = document.querySelector(".rouletter-btn");
	  var deg = [];
	  for (var i = 1, len = rolLength; i <= len; i++) {
		deg.push((360 / len) * i);
	  }
	
	  var num = 0;
	  document.body.append(hiddenInput);
	  setNum = hiddenInput.value = rRandom();
	
	  var ani = setInterval(() => {
		num++;
		panel.style.transform = "rotate(" + 360 * num + "deg)";
		btn.disabled = true; //button,input
		btn.style.pointerEvents = "none"; //a 태그
	
		if (num === 50) {
		  clearInterval(ani);
		  panel.style.transform = "rotate(" + deg[setNum] + "deg)";
		}
	  }, 50);
	};
	
	// 결과 팝업
	const rLayerPopup = (num) => {
	  switch (num) {
		case 1:
		  alert("당첨!! 스타벅스 아메리카노");
		  break;
		case 3:
		  alert("당첨!! 햄버거 세트 교환권");
		  break;
		case 5:
		  alert("당첨!! CU 3,000원 상품권");
		  break;
		default:
		  alert("꽝! 다음기회에");
	  }
	};
	
	// 돌림판 리셋
	const rReset = (ele) => {
	  setTimeout(() => {
		ele.disabled = false;
		ele.style.pointerEvents = "auto";
		rLayerPopup(setNum);
		hiddenInput.remove();
	  }, 5500);
	};
	
	document.addEventListener("click", function (e) {
	  var target = e.target;
	  if (target.tagName === "BUTTON") {
		rRotate();
		rReset(target);
	  }
	});
	</script>
	</html>
