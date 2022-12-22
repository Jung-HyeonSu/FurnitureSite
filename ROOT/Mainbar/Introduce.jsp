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
	<!--트랜지션-->
	<style>
	.slider{
    width: 100%;
    height: 700px;
    position: relative;
    margin: 0 auto;
    overflow: hidden;
	text-align: center;
	}
	.slider input[type=radio]{
		display: none;
	}

	ul.imgs{
		padding: 0;
		margin: 0;
	}
	ul.imgs li{
		width:100%;
		position: absolute;
		left: 100%;
		transition-delay: 1s;
		list-style: none;
		padding: 0;
		margin: 0;
	}

	.bullets{
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom: 20px;
		z-index: 2;
	}
	.bullets label{
		display: inline-block;
		border-radius: 50%;
		background-color: rgba(0,0,0,0.55);
		width: 20px;
		height: 20px;
		cursor: pointer;
	}

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
	<!--트랜지션-->
	

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
			    <meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
				<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2mpimd30cn"></script>

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

 







	<img src="/image/Introduce123.PNG" style="width: 100%; height:1037PX; top: 0px;"><Br><br>
	<center><img src="../image/24T LOGO.png" width="100" height="100"></center>
	<font size="10px" color="BLACK">
	<div class="tran" style="padding: 40px;">
	<center><B><h3>24 가구 소개</h3></b>
	</font>
	<br>
	<img src="/image/Introduce2.jpg" style="width: 80%; height:2000px; top: 0px;">
</div>

	<div class="tran" style="padding: 40px;">
	<font size="10em" color="BLACK">
	<center><p><B><h3>Introduce</h3></B></p></font>
	<hr style="border : solid 2px black;" width="300" ></p></center></div>
	<Center><Br><Br>
	<font size="5px" color="BLACK">
	<b>1966년에 설립된 24가구는100년의 가치</b>
	<p>클래식 명품과 품격높은 세계적인 HIGH-END 브랜드와 함께 성장하고 있습니다.</p></font>
	<br><Br>
	<font size="4px" color="BLACK">
	<p>24가구만의 정교한 상감과 화려한 조각을 바탕으로 한 식탁 등은 <br/>누구나 가지고 싶어하는 살림살이였고, 24가구 제품을 </p>
	<p>소장하는 것만으로도 자부심을 느끼게 하기에 충분했었습니다.<br/>이제 어느덧 세월이 흘러 과거 세계적으로 유명한 디자이너가</p>
	<p>디자인한 가구를 직접 제작하여 OEM 방식으로 수출을 했던 24가구가<br/> 이제는 오히려 그 디자이너가 설립한 가구 회사에 </p>
	<p>디자인을 제공하고 주문 생산을 의뢰하는 뒤바뀐 입장이 되었습니다.</p>
	<br/><br/><br/><br/>
	<p>수출에 주력하여 가구 수출의 국가대표였던 24가구가 <br/>프랑스, 이탈리아 등의 최고 모던 가구와 미국 최고의 클래식 가구를 생산하는 </p>
	<p>세계적인 가구회사와 제휴하여 해외 유명 가구 브랜드에 디자인을 제공하는 <br/>국제적인 가구회사로 변모하게 되었습니다.</p>
	<p>앞으로도 24가구는 반세기동안 이어온<br/> 최고의 역사와 전통을 바탕으로 <br/>디자이너의 혼이 담긴 가구, 소장의 가치와 자부심을 누릴 수 있는</p>
	<p>가구만을 엄선하여 고객 여러분을 찾아갈 것입니다.</p>
	</font></Center>
	<br><br><br><br><br><br><br><br>
	<div class="tran">
	<font size="10em" color="BLACK">
	<center><p><B><h3>오시는길</h3></B></p></font>
	<hr style="border : solid 2px black;" width="300" ></p><Br><Br>
	</div>
	<center>
	<h1>동의대역 근처 버스타고 10분 거리</h1></center>
	<!--1-->
    <div id="map" style="width:500px;height:500px;margin:0 auto;"></div>
<br<br><br>
		<div id="bottom">
			<hr style="border : solid 1px black;" width="100%" ></p><Br><Br>
			<font size="2px" color="BLACK">
				<p>상호: (주)24가구 | 대표: 윤정현 | 개인정보관리책임자: 윤정현 | 전화: 000-0000-0000 | 이메일: asde48@naver.com</p>
				<p>주소: 동의대학교 정보공학관 (주)24가구 | 사업자등록번호: 000-00-00000 | 통신판매: 제2022-부산-0000호 | 호스팅제공자: (주)동의샵</p>
				<p>안전구매(에스크로) 서비스 가맹점이용약관 개인정보처리방침 사업자정보확인</p>
			</font>
			<br><br>
		</div>
<script>
var HOME_PATH = window.HOME_PATH || '.';


map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(35.153980, 129.032139),
    zoom: 13
});


var hyeonjinHouse = new naver.maps.LatLng(35.145580, 129.036539);
var jooyeokHouse = new naver.maps.LatLng(35.153980, 129.032139);


var markers = [];
var infowindows = [];


markers.push(new naver.maps.Marker({
    map: map,
    position: hyeonjinHouse
}));

infowindows.push(new naver.maps.InfoWindow({
    content: [
        '<div class="iw_inner">',
        '   <h3>24가구</h3>',
        '</div>'
    ].join('')
}));


markers.push(new naver.maps.Marker({
    map: map,
    position: jooyeokHouse
}));

infowindows.push(new naver.maps.InfoWindow({
    content: [
        '<div class="iw_inner">',
        '   <h3>동의대역</h3>',
        '</div>'
    ].join('')
}));

for(let i=0; i<markers.length; i++){
    naver.maps.Event.addListener(markers[i], "click", function(e) {
        if (infowindows[i].getMap()) {
            infowindows[i].close();
        } else {
            infowindows[i].open(map, markers[i]);
        }
    });
}

infowindows[0].open(map, markers[0]);
</script>

	</center>
	<!-- 카카오톡 실시간 상담 -->
<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
	<img class="kakaoChat" src="/image/kakaotalk.png" alt="카카오톡투명로고"/></a>

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
	</body>	
</html>