<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Arrays" %>
<html>
<head>
	<script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>24 Brand Main</title>
<link href="/Mainbar/CommunityBar/css/btn.css?after" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/Upbar.css?after" rel="stylesheet" type="text/css">
<link href="/Mainbar/CommunityBar/css/BSbar.css?after" rel="stylesheet" type="text/css">

<style type="text/css"> 
	#weather {
        border:1px dotted; 
        padding:10px;
        margin-left:85%;
        text-align: center;
        font:bold 18px "malgun gothic";
        text-align: center;
    }
	.search {
		position: relative;
		width: 1200px;
		margin: auto;
	}


	.img {
		position : absolute;
		width: 17px;
		top: 10px;
		right: 12px;
		margin: 0;
	}
	input {
		width: 100%;
		border: 1px solid rgb(73, 73, 73);
		border-radius: 8px;
		padding: 10px 12px;
		font-size: 14px;
	}
	/*메인 이벤트 슬라이드*/
	.slider{
    width: 100%;
    height: 700px;
    position: relative;
    margin: 0 auto;
    overflow: hidden;
	}
	.slider input[type=radio]{
		display: none;
	}

	ul.imgs{
		padding: 0;
		margin: 0;
	}
	ul.imgs li{
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

</head>
<body>
    
<!-- --------------------------------------------------------------------body------------------------------------------------------ -->
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
<style>


</style>
<form action="search.jsp" method="get">
    <p align="center" style="padding-top:20px">
        <input type="text" name="search" placeholder="검색어 입력" style="width:50%;height:40px;text-align:center; background-color: #333333; font-size: 1rem; color: #c1c1c1;" >
            <button type="submit" value="검색" class="btn">
				<svg width="26" height="26" aria-hidden="true" class="svg-icon search-field__search-icon search-field__search-icon--show">
					<path fill-rule="evenodd" clip-rule="evenodd" d="M13.98 15.395a6.294 6.294 0 111.414-1.414l4.602 4.601-1.414 1.414-4.602-4.601zm.607-5.101a4.294 4.294 0 11-8.587 0 4.294 4.294 0 018.587 0z" fill="#c1c1c1"></path>
				</svg>
			</button>
    </p>
</form>

<!--이벤트 페이지-->
<div class="slidebox">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<input type="radio" name="slide" id="slide04">
	<ul class="slidelist">
		<li class="slideitem">
			<div>
				<label for="slide04" class="left"></label>
				<label for="slide02" class="right"></label>
				<a href="/Mainbar/Introduce.jsp"><img src="./image/mainimg.png"></a>
			</div>
		</li>
		<li class="slideitem">
			<div>
				<label for="slide01" class="left"></label>
				<label for="slide03" class="right"></label>
				<a href="/Mainbar/Product.jsp"><img src="./image/mainimg2.png"></a>
			</div>
		</li>
		<li class="slideitem">
			<div>
				<label for="slide02" class="left"></label>
				<label for="slide04" class="right"></label>
				<a href="/rboardlist.jsp"><img src="./image/mainimg3.png"></a>
			</div>
		</li>
		<li class="slideitem">
			<div>
				<label for="slide03" class="left"></label>
				<label for="slide01" class="right"></label>
				<a href="/Mainbar/Exhibition.jsp"><img src="./image/mainimg4.png"></a>
			</div>
		</li>
	</ul>
</div>

<br><br><br>

<!--날씨-->
<script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <% 
        Class.forName("com.mysql.cj.jdbc.Driver");  //Driver 클래스를 jvm 메모리에 로딩
        Connection conn =null; //데이터베이스 접속을 위한 객체
        Statement stmt =null; // SQL 명령문 전달을 위한 객체
        ResultSet rs =null; // SQL 명령문 실행을 위한 객체
        PreparedStatement pstmt = null; // SQL 명령문 전달을 위한 객체
        try {
            //JDBS와 연결을 위한 데이터                 
            String jdbcDriver ="jdbc:mysql://localhost:3306/TestDB?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8&serverTimezone=UTC";
            String dbUser ="tester"; //mysql 아이디
            String dbPass ="1234"; //mysql 비밀번호
            String query ="select * from user"; //SQL 명령문
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // SQL 명령문에 데이터 입력

            stmt = conn.createStatement(); // 데이터베이스로 SQL 문을 보내기 위한 개체를 생성
            rs = stmt.executeQuery(query); //SQL문 실행
            while(rs.next()) {
         %>

        <% 
        String getAddress = null; // 주소 데이터 저장할 변수
        %>
        <script>
        var addressID="1835847";
        var addressName="";
        </script>
        <%
        String sql = "SELECT * FROM user WHERE ID=?";
        pstmt = conn.prepareStatement(sql);       
        pstmt.setString(1,sessionid); 
        rs = pstmt.executeQuery();
        String[] splitAddress;
        if(rs.next()){ //데이터베이스에 이미 존재하는 데이터일 경우
			if(rs.getString("Address") != null){
				getAddress = rs.getString("Address"); //주소 데이터 가져옴
		   	    splitAddress = getAddress.split("\\s+"); //주소를 스페이스바 단위로 
				   if(splitAddress[0].equals("부산광역시")){ 
					%>
					<script>addressID ="1838524"; addressName = "부산광역시";</script>
					<%
				   }
				   else if(splitAddress[0].equals("대구광역시")){ 
					%>
					<script>addressID ="1835327"; addressName = "대구광역시";</script>
					<%
				   }
				   else if(splitAddress[0].equals("대전광역시")){
					%>
					<script>addressID ="1835235"; addressName = "대전광역시";</script>
					<%
				   }
				   else if(splitAddress[0].equals("인천광역시")){ 
					%>
					<script>addressID ="1843561"; addressName = "인천광역시";</script>
					<%
				   }
				   else if(splitAddress[0].equals("광주광역시")){ 
					%>
					<script>addressID ="1841811"; addressName = "광주광역시";</script>
					<%
				   }
				   else if(splitAddress[0].equals("울산광역시")){
					%>
					<script>addressID ="1833747"; addressName = "울산광역시";</script>
					<%
				   }
				   else{ //서울특별시
					%>
					<script>addressID ="1835847"; addressName = "서울특별시";</script>
					<%
				   }
				}
				
				%>
			}


        <%
		}
            }
        } catch(SQLException ex) { //오류 검출
            out.println(ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
            if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
            if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
        }
        %>

	<!-- Open Weather을 이용한 날씨 정보-->
	<script>
		var $x = document.createElement("IMG");
        
		$.getJSON("http://api.openweathermap.org/data/2.5/forecast?APPID=585b07845acf5ad33eb46532f8b54809&units=metric&id="+addressID
				,function(data){
			//var $minTemp = data.list[0].main.temp_min;
			//var $maxTemp = data.list[0].main.temp_max;
			//var $humidity = data.list[0].main.humidity;
			var $type = data.list[0].weather[0].description;
			var $sky = data.list[0].weather[0].main;
            var $text = null;
            var $address = addressName;
			//var $probability = data.list[0].clouds.all;
			
			if($sky == "Clouds") {
				$type = "구름"
				$x.setAttribute("src", "./image/cloud.png");
                $x.setAttribute("width", "30");
                $x.setAttribute("height", "30");
				$text = "가구 사이의 통풍이 잘 되도록 거리를 확보해주세요!"
			}
			else if($sky == "Rain"){
				$type = "비";
				$x.setAttribute("src", "./image/rain.png");
                $x.setAttribute("width", "30");
                $x.setAttribute("height", "30");
                $text = "원목가구 습도 조절에 유의하세요!";
			}
			else{
				$type = "맑음";
				$x.setAttribute("src", "./image/sun.png");
                $x.setAttribute("width", "30");
                $x.setAttribute("height", "30");
                $text = "원목가구 햇빛 직사광선을 피하세요!";
			}
			
			//$('.clowtemp').append($minTemp + "°C");
			//$('.chightemp').append($maxTemp + "°C");
			//$('.chumidity').append($humidity + "%");
            $('.caddress').append($address);
			$('.csky').append($sky);
			$('.ctype').append($type).append($x);
            $('.ctext').append($text);
			//$('.cprobability').append($probability + "%");	
		});

	</script>
	<!--<div class="cprobability">강수확률: </div>-->
	
	<div id="weather">  
		<div class="caddress"></div>
		<div class="ctype">오늘의 날씨: </div>
		<div class="ctext"></div>
	</div>
    
    
	<!--<div class="csky">하늘상태: </div>
	<div class="chumidity">습도: </div>
	<div class="chightemp">낮 최고기온: </div>
	<div class="clowtemp">아침 최저기온: </div>-->



<!--오늘의 베스트 제품-->
<div style ="text-align:center;">
    <h3>BEST ITEMS</h3><h5>주목하는 오늘의 베스트</h5>
</div><br>


<div style ="text-align:center;">
<%
    String[] popcode = new String[3];
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    try {
        String jdbcDriver ="jdbc:mysql://localhost:3306/OrderDB?serverTimezone=UTC"; 
        String dbUser ="Padmin"; //mysql id
        String dbPass ="24"; //mysql password
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        pstmt = conn.prepareStatement("select p.pcode, p.pimage, sum(o.amount) from OrderDB.OrderTable as o, ProductDB.ProductTable as p where o.pcode = p.pcode group by p.pcode, p.pimage order by sum(o.amount) desc");
        rs = pstmt.executeQuery();
	    for(int i=0;i<3;i++){
		rs.next();
		popcode[i] = rs.getString("pcode");
		String img = rs.getString("pimage");
        %>

        	<a href="shopdetail.jsp?pcode=<%= popcode[i] %>">
            	<img src= "<%= img %>" style="width: 200px; height: 200px; top: 1050px;">
        	</a>

		<%}
    }
    catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        // Close Statement
        if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
        // Close Connection
        if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</div>
<br><Br><Br>
        

<!-- 카카오톡 실시간 상담 -->
	<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
	<img class="kakaoChat" src="/image/kakaotalk.png" alt="카카오톡투명로고" style="border: 0;"></a>

<!--실시간 상담-->
    	<a href = "chat.jsp" onclick="window.open(this.href,'팝업창','width=500,height=700'); return false;">
		<img class="live_chat" src="/image/live_chat.png"  alt="실시간 상담" style="border: 0;"></a>
<!--상단바-->
		<div class="box__top box__top--visible" data-montelena-acode="200003793">
			<a href="" class="link__top">
				<span class="sprite__common">Top으로 이동</span>
			</a>
		</div>


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
<script language="JavaScript">
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");
	
		var $bannerWidth = $banner.children().outerWidth(); //이미지의 폭
		var $bannerHeight = $banner.children().outerHeight();  // 높이
		var $length = $banner.children().length; //이미지의 갯수
		var rollingId;
	
		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 5000); //다음 이미지 넘어가는 시간차
		
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			$banner.animate({left: - $bannerWidth + "px"}, 2000, function() { 
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>"); //첫번째 이미지를 마지막 끝에 복사해서 추가 (이동 X)
				$(this).find("li:first").remove(); //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제
				$(this).css("left", 0); //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
			});
		}
	}); 
</script>
</html>