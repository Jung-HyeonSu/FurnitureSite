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
        <meta charset="utf-8">
        <title>24 Brand</title>
    </head>

<br><br><br><br><br>
<body>
<div style="margin:0 auto; 
            width: 800px; 
            height: 500px; 
            border: 1px dotted; 
            border-radius: 100px; 
            padding: 10px;">

    <script> 
        function submit2(frm) { 
          frm.action='register.jsp'; 
          frm.submit(); 
          return true; 
        } 
    </script> 


    <p align="center"><img src="image/24T LOGO.png"></p><br>
    <form action="login.jsp" method="post">
        <p align="center">
            아이디:
            <input type="text" name="id" placeholder="이메일 주소" required>
            ㅣ 비밀번호:
            <input type="password" name="pw"><br><br>
            <input type="submit" value="로그인"><br><br>
            <button type="button" value="신규 회원가입" onclick="return submit2(this.form);">신규 회원가입</button>
        </p>
    </form>
        
      
    
<br>
<!-- 카카오 로그인 -->
        <p align="center">
            <a href="javascript:kakaoLogin();"><img src="http://papaspick.com/web/upload/2019_web/icon/kakao_login.jpg" alt="카카오계정 로그인" width="250" height="50"/></a>
        </p>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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

</div>


</body>
</html>

