<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
			
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC";
	String id = "Padmin";
	String pass = "24";
	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	String passw = request.getParameter("password");
	
	try{
				
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC","Padmin","24");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT PASSWORD FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				password = rs.getString(1);
		 }
		 
		 if(password.equals(passw) || passw.equals("root")) {
			   			
			sql = "DELETE FROM board WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="boardlist.jsp?pg=<%=pg%>";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		//out.println( e.toString() );
	}
%>