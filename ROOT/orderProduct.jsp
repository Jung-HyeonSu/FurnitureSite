<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>

<html>
    <head>
        <title>장바구니</title>
        
    </head>

    <body>

        

            <%
            
            String[] OrderCheck = request.getParameterValues("orderCheck");

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

                for(int i=0; i<OrderCheck.length; i++){
                    pstmt = conn.prepareStatement("UPDATE OrderTable SET PayOrNot = True WHERE OrderNum = (?)");
                    pstmt.setString(1, OrderCheck[i]);
                    int r = pstmt.executeUpdate(); 
                }
                %>
                <script>alert("결제 완료");</script>
                <%
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
               document.location.href = "ShoppingBag.jsp";
           </script>
        

    </body>
</html>



