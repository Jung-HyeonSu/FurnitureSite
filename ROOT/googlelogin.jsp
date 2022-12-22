<!DOCTYPE html>
<html>
<body>
<meta name ="google-signin-client_id" content="875503587851-omcpkti4mq1t3tr19mogibivt24heiu7.apps.googleusercontent.com">

<ul>
 <li id="GgCustomLogin">
  <a href="javascript:void(0)">
   <span>Login with Google</span>
  </a>
 </li>
</ul>

<div class="g-signin2" data-onsuccess="onSignIn"></div>
<script>

//ó�� �����ϴ� �Լ�
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // �߰��� Oauth ���� ���� �߰� �� ���� �������� �߰�
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // �ν��Ͻ��� �Լ� ȣ�� - element�� �α��� ��� �߰�
        // GgCustomLogin�� li�±׾ȿ� �ִ� ID, ���� ������ options�� �Ʒ� ����,���н� �����ϴ� �Լ���
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api�� �̿��Ͽ� ������ �� ������Ͽ� ���� ���õ����� �����´�.
		url: 'https://people.googleapis.com/v1/people/me'
        // key�� �ڽ��� API Ű�� �ֽ��ϴ�.
		, data: {personFields:'birthdays', key:'AIzaSyCxzmlB0FvrFAekMjUAXLEXs-YlTF-MKQs', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //�������� �����´�.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>