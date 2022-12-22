<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>

<html>
    <head>
        <title>장바구니</title>
        
    </head>

    <body>
            <%       
            String[] qnaCheck = request.getParameterValues("qnaCheck");

             // MySQL JDBC Driver Loading
             Class.forName("com.mysql.cj.jdbc.Driver"); 
             Connection conn =null;
             PreparedStatement pstmt =null;
             ResultSet rs =null; 
             try {
                 String jdbcDriver ="jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC";
                 String dbUser ="Padmin"; //mysql 아이디
                 String dbPass ="24"; //mysql 비밀번호
                 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // SQL 명령문에 데이터 입력

                for(int i=0; i<qnaCheck.length; i++){
                    String sql = "DELETE FROM board WHERE NUM=?"; // 테이블에서 데이터를 삭제하는 명령문
                    pstmt = conn.prepareStatement(sql); //SQL 명령문 전송(데이터 X) 
                    pstmt.setString(1,qnaCheck[i]);  //SQL 명령문에 값 입력
                    pstmt.executeUpdate(); //SQL 명령문 실행(데이터 O)
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

           <script>
               alert("게시글 삭제 완료.");
               document.location.href = "managementQnA.jsp";
           </script>
        

    </body>
</html>



