<!DOCTYPE html>
<head>

</head>
<body>
    <a href="javascript:kakaoLogout();">카카오 로그아웃 임시</a>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('859ed74987eaed6f8cede7f7eca3f49e');
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                return;
            }
            Kakao.Auth.logout(function(response) {
                alert(response +' logout');
                window.location.href='/'
            });
    };
    </script>
    <%
    session.invalidate();    
    response.sendRedirect("main.jsp");
    %>
</body>
