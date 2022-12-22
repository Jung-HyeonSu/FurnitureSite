<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
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
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String address = request.getParameter("roadFullAddr");
        String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birth");
        String sql = "SELECT * FROM user WHERE ID=?"; //SQL 명령문
        pstmt = conn.prepareStatement(sql); //SQL 명령문 전송(데이터 X) 
        pstmt.setString(1,id);  //SQL 명령문에 값 입력
        rs = pstmt.executeQuery();  //SQL 명령문 실행(데이터 O)

        if(rs.next()){ //데이터베이스에 이미 존재하는 데이터일 경우
            String sql2 = "UPDATE user SET Passwd=?, Name=?, Address=?,Phone=?,Sex=?,Birth=? WHERE ID=?";
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1,pw);
                pstmt.setString(2,name);
                pstmt.setString(3,address);
                pstmt.setString(4,phone);
                pstmt.setString(5,sex);
                pstmt.setString(6,birth);
                pstmt.setString(7,id);
                pstmt.executeUpdate();
        }
        %>
        <script>
            alert('정보가 성공적으로 변경되었습니다.');
            location.href="main.jsp";
        </script>

        <%
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
</body>