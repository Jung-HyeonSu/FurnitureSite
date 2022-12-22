<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>

<html>
    <body>
        
		<% 
		
        String sessionid = (String)session.getAttribute("id");

        if(sessionid == null){
            %>
    <script>alert("회원 전용 기능입니다.")</script>
    <script type="text/javascript">
    location.href="index.jsp";
    </script>
    
    <%
    }
    
        String s_pcode = request.getParameter("s_pcode");
        String amount = request.getParameter("amount");    

    
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection conn =null;
        PreparedStatement pstmt =null;       
        ResultSet rs =null; 
        try {							
        	String jdbcDriver ="jdbc:mysql://localhost:3306/OrderDB?serverTimezone=UTC"; 
            String dbUser ="Padmin"; //mysql id
            String dbPass ="24"; //mysql password
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);


            pstmt = conn.prepareStatement("SELECT MAX(cast(OrderNum as unsigned)) FROM OrderTable");
            rs = pstmt.executeQuery();
            rs.next();
            int a = Integer.parseInt(rs.getString("MAX(cast(OrderNum as unsigned))")) + 1;
            String b = Integer.toString(a);

            

            
            pstmt = conn.prepareStatement("insert into OrderTable values (?, ?, ?, ?, false)");
		    pstmt.setString(1, sessionid);
            pstmt.setString(2, s_pcode);
            pstmt.setString(3, amount);
            pstmt.setString(4, b);
            pstmt.executeUpdate();
            out.println("<script>alert('장바구니 등록 성공'); history.back(); </script>");


        }
        catch(SQLException ex) {
            out.println(ex.getMessage());
            ex.printStackTrace();
         } finally {
            if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
        }
	    %>
    </body>
</html>









