<!DOCTYPE html>
<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.*" %>
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

        <% // index.html에서 입력받은 데이터를 String에 저장
        String id = request.getParameter("id"); 
        String pw = request.getParameter("pw");

        String sql = "SELECT * FROM user WHERE ID=?"; //SQL 명령문
        pstmt = conn.prepareStatement(sql);  //SQL 명령문 전송(데이터 X)
        pstmt.setString(1,id); //SQL 명령문에 값 입력
        rs = pstmt.executeQuery(); //SQL 명령문 실행(데이터 O)

        if(rs.next()){ // 입력받은 ID와 일치하는 곳에 커서를 위치시킴
            if(rs.getString("Type").equals("kakao")){
                String sql2 = "DELETE FROM user WHERE ID=?"; // 테이블에서 데이터를 삭제하는 명령문
                pstmt = conn.prepareStatement(sql2); //SQL 명령문 전송(데이터 X) 
                pstmt.setString(1,id);  //SQL 명령문에 값 입력
                pstmt.executeUpdate(); //SQL 명령문 실행(데이터 O)%>
                <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
                <script>
                window.Kakao.init('859ed74987eaed6f8cede7f7eca3f49e');    
                Kakao.API.request({
                    url: '/v1/user/unlink',
                    success: function(response) {
                        console.log(response);
                        //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                        window.location.href='/logout.jsp'
                    },
                    fail: function(error) {
                        console.log('탈퇴 미완료')
                        console.log(error);
                    },
                });
                </script>
                
            <%}
            else{
                if(pw.equals(rs.getString("Passwd"))){ //비밀번호가 같은지 비교하여 같을 경우
                    String sql3 = "DELETE FROM user WHERE ID=?"; // 테이블에서 데이터를 삭제하는 명령문
                    pstmt = conn.prepareStatement(sql3); //SQL 명령문 전송(데이터 X) 
                    pstmt.setString(1,id);  //SQL 명령문에 값 입력
                    pstmt.executeUpdate(); //SQL 명령문 실행(데이터 O)
                    %>
                    <script>
                        alert("회원 탈퇴 완료");
                        document.location.href = "logout.jsp";
                    </script><%
                }
                else{ // 비밀번호가 다를 경우
                    %><script>
                        alert("비밀번호를 확인해주세요");
                        document.location.href = "modify.jsp";
                    </script><%
                }
            }
            
        }
        else { // 데이터베이스에 없는 값일 경우
            %><script>
                alert("가입되지 않은 아이디입니다.");
                document.location.href = "modify.jsp";
            </script><%
        }
        %>
       
        <%
            }
        } catch(SQLException ex) {
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