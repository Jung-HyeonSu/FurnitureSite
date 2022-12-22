<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>

<html>
    <head>
        <title>결제목록</title>
        <link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
        <link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
        <link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
    </head>

    <body>

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


        <br><br><br><br>
        <table width="100%" border="1">
            <title>결제 목록</title>
                <style>
                    table{
                        width:700px;
                        height:200px;
                        margin: auto;
                    }
                    td{
                        text-align: center;
                    }
                </style>

            <%

             // MySQL JDBC Driver Loading
             Class.forName("com.mysql.cj.jdbc.Driver"); 
             Connection conn =null;
             PreparedStatement pstmt =null;
             ResultSet rs =null; 
             try {
                                             
                 String jdbcDriver ="jdbc:mysql://localhost:3306/OrderDB?serverTimezone=UTC"; 
                 String dbUser ="Padmin"; //mysql id
                 String dbPass ="24"; //mysql password
                 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

                pstmt = conn.prepareStatement("select * from ProductDB.ProductTable as P, OrderDB.OrderTable as O where P.pcode = O.pcode and PayOrNot = true and ID = (?) order by OrderNum ASC");
                pstmt.setString(1, sessionid);
                rs = pstmt.executeQuery();

                %>
                
                
                <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>제품코드</th>
                        <th>제품명</th>
                        <th>이미지</th>
                        <th>선택한 수량</th>
                        <th>총 금액</th>
                    </tr>
                </thead>
                <tbody>

                <%

                while(rs.next()){
                    
                    int a = Integer.parseInt(rs.getString("price"));
                    int b = Integer.parseInt(rs.getString("amount"));
                    
                %>
                
                

                <tr>
                    <td><%= rs.getString("OrderNum") %></td>
                    <td><%= rs.getString("pcode") %></td>
                    <td>
                        <a href="../shopdetail.jsp?pcode=<%= rs.getString("pcode") %>">
    
                            <%= rs.getString("pname") %>
                        </a>
                    </td>
    
                    <% String img = rs.getString("pimage"); %>
                    <td><img src= "<%= img %>" width="100"/></td>
                    <td><%= rs.getString("amount") %></td>
                    <td><%= a * b %></td>
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
                 if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
                 // Close Connection
                 if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
             }

           %>
           
            </tbody>
            </table>
        </form>
        <br><br>

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
<Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br><Br>
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