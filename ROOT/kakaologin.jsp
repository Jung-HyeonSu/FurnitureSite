<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
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
        // register.jsp에서 입력받은 데이터를 String에 저장
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        if(sex.equals("male")){
                sex = "M";
        }
        else{
                sex = "W";
        }
        String birth = request.getParameter("birth");
        String type = "kakao";
        String address = "서울특별시";
        String sql = "SELECT * FROM user WHERE ID=?"; //SQL 명령문
        pstmt = conn.prepareStatement(sql); //SQL 명령문 전송(데이터 X)        
        pstmt.setString(1,id);  //SQL 명령문에 값 입력
        rs = pstmt.executeQuery();  //SQL 명령문 실행(데이터 O)

        if(rs.next()){ //데이터베이스에 이미 존재하는 데이터일 경우
                session.setAttribute("id", id);%>
                <script>window.location.href='main.jsp'</script>
                <%
        }
        else { //신규회원일 경우
            String sql2 = "insert into user(ID, Name, Sex, Birth, Type, Address) values(?,?,?,?,?,?)"; //SQL 명령문
            pstmt = conn.prepareStatement(sql2); //SQL 명령문 전송(데이터 X) 
            pstmt.setString(1,id); //SQL 명령문에 값 입력
            pstmt.setString(2,name);
            pstmt.setString(3,sex);
            pstmt.setString(4,birth);
            pstmt.setString(5,type);
            pstmt.setString(6,address);
            pstmt.executeUpdate();%>
            session.setAttribute("id", id);%>
            <script>alert('카카오 간편 가입 성공'+name);</script>
            <script>window.location.href='index.jsp'</script>
            <%
        }
        %>
        
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