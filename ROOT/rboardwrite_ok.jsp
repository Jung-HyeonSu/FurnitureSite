<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC";
	String id = "Padmin";
	String pass = "24";

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int max = 0;
	int review_buy_opt;
	if(request.getParameter("review_buy_opt") != null){
         
		review_buy_opt =  Integer.parseInt(request.getParameter("review_buy_opt"));
	   
		} else{
		
		review_buy_opt = 0;
			
		}
	   
	int review_star = Integer.parseInt(request.getParameter("review_star"));

	
	try {	
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardDB?serverTimezone=UTC","Padmin","24");
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(NUM) FROM board1";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			max=rs.getInt(1);
		}
		
		sql = "INSERT INTO board1(USERNAME,PASSWORD,TITLE,MEMO,REF,review_buy_opt,review_star) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
		pstmt.setInt(6, review_buy_opt);
		pstmt.setInt(7, review_star);
		
		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();

} catch(SQLException e) {
	//out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="Mainbar/CommunityBar/Review.jsp";
  </script>