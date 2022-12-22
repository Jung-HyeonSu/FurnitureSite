<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>

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
			};
			


    

    </style>

			
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





<style>
	input {
		width: 100%;
		border: 1px solid rgb(73, 73, 73);
		border-radius: 8px;
		padding: 10px 12px;
		font-size: 14px;
	}
	.search-field__search-icon {
		--icon-size: 1.5rem;
		position: absolute;
		inset-inline-start: 1px;
		inset-inline-end: auto;
		color: var(--colour-neutral-grey-900);
		pointer-events: none;
		opacity: 1;
		transition: transform .2s cubic-bezier(.4,0,.4,1),opacity .2s linear;
		transform: translateY(-50%);
	}
	.svg-icon {
		display: inline-block;
		vertical-align: -0.2em;
		pointer-events: none;
		fill: currentcolor;
	}
	.btn{
		background-color: #19ce6100;
		position: absolute;
		margin-top: 0.5%;
		inset-inline-start: 27%;
		width: 26px;
		height: 26px;
		border: 0px;
		position:absolute;
	}
	
	</style>


<style>
    * {
        -webkit-tap-highlight-color: rgba(255,255,255,0);
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    blockquote, body, code, dd, div, dl, dt,
    fieldset, form, h1, h2, h3, h4, h5, h6, input,
    legend, li, ol, p, pre, td, textarea, th, ul {
        margin: 0;
        padding: 0;
    }
    h1, h2, h3, h4, h5, h6 {
        font-weight: inherit;
    }
    :-webkit-any(article, aside, nav, section) h1 {
        font-size: 1.5em;
        margin-block-start: 0.83em;
        margin-block-end: 0.83em;
    }
    h1 {
        display: block;
        font-size: 2em;
        margin-block-start: 0.67em;
        margin-block-end: 0.67em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        font-weight: bold;
    }
    a {
        color: inherit;
        text-decoration: none;
    }
    fieldset, img {
        border: 0;
    }
    .layout {
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-direction: normal;
        -webkit-box-orient: vertical;
        -webkit-flex-direction: column;
        -moz-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
    }
    .row {
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-wrap: wrap;
        -moz-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -5px;
        margin-left: -5px;
    }
    .container-full, .row {
        box-sizing: border-box;
    }
    .col-6 {
        position: relative;
        width: 100%;
        min-height: 1px;
        box-sizing: border-box;
        -webkit-box-flex: 0;
        -webkit-flex: 0 0 50%;
        -moz-box-flex: 0;
        -moz-flex: 0 0 50%;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 90%;
        padding-right: 5px;
        padding-left: 5px;
    }
    .production-item {
        position: relative;
        padding: 0 0 20px;
    }
        .production-item__overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 2;
    }
    [role=button], a, button, input[type=button], input[type=reset], input[type=submit] {
        cursor: pointer;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
    }
    .production-item-image {
        position: relative;
        background-color: #f5f5f5;
        padding-bottom: 100%;
        border-radius: 4px;
        overflow: hidden;
    }
    .production-item-image>.image {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 100%;
        transform: translate(-50%,-50%);
        transition: transform .2s;
    }
    .production-item-image__dark-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        transition: background-color .2s;
    }
    .production-item__content {
        padding: 0 4px;
    }
    .production-item__header {
        margin: 9px 0 0;
    }
    .production-item__header__name {
        display: block;
        max-height: 34px;
        margin-top: 5px;
        word-break: break-all;
        font-size: 17px;
        font-weight: 400;
        line-height: 17px;
        color: #000;
        transition: opacity .1s;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        word-wrap: break-word;
    }
    .production-item .production-item-price {
        margin: 2px 0 0;
    }
    .production-item-price {
        display: block;
        font-size: 17px;
        line-height: 23px;
        font-weight: 700;
    }
    .production-item-price__rate {
        color: #eb0000;
        margin-right: 2px;
    }
    .production-item-price__price {
        color: #000;
    }
    .production-item .production-item-badge-list {
        margin: 8px 0 0;
    }
    .production-item-badge-list {
        display: block;
    }
    .production-item-badge-list>.icon {
        margin-right: 4px;
    }
    .production-item__header__brand {
        display: block;
        color: #757575;
        word-break: break-all;
        font-size: 11px;
        font-weight: 400;
        line-height: 13px;
    }
</style>





	<form action="../search.jsp" method="get">
		<p align="center" style="padding-top:20px">
			<input type="text" name="search" placeholder="검색어 입력" style="width:50%;height:40px;text-align:center; background-color: #333333; font-size: 1rem; color: #c1c1c1;" >
				<button type="submit" value="검색" class="btn">
					<svg width="26" height="26" aria-hidden="true" class="svg-icon search-field__search-icon search-field__search-icon--show">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M13.98 15.395a6.294 6.294 0 111.414-1.414l4.602 4.601-1.414 1.414-4.602-4.601zm.607-5.101a4.294 4.294 0 11-8.587 0 4.294 4.294 0 018.587 0z" fill="#c1c1c1"></path>
					</svg>
				</button>
		</p>
	</form><br>

        <table width="100%" border="1">
           <title>제품 목록</title>
           <style>
               table{
                   width:700px;
                   height:200px;
                   margin: auto;
               }
               td{
                   text-align: -webkit-center;
               }
           </style>
            <% // MySQL JDBC Driver Loading
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                Connection conn =null;
                Statement stmt =null;
                ResultSet rs =null;
                try {
										
                    String jdbcDriver ="jdbc:mysql://localhost:3306/ProductDB?serverTimezone=UTC"; 
                    String dbUser ="Padmin"; //mysql id
                    String dbPass ="24"; //mysql password
                    String query ="select * from ProductTable order by pcode"; //query


                    // Create DB Connection
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);


                    // Create Statement
                    stmt = conn.createStatement();


                    // Run Qeury
                    rs = stmt.executeQuery(query);


                    // Print Result (Run by Query)
                    while(rs.next()) {
             %>
			<tr>
                <td>
					<div class="category-feed__content__item-wrap col-6 col-lg-4" style="float: none; margin:100 auto;">
						<article class="production-item" id="product-904374">
							<a class="production-item__overlay" href="../shopdetail.jsp?pcode=<%= rs.getString("pcode") %>"></a>
							<div class="production-item-image production-item__image">
								<% String img = rs.getString("pimage"); %>
								<img class="image" alt="" src="<%= img %>">
							</div>
							<div class="production-item__content">
								<h1 class="production-item__header">
									<span class="production-item__header__brand"><b>코드 - <%= rs.getString("pcode") %></b> </span>
									<span class="production-item__header__name"><strong><%= rs.getString("pname") %></strong></span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price__rate">10<span class="percentage">% </span>
								</span>
								<span class="production-item-price__price"><%= rs.getString("price") %></span>
							</span>
							<span class="production-item-badge-list">
								<svg class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd">
											<rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect>
											<path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path>
									</g>
								</svg>
							</span>
						</article>
					</div>
				</td>
            </tr>
            <%
                }
            }
            
            
            catch(SQLException ex) {
                out.println(ex.getMessage());
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
            }
            %>
        </table>


		<!-- 카카오톡 실시간 상담 -->
		<a href="http://pf.kakao.com/_yZatb/chat" target ="_blank">
		<img class="kakaoChat" src="/image/kakaotalk.png" alt="카카오톡투명로고"/></a>
		<!-- 카카오톡 실시간 상담 -->
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
<br>
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