<%@ page import ="java.sql.*" %>


<%

//여긴 앞에 파일
<form action="DB처리해줄 파일 경로" method="get">   //get 하던지 post하던지, 쉬운건 get //구글 치면 넘기는 법, 받는 법 나온다.
        <input type="text" name="search">
        <button type="submit" value="제출"></button>
</form>

//여긴 뒤에 파일 부터
//예를 들어 앞에 파일에서 
//String search = request.getParameter("search");

Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null; 
        try {

            String jdbcDriver ="jdbc:mysql://localhost:3306/여기 너네 database이름?serverTimezone=UTC"; 
            String dbUser ="권한 부여한 mysql id"; //mysql id
            String dbPass ="비밀번호"; //mysql password
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

            pstmt = conn.prepareStatement("select * from ProductTable where pcode = ?");    //큰따옴표 안에 하고싶은 sql문      //물음표는 여러개 가능
            pstmt.setString(1, search);        //여긴 ?가 변수로 입력할 거   //14줄 변수 말하는거야  //1은 물음표 순서 
            pstmt.setString(2, 변수);           //물음표 개수대로 
            rs = pstmt.executeQuery();          //업데이트 삭제는 요거 아니고 update쿼리인가 딴거 써야돼 구글 검색 ㄱㄱ
            rs.next();                          //sql문 실행해서 나오는 첫번째 줄           //여러줄 나오면 while문으로 감싸거나 for문 감싸서 하면 된다

            //ex
            //while(rs.next()){

                %>              //요거 ㅈㄴ 중요
            //     출력할 내용들                    //참고로 출력하고 싶으면 글자나 테이블 태그 쓰거나 할때는 위아래 <% %> 이거 잘 닫고 열고 해야해     // 요 태그가 자바 코드쓸때는 <% %> 안에 적는거고 //일반 폼 태그 쓸땐 항상 닫고 적고 열고
                <%if            //요거 ㅈㄴ 중요

            //}
    }       
    //여긴 건들지 마
        catch(SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
         } finally {
            if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
        }
%>