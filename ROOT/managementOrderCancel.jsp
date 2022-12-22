<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>

<html>
    <head>
        <title>주문 취소</title>
        
    </head>

    <body>

        

            <%
            String[] OrderCancel = request.getParameterValues("OrderCancel");

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


                for(int i=0; i<OrderCancel.length; i++){
                    pstmt = conn.prepareStatement("update OrderTable set PayOrNot = false where OrderNum = (?);");
                    pstmt.setString(1, OrderCancel[i]);
                    int r = pstmt.executeUpdate(); 
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
               alert("주문 취소 완료.");
               document.location.href = "managementPayProduct.jsp";
           </script>
        

    </body>
</html>



