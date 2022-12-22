<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<head>
  <title>회원 정보 수정</title>
  <link href="/Mainbar/CommunityBar/css/btn.css" rel="stylesheet" type="text/css">
  <link href="/Mainbar/CommunityBar/css/Upbar.css" rel="stylesheet" type="text/css">
  <link href="/Mainbar/CommunityBar/css/BSbar.css" rel="stylesheet" type="text/css">
    <%@ page contentType ="text/html; charset=utf-8" %>
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
        <style media="screen">
              * {margin: 0; padding: 0;}
              #sign_up_box{
                width:600px;
                height:450px;
                border:solid 2px brown;
                position: absolute;
                left: 50%; top: 30%;
                margin-left: -300px;
                margin-top: -100px;
                background-color: white;
                border-radius: 10px;
              }
              #sign_up_button{
                position: absolute;
                left: 40%; top: 80%;
              }
                #back{
                width: 80px;
                height: 40px;
                border-radius: 5px;
                position: absolute;
                left: 50%; top: 50%;
                margin-left: 100px;
                margin-top: 30px;
              }
        </style>
</head>
<body>
  <script>
      request.setCharacterEncoding("utf-8")
  </script>
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

  <script> 
    function submit3(frm) { 
      frm.action='deleteID.jsp'; 
      frm.submit(); 
      return true; 
    } 
  </script> 

    <html>
      <% 
          String pw = null;
          String name = null;
          String address = null;
          String phone = null;
          String sex = null;
          String birth = null;

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
        sessionid = (String)session.getAttribute("id");
        String sql = "SELECT * FROM user WHERE ID=?"; //SQL 명령문
        pstmt = conn.prepareStatement(sql);  //SQL 명령문 전송(데이터 X)
        pstmt.setString(1,sessionid); //SQL 명령문에 값 입력
        rs = pstmt.executeQuery(); //SQL 명령문 실행(데이터 O)

        if(rs.next()){ // 입력받은 ID와 일치하는 곳에 커서를 위치시킴
            pw = rs.getString("Passwd");
            name = rs.getString("Name");
            address = rs.getString("Address");
            phone = rs.getString("Phone");
            sex = rs.getString("Sex");
            birth = rs.getString("Birth");
            
        }
            
        
        
        %>
        <%
            }
        } catch(SQLException ex) { //오류검출
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


        <div id="sign_up_box">
            <br>
            &nbsp<h3>기본정보</h3>
            <br>
          <form action="modifyCheck.jsp" name="form" id="form" method="post">
            &nbsp 아이디: <input type="text" name="id" placeholder="이메일 주소" value="<%= sessionid %>" readonly><br>
            &nbsp 비밀번호: <input type="text" name="pw" value="<%=pw%>" required><br>
            &nbsp 이름: <input type="text" name="name" placeholder="ex)홍길동" value="<%=name%>" required><br>
            &nbsp  주소: <input type="text" id="roadFullAddr" name="roadFullAddr" style="width: 300px;" value="<%=address%>" required>
            <input type="button" onClick="goPopup();" value="팝업"><br>

            &nbsp  전화번호: <select name="phone1" style="width:50px">
            <option value="" disabled hidden selected>선택</option>  
            <option value="010">010</option>
            <option value="051">051</option>
            <option value="02">02</option>
            <option value="011">011</option>
          </select>
          - 
          <input type="text" name="phone2" style="width:40px" maxlength='4' required> -
          <input type="text" name="phone3" style="width:40px" maxlength='4' required>
          <br><br>
          &nbsp<h3>추가정보</h3>
          <br>
          &nbsp  성별: <select name="sex">
                          <option value="" disabled hidden selected>선택</option>
                          <option value="M">남자</option>
                          <option value="W">여자</option>
                       </select>
                       <br>
          &nbsp  생년월일: <input type="date" id="birth" name="birth" value="">
          <br><br><br><br>
          
          <center><input type="submit" value="변경"> <button type="button" value="기존 회원탈퇴" onclick="return submit3(this.form);">기존 회원탈퇴</button></center>
          
        </form>
          </div>
          <!--하단바-->

  </body>
</html>

          
          

