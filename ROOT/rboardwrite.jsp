<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<head>
  <link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
  <link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
  <link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
</head>
<script language = "javascript">  // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>24게시판</title>
 </head>
 <body>
  <%String sessionid = (String)session.getAttribute("id");
  if(sessionid == null){
    %>
<script>alert("회원 전용 기능입니다.")</script>
<script type="text/javascript">
location.href="index.jsp";
</script>

<%
}

%>
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
  <center>
<table>
<form name=writeform method=post action="rboardwrite_ok.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('image/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="image/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="image/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" name="password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="52" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
    </tr>
    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">재구매여부</td>
      <td><input type="checkbox" value="1" name="review_buy_opt" checked="checked" ></td>
      <td>&nbsp;</td>
     </tr>
    </tr>
    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">별점</td>
      <td>
        <input type="radio" name="review_star" value="1" checked="checked">★☆☆☆☆
        <input type="radio" name="review_star" value="2">★★☆☆☆
        <input type="radio" name="review_star" value="3">★★★☆☆
        <input type="radio" name="review_star" value="4">★★★★☆
        <input type="radio" name="review_star" value="5">★★★★★
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
 </center>

<!-- 카카오톡 실시간 상담 -->
<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
	<img class="kakaoChat" src="/image/kakaotalk.png" alt="카카오톡투명로고"/></a>

<!--실시간 상담-->
    	<a href = "chat.jsp" onclick="window.open(this.href,'팝업창','width=500,height=700'); return false;">
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
</body>
 </html>