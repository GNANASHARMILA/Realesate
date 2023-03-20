<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String username = request.getParameter("username");
session.putValue("username", username);
String password = request.getParameter("password");

out.println("Username: " + username); // debug statement
out.println("Password: " + password);//debug statement

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro", "root", "Sharmilasql@29");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users where (email='" + username + "' or contactnumber='" + username
		+ "') and password='" + password + "'");
try {
	rs.next();
	if (rs.getString("password").equals(password)
	&& (rs.getString("email").equals(username) || rs.getString("contactnumber").equals(username))) {
		out.println("Welcome " + username + "Successfully logged in");
		String role = rs.getString("role");
		if (role.equals("admin") || role.equals("Admin")) {
			response.sendRedirect("admin.jsp");
		} 
		else if (role.equals("seller") || role.equals("Seller")) {
			response.sendRedirect("seller.jsp");
		} 
		else if (role.equals("buyer") || role.equals("Buyer")) {
			response.sendRedirect("buyer.jsp");
		} 
		else {
			out.println("Please enter the valid option");
		}
	} 
	else {
		out.println("Invalid username or password.");
	}

} catch (Exception e) {
	out.println(e.getMessage());
} finally {
	// Close the database resources
	if (rs != null)
		rs.close();
	if (st != null)
		st.close();
	if (con != null)
		con.close();
}
%>