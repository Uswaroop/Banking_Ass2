<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info1","root","Teja@0426");
			PreparedStatement stmt = conn.prepareStatement("insert into user values(?,?)");
			stmt.setString(1, name);
			stmt.setString(2, password);
			int i = stmt.executeUpdate();
			if(i>0) {
				out.println("Saved into database");
				out.println("<html><body>");
				out.println("<a href='Home.html'>Home</a>");
				out.println("</body></html>");
			}
			
		}catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
%>
</body>
</html>