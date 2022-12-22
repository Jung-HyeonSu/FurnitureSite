<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
	<link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
	<link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
<meta charset="utf-8" />
<title>24 Community</title>
<style type="text/css"> /* CSS 부분 */

    /* 카테고리 부분*/
    * {
		margin: 0;
		padding: 0;
	}

    ul li{ /*ul li 태그 리스트 스타일 제거*/
		list-style: none;
	}

    a { /*a태그에 텍스트 밑줄 없애고 색상 지정*/
		text-decoration: none;
		color:rgb(255, 255, 255);
	}
    #menu { /*메뉴 설정*/
		font:bold 16px "malgun gothic";
		line-height: 50px; 
		text-align: center;
        position: fixed;
	    top: 0;
	    background-color: rgba(0, 0, 0, 0.8);
	    -webkit-backdrop-filter: blur(8px);
  	    backdrop-filter: blur(8px);
	    z-index: 999;
	    height: 3rem;
	    width: 100%;
        -webkit-backdrop-filter: blur(8px);
        backdrop-filter: blur(8px);
        padding-left: 10%;
	}

    #menu > ul > li { /*메뉴 태그 자식 설정*/
		float:left;
		width:200px;
		position:relative;
	}

    #menu > ul > li > ul { /*하위 메뉴가 보이지 않도록 설정*/
		width:200px;
		display:none;
		position: absolute;
		font-size:14px;
		background: rgb(88, 88, 88);
	}

    #menu > ul > li:hover > ul { /*마우스를 올릴 시 보이도록 */
		display:block;
	}

    #menu > ul > li > ul > li:hover { /*리스트 커서 위치시 색깔*/
		background: rgb(30, 109, 56);
		transition: ease 1s;
	}



     /* 검색 부분*/
    .search {
        margin: auto;
        position: relative;
        width: 1200px;
    }

    input {
        width: 100%;
        border: 1px solid #bbb;
        border-radius: 8px;
        padding: 10px 12px;
        font-size: 14px;
    }
    #img {
        position : absolute;
        width: 17px;
        top: 10px;
        right: 12px;
        margin: 0;
    }
    

    </style>

</head>
<body>
    
/*--------------------------------------------------------------------HTML--------------------------------------------------------*/
<!-- 카테고리 -->

<div id="menu">
	<ul>
        <li><a href="../main.jsp">메인</a>
		</li>
		<li><a href="/Mainbar/Introduce.html">소개</a>
		</li>
		<li><a href="/Mainbar/Product.html">제품</a>
		</li>
		<li><a href="/Mainbar/Community.html">커뮤니티</a>
			<ul>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">Q & A</a></li>
			</ul>
		</li>
		<li><a href="/Mainbar/CustomerSupport.html">고객지원</a>
			<ul>
                <li><a href="#">간편문의</a></li>
				<li><a href="#">카카오톡 상담</a></li>
				<li><a href="#">실시간 상담</a></li>
			</ul>
		</li>
		<li><a href="/Mainbar/Exhibition.html">전시회</a></li>
        <li><a href="../index.html">로그인</a></li>
        <li><a href="#">장바구니</a></li>

	</ul>
</div>
 
<br><br><br>


<h1>product list</h1>

<%
	session = request.getSession();

    if(session.getAttribute("userSession") != null){
    	out.print("userSession name : " + session.getAttribute("userSession") + "<br>");
    }
    
    
    if(session.getAttribute("id") != null){
    	out.print("방금본 상품 <br>");
    	out.print("아이디 : " + session.getAttribute("id") + "<br>");
    	out.print("상품명 : " + session.getAttribute("prodName") + "<br>");
    }
%>
<!--상품리스트 페이지에 세션객체를 가져와서 컨트롤러에서 넣어준 
내가 방금 본상품이 무엇인지를 찾는다. prodId가 있으면 내가 방금 본 
상품이 있다는 뜻이므로 방금 본 상품을 보여주고, 없으면 안보여준다. 
그리고 아래 아이폰12와 맥북 프로 m1 상품을 올려놓았다. 
해당 상품 url을 누르면 상품 상세 페이지로 이동한다.--> 

<br>
<a href="/product?name=ipone12&id=i1">ipone12</a>
<a href="/product?name=macbookpro&id=i2">macbookpro</a>

<h1>product detail</h1>

<%
	session = request.getSession();
    if(session.getAttribute("main.jsp") != null){
    	out.print("session name : " + session.getAttribute("main.jsp") + "<br>");
    }
%>

<br>

<h4>  상품 id  : ${prodId} </h4>
<h4>  이름 :  ${prodName} </h4>
<!--컨트롤러에서 넘겨받은 상품의 id와 상품이름을 보여준다.-->


</body>
</html>