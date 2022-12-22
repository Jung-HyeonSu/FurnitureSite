<!DOCTYPE html>
<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<head>
</head>
<body>
        <% 
            Class.forName("com.mysql.cj.jdbc.Driver");  //Driver 클래스를 jvm 메모리에 로딩
            Connection conn =null; //데이터베이스 접속을 위한 객체
            Statement stmt =null; // SQL 명령문 전달을 위한 객체
            ResultSet rs =null; // SQL 명령문 실행을 위한 객체
            PreparedStatement pstmt = null; // SQL 명령문 전달을 위한 객체
            try {
                //JDBS와 연결을 위한 데이터                 
                String jdbcDriver ="jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC"; 
                String dbUser ="tester"; //mysql 아이디
                String dbPass ="1234"; //mysql 비밀번호
                String query ="select * from user"; //SQL 명령문
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // SQL 명령문에 데이터 입력

                stmt = conn.createStatement(); // 데이터베이스로 SQL 문을 보내기 위한 개체를 생성
                rs = stmt.executeQuery(query); //SQL문 실행
                while(rs.next()) {
         %>

        <% 
        // index.html에서 입력받은 데이터를 String에 저장
        String id = request.getParameter("id"); 
        String pw = request.getParameter("pw");
        
        String sql = "SELECT * FROM user WHERE ID=?"; //SQL 명령문
        pstmt = conn.prepareStatement(sql);  //SQL 명령문 전송(데이터 X)
        pstmt.setString(1,id); //SQL 명령문에 값 입력
        rs = pstmt.executeQuery(); //SQL 명령문 실행(데이터 O)

        if(rs.next()){ // 입력받은 ID와 일치하는 곳에 커서를 위치시킴
            if(pw.equals(rs.getString("Passwd"))){ //비밀번호가 같은지 비교하여 같을 경우
                session.setAttribute("id", id);
                session.setMaxInactiveInterval(6000);
                response.sendRedirect("main.jsp");
            }
            else{ // 비밀번호가 다를 경우
                %>
                <script>alert("로그인 실패")</script>
                <script>history.back();</script>
                <%
            }
        }
        else{ // 데이터베이스에 없는 값일 경우
            %>
            <script>alert("로그인 실패")</script>
            <script>history.back();</script>
            <%
        }
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
</body>