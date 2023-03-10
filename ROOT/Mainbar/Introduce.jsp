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
	<!--νΈλμ§μ-->
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
	<!--νΈλμ§μ-->
	

			<!-- μ€μκ° μ±ν-->
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Noto-Sans ν°νΈ-->
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
			<!-- JUA ν°νΈ-->
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
<!-- μΉ΄νκ³ λ¦¬ -->

<%String sessionid = (String)session.getAttribute("id");%>
<div id="menu">
	<ul>
		<li>
			<a href="/main.jsp"><img src="/image/24T LOGO2.png" style="width: 40px; top: 10px"></a>
		</li>
	</ul>
	<ul>
		<li><a href="/Mainbar/Introduce.jsp">μκ°</a>
		</li>
		<li><a href="/Mainbar/Product.jsp">μ ν</a>
		</li>
		<li>μ»€λ?€λν°
			<ul>
				<li><a href="/Mainbar/CommunityBar/Review.jsp">λ¦¬λ·°</a></li>
				<li><a href="/Mainbar/CommunityBar/Event.jsp">μ΄λ²€νΈ</a></li>
			</ul>
		</li>
		<li><a href="/Mainbar/CustomerSupport.jsp">κ³ κ°μ§μ</a>
		</li>
		<li><a href="/Mainbar/Exhibition.jsp">μ μν</a></li>
	</ul>
	<ul>
		<li>
			<img src="/image/user.png" style="width: 27px; top: 10px;">
			<ul>
				<li>
					<%
					
					boolean sessionlogin = sessionid == null ? false : true;
						if(sessionlogin) {
							
							%><a href="/logout.jsp"><%= sessionid %>λ λ‘κ·Έμμ</a><%
						}
						else{
							%><a href="/index.jsp">λ‘κ·ΈμΈ</a><%
						}
					%>
				</li>
				<%if (sessionlogin){
					if(sessionid.equals("root")){
					%>
						<li>
							<a href="/managementUser.jsp">νμ μ λ³΄ κ΄λ¦¬</a>
						</li>
						<li>
							<a href="/managementProduct.jsp">μν μ λ³΄ κ΄λ¦¬</a>
						</li>
		
						<li>
							<a href="/managementQnA.jsp">κ²μν κ΄λ¦¬</a>
						</li>
						<li>
							<a href="/managementPayProduct.jsp">μν μ£Όλ¬Έ κ΄λ¦¬</a>
						</li>
						<li>
							<a href="/managementRevenue.jsp">λ§€μΆ κ΄λ¦¬</a>
						</li><%
					}
					else{%>
						<li>
							<a href="/modify.jsp">νμ μ λ³΄ μμ </a>
						</li>
						<li>
							<a href="/ShoppingBag.jsp">μ₯λ°κ΅¬λ</a>
						</li>
		
						<li>
							<a href="/PayProduct.jsp">κ²°μ λͺ©λ‘</a>
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
	<center><B><h3>24 κ°κ΅¬ μκ°</h3></b>
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
	<b>1966λμ μ€λ¦½λ 24κ°κ΅¬λ100λμ κ°μΉ</b>
	<p>ν΄λμ λͺνκ³Ό νκ²©λμ μΈκ³μ μΈ HIGH-END λΈλλμ ν¨κ» μ±μ₯νκ³  μμ΅λλ€.</p></font>
	<br><Br>
	<font size="4px" color="BLACK">
	<p>24κ°κ΅¬λ§μ μ κ΅ν μκ°κ³Ό νλ €ν μ‘°κ°μ λ°νμΌλ‘ ν μν λ±μ <br/>λκ΅¬λ κ°μ§κ³  μΆμ΄νλ μ΄λ¦Όμ΄μ΄μκ³ , 24κ°κ΅¬ μ νμ </p>
	<p>μμ₯νλ κ²λ§μΌλ‘λ μλΆμ¬μ λλΌκ² νκΈ°μ μΆ©λΆνμμ΅λλ€.<br/>μ΄μ  μ΄λλ§ μΈμμ΄ νλ¬ κ³Όκ±° μΈκ³μ μΌλ‘ μ λͺν λμμ΄λκ°</p>
	<p>λμμΈν κ°κ΅¬λ₯Ό μ§μ  μ μνμ¬ OEM λ°©μμΌλ‘ μμΆμ νλ 24κ°κ΅¬κ°<br/> μ΄μ λ μ€νλ € κ·Έ λμμ΄λκ° μ€λ¦½ν κ°κ΅¬ νμ¬μ </p>
	<p>λμμΈμ μ κ³΅νκ³  μ£Όλ¬Έ μμ°μ μλ’°νλ λ€λ°λ μμ₯μ΄ λμμ΅λλ€.</p>
	<br/><br/><br/><br/>
	<p>μμΆμ μ£Όλ ₯νμ¬ κ°κ΅¬ μμΆμ κ΅­κ°λνμλ 24κ°κ΅¬κ° <br/>νλμ€, μ΄νλ¦¬μ λ±μ μ΅κ³  λͺ¨λ κ°κ΅¬μ λ―Έκ΅­ μ΅κ³ μ ν΄λμ κ°κ΅¬λ₯Ό μμ°νλ </p>
	<p>μΈκ³μ μΈ κ°κ΅¬νμ¬μ μ ν΄νμ¬ ν΄μΈ μ λͺ κ°κ΅¬ λΈλλμ λμμΈμ μ κ³΅νλ <br/>κ΅­μ μ μΈ κ°κ΅¬νμ¬λ‘ λ³λͺ¨νκ² λμμ΅λλ€.</p>
	<p>μμΌλ‘λ 24κ°κ΅¬λ λ°μΈκΈ°λμ μ΄μ΄μ¨<br/> μ΅κ³ μ μ­μ¬μ μ ν΅μ λ°νμΌλ‘ <br/>λμμ΄λμ νΌμ΄ λ΄κΈ΄ κ°κ΅¬, μμ₯μ κ°μΉμ μλΆμ¬μ λλ¦΄ μ μλ</p>
	<p>κ°κ΅¬λ§μ μμ νμ¬ κ³ κ° μ¬λ¬λΆμ μ°Ύμκ° κ²μλλ€.</p>
	</font></Center>
	<br><br><br><br><br><br><br><br>
	<div class="tran">
	<font size="10em" color="BLACK">
	<center><p><B><h3>μ€μλκΈΈ</h3></B></p></font>
	<hr style="border : solid 2px black;" width="300" ></p><Br><Br>
	</div>
	<center>
	<h1>λμλμ­ κ·Όμ² λ²μ€νκ³  10λΆ κ±°λ¦¬</h1></center>
	<!--1-->
    <div id="map" style="width:500px;height:500px;margin:0 auto;"></div>
<br<br><br>
		<div id="bottom">
			<hr style="border : solid 1px black;" width="100%" ></p><Br><Br>
			<font size="2px" color="BLACK">
				<p>μνΈ: (μ£Ό)24κ°κ΅¬ | λν: μ€μ ν | κ°μΈμ λ³΄κ΄λ¦¬μ±μμ: μ€μ ν | μ ν: 000-0000-0000 | μ΄λ©μΌ: asde48@naver.com</p>
				<p>μ£Όμ: λμλνκ΅ μ λ³΄κ³΅νκ΄ (μ£Ό)24κ°κ΅¬ | μ¬μμλ±λ‘λ²νΈ: 000-00-00000 | ν΅μ νλ§€: μ 2022-λΆμ°-0000νΈ | νΈμ€νμ κ³΅μ: (μ£Ό)λμμ΅</p>
				<p>μμ κ΅¬λ§€(μμ€ν¬λ‘) μλΉμ€ κ°λ§Ήμ μ΄μ©μ½κ΄ κ°μΈμ λ³΄μ²λ¦¬λ°©μΉ¨ μ¬μμμ λ³΄νμΈ</p>
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
        '   <h3>24κ°κ΅¬</h3>',
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
        '   <h3>λμλμ­</h3>',
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
	<!-- μΉ΄μΉ΄μ€ν‘ μ€μκ° μλ΄ -->
<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
	<img class="kakaoChat" src="/image/kakaotalk.png" alt="μΉ΄μΉ΄μ€ν‘ν¬λͺλ‘κ³ "/></a>

	<!--μ€μκ° μλ΄-->
		<a href = "../chat.jsp" onclick="window.open(this.href,'νμμ°½','width=500,height=700'); return false;">
		<img class="live_chat" src="/image/live_chat.png"  alt="μ€μκ° μλ΄"></a>
<!--μλ¨λ°-->
<div class="box__top box__top--visible" data-montelena-acode="200003793">
	<a href="" class="link__top">
		<span class="sprite__common">TopμΌλ‘ μ΄λ</span>
	</a>
</div>
<!--μλ¨λ°-->
	</body>	
</html>