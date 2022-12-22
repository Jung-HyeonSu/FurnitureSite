<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="/Mainbar/CommunityBar/css/btn.css?after" rel="stylesheet" type="text/css">
        <link href="/Mainbar/CommunityBar/css/Upbar.css?after" rel="stylesheet" type="text/css">
        <link href="/Mainbar/CommunityBar/css/BSbar.css?after" rel="stylesheet" type="text/css">
        <meta charset="utf-8">
        <title>24 Brand</title>
<Style>
    * {

    }
        input {
            border: 1px lightgray solid;
        }
        button{
            background-color: gray;
            border: 1px lightgray solid;
            width :100px;
            height :60px;
        }
        legend{
            margin:0 auto; 
            width: 800px; 
            height: 500px; 
            border: 1px dotted; 
            padding: 10px;
            border: 1px lightgray solid;
        }
        table{
            width: 30%;
            height: 500px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            border: lightgray 1px solid;
            padding: 100px;
        }
        input[type="checkbox"]{
        display: none;
        }
        input[type="checkbox"] + label{
                display: inline-block;
                width: 30px;
                height: 30px;
                border:3px solid #707070;
                position: relative;
        }
        input[id="check1"]:checked + label::after{
                content:'✔';
                font-size: 20px;
                width: 25px;
                height: 25px;
                text-align: center;
                position: absolute;
                left: 0;
                top:0;
        }
        .login{
            width: 150px; height: 63px; 
            background-color: red; 
            color: white; 
            font-size: 20px; 
            font-weight: bold; 
            padding: 0px;

        }
        .login:hover{
            background-color: orange;
        }
        .register{
            width: 80%; 
            height:80px; 
            color: white; 
            font-weight: bold; 
            font-size: 15px;
        }
        .register:hover{
            background-color: orange;
        }
</style>
    </head>

<br><br><br><br><br>
<body>
<!--상단바-->
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
<!--상단바-->
<div class="legend">
<!-- 로그인 테이블-->
<form action="login.jsp" method="post">
<table>
    <Tr>
        <td colspan="2">
            <p align="center"><img src="image/24T LOGO.png"></p><br><br><br>
        </td>
    </Tr>
    <tr>
        <td>
            <p align="left">회원로그인</p>
            <br>
        </td>
    </tr>
    <!--본문 TR-->
    <Tr>
        <td style="vertical-align: bottm;">
            <input type="text" name="id" style="width: 400px; height: 30px;" placeholder="&nbsp아이디" required>
            </td>
        <TD rowspan="2">
            <input type="submit" class="login" style=""value="로그인">
        </TD>
    </Tr>
    <tr>
        <td>
                  <input type="password" name="pw" style="width: 400px; height: 30px;" placeholder="&nbsp비밀번호">
        </td>
    </Tr>
    <!--본문 TR-->
    <tr>
        <td colspan="2" style="text-align:left; vertical-align: top;">
            <br>
                <p style="vertical-align: middle;"><input type="checkbox" id="check1"><label for="check1"></label>&nbsp아이디저장</p>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br><br>
            <!--카카오 로그인-->
            <p align="center">
                <a href="javascript:kakaoLogin();">
                    <img style="width:80%; height:80px;"src="http://papaspick.com/web/upload/2019_web/icon/kakao_login.jpg" alt="카카오계정 로그인" width="250" height="50"/>
                </a>
                </p>
                <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
                <!--카카오 로그인-->
        </td>
    </Tr>
    <tr>
        <td colspan="2">
            <br>
            <button class="register" type="button" value="신규 회원가입" onclick="return submit2(this.form);">신규 회원가입</button>
        </td>
    </tr>
</table>
</form>
        
      
    
<br>


</div>
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
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
<!-- 회원가입?-->
    <script> 
        function submit2(frm) { 
        frm.action='register.jsp'; 
        frm.submit(); 
        return true; 
        } 
    </script> 
<!-- 회원가입?-->
<!-- LOGIN API-->
    <script>
        window.Kakao.init('859ed74987eaed6f8cede7f7eca3f49e');
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'account_email, profile_nickname, gender, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            var kakao_account = res.kakao_account;
                            var kakao_email = res.kakao_account.email;
                            var kakao_nickname = res.kakao_account.profile.nickname;
                            var kakao_gender = res.kakao_account.gender;
                            var kakao_birthday = res.kakao_account.birthday;
                            
                            console.log(kakao_email)
                            console.log(kakao_nickname)
                            console.log(kakao_gender)
                            console.log(kakao_birthday)
                            console.log(kakao_account)
                            window.location.href='/kakaologin.jsp?id='+kakao_email+'&name='+kakao_nickname+'&sex='+kakao_gender+'&birth='+kakao_birthday //리다이렉트 되는 코드
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
    <!--
    <p align="center">
    <a href="javascript:showLoginPopup();"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQAo74Slh5I2MVx1c4IWfV14MFOtAWyD3LFg&usqp=CAU" alt="네이버계정 로그인" width="250" height="50"/></a>
    </p>

    <script>
    //네이버 로그인
    // 네이버 로그인을 위한 팝업창 생성
    function showLoginPopup(){
        let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
            'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
            '&client_id=yfhnDAEeRuh__nWLAOYA' +     // 발급받은 client_id 를 입력
            '&state=HOjE8CjrAJ' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
            '&redirect_uri=http://101.101.209.150/navercallback.jsp';   // 어플케이션에서 등록했던 CallBack URL를 입력

        // 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
        window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
    }

    </script>
    -->
    <!-- 구글 로그인 
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="513116461769-afatr2vai4621cpq0ed7qf5s2ok587ff.apps.googleusercontent.com">

    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
        }
        function signOut() { 
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                        console.log('User signed out.');
                    });
                auth2.disconnect(); 
            }
    </script>

    <title>Document</title>
    </head>
    <body>
    <h1>Google Login test</h1>
    <div class="g-signin2" data-onsuccess="onSignIn"></div>
    <a href="#" onclick="signOut();">Sign out</a>
    </body>
    </html>
    -->







    <!-- 페이스북 로그인 
    <p align="center">
    <a href="javascript:void(1)"><img src="/image/facebooklogin.png" onclick="fnFbCustomLogin();" alt="페이스북계정 로그인" width="250" height="50"/></a>
    </p>

    <script>
    //기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
    function statusChangeCallback(res){
    statusChangeCallback(response);
    }

    function fnFbCustomLogin(){
    FB.login(function(response) {
        if (response.status === 'connected') {
            FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
                console.log(r);
            })
        } else if (response.status === 'not_authorized') {
            // 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
            alert('앱에 로그인해야 이용가능한 기능입니다.');
        } else {
            // 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
            alert('페이스북에 로그인해야 이용가능한 기능입니다.');
        }
    }, {scope: 'public_profile,email'});
    }

    window.fbAsyncInit = function() {
    FB.init({
        appId      : '512754120577487', // 내 앱 ID를 입력한다.
        cookie     : true,
        xfbml      : true,
        version    : 'v10.0'
    });
    FB.AppEvents.logPageView();   
    };
    </script>
    -->
    <!--반드시 중간에 본인의 앱아이디를 입력하셔야 합니다.
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=1588150011384568" nonce="SiOBIhLG"></script>
    -->
<!--LOGIN API-->
</html>

