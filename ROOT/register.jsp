<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<head>
    <script language="javascript">
        function goPopup(){
        var pop = window.open("jusopopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        }
        function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, 
        rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, 
        buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
         // 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
         document.form.roadFullAddr.value = roadFullAddr;
         document.form.roadAddrPart1.value = roadAddrPart1;
         documentform.addrDetail.value = addrDetail;
         document.form.zipNo.value = zipNo;
        }

        </script>
                <link href="/Mainbar/CommunityBar/css/btn.css?after" rel="stylesheet" type="text/css">
                <link href="/Mainbar/CommunityBar/css/Upbar.css?after" rel="stylesheet" type="text/css">
                <link href="/Mainbar/CommunityBar/css/BSbar.css?after" rel="stylesheet" type="text/css">
        <style media="screen">
          
              td{
                text-align: center;
                vertical-align: middle;
              }
              table{
                border: 1px lightgray solid;
                margin-left: auto; 
                margin-right: auto;
                width:500px;
                height:500px;
                text-align: center;
              }
            
             .register1{
            width: 100px; 
            height:60px; 
            color: white; 
            font-weight: bold; 
            font-size: 15px;
            border: 0px;
            background-color: gray;
        }
        .register1:hover{
            background-color: orange;
        }
        .register2{
            width: 100px; 
            height:60px; 
            color: white; 
            font-weight: bold; 
            font-size: 15px;
            border: 0px;
            background-color: blue;
        }
        .register2:hover{
            background-color: orange;
        }
        .juso{
          height : 22px;
          background-color: lightgray;
          border: 0px;
        }
        .juso:hover{
          background-color: orange;
        }
        *{
          vertical-align: middle;
        }
        input option select button{
          border: lightgray 1px solid;
          color: lightgray;
        }
        input:hover{
          border: blue 1px solid;
        }
        </style>
</head>
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
    <html>
            <br><br><Br> <br><br><Br>

            <table>
              <form action="registerCheck.jsp" name="form" id="form" method="post" >
              <tr>
              <Td colspan="3">
                <br><br><center><h3>회원가입</h3></center><br><br>
              </Td>
              </tr>
            <tr>
              <td colspan="2" style="text-align: left; vertical-align: bottom;">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp아이디 
              </td>
            </tr>
              <td colspan="2">
                <input style="width:300px; height:50px;" type="text" name="id" placeholder="이메일 주소" required></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align: left; vertical-align: bottom;">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp비밀번호
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <input style="width:300px; height:50px;" type="password" name="pw" required placeholder="비밀번호">
              </td>
            </tr>
              <tr>
                <td colspan="2" style="text-align: left; vertical-align: bottom;">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp비밀번호 확인 
              </td>
              </tr>
              <tr>
               <td colspan="2">
                 <input style="width:300px; height:50px;" type="password" name="pw_ok" required placeholder="비밀번호 확인">
                </td>
              </tr>
             <tr>
              <td colspan="2" style="text-align: left; vertical-align: bottom;">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 이름 
               </td>
             </tr>
             <tr>
               <td colspan="2">
                 <input style="width:300px; height:50px;" type="text" name="name" placeholder="ex)홍길동" required>
               </td>
             </tr>
             <tr>
                <td colspan="2" style="text-align: left; vertical-align: bottom;">
                 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 주소
                </td>
             </tr>
              <tr> 
               <td style="text-align:right; width:70%">
                 <input style="width: 247.5px; height:50px;" type="text" id="roadFullAddr" name="roadFullAddr" style="width: 300px;" placeholder="주소를 입력하시오.">
               </td>
                <td style="text-align:left">
                  &nbsp
                 <input style="width: 60px; height:50px;" type="button" class="juso" onClick="goPopup();" value="주소">
              </td>
             </tr>
             <tr>
              <td colspan="2" style="text-align: left; vertical-align: bottom;">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 전화번호
                </td>
             </tr>
             <tr>
               <td colspan="2">
                    <select style="width: 88px;; height:50px;" name="phone1" style="width:50px">
                    <option style="color: lightgray;" value="" disabled hidden selected>선택</option>  
                    <option value="010" selected>010</option>
                    <option value="051">051</option>
                    <option value="02">02</option>
                    <option value="011">011</option>
                    </select>
                  - 
                    <input style="width: 88px;; height:50px;" type="text" name="phone2" style="width:40px" maxlength='4' required placeholder="XXXX"> - 
                    <input style="width: 88px;; height:50px;" type="text" name="phone3" style="width:40px" maxlength='4'required placeholder="XXXX">
                  </td>
            </tr>
             <tr>
              <td colspan="2" style="text-align: left; vertical-align: bottom;">
               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 성별
              </td>
            </tr>
            <tr>
               <td colspan="2">
                <select style="width:300px; height:50px;" name="sex">
                <option style="color:lightgray" value="" disabled hidden selected>선택</option>
                <option value="M">남자</option>
                <option value="W">여자</option>
                           </select>
                </td>
             </tr>
             <tr>
              <td colspan="2" style="text-align: left; vertical-align: bottom;">
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 생년월일
             </td>
             </tr>
             <tr>
              <td colspan="2">
                <input style="width:300px; height:50px;" type="date" id="birth" name="birth" value="">
              </td>
             </tr>
             <tr>
                <Td colspan="2" style="text-align: center; ">
                  <br><br>
                  <A href="index.jsp">
                  <input class="register1" type="button" value="뒤로가기"></A>
                  <input class="register2" type="submit" value="회원가입">
               </Td>
            </tr>
            <tr></tr>
            </form>
        </table>
          <br><br><br><br><br><br>
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

