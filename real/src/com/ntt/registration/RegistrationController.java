package com.ntt.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	public static String name;
	public static String email;
	public static String contactnumber;
	public static String password;
	public static String role;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		 String contactnumber = request.getParameter("contactnumber");
		 String role = request.getParameter("role");

		if (name.isEmpty() || email.isEmpty() || password.isEmpty() || contactnumber.isEmpty() || role.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("reg.jsp");
			out.println("<font color=red>Please fill all the fields</font>");
			rd.include(request, response);
		} else {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro", "root", "Sharmilasql@29");

				if (role.equals("seller")) {
					String insertQuery = "INSERT INTO seller (name, email, password, contactnumber) VALUES (?, ?, ?,?)";
					PreparedStatement pstmt = conn.prepareStatement(insertQuery);
					pstmt.setString(1, name);
					pstmt.setString(2, email);
					pstmt.setString(3, password);
					pstmt.setString(4, contactnumber);
					pstmt.executeUpdate();
				} else if (role.equals("admin")) {
					String insertQuery = "INSERT INTO admin(name, email, password, contactnumber) VALUES (?, ?, ?, ?)";
					PreparedStatement pstmt = conn.prepareStatement(insertQuery);
					pstmt.setString(1, name);
					pstmt.setString(2, email);
					pstmt.setString(3, password);
					pstmt.setString(4, contactnumber);
					pstmt.executeUpdate();
				} else if (role.equals("buyer")) {
					String insertQuery = "INSERT INTO buyer (name, email, password, contactnumber) VALUES (?, ?, ?,?)";
					PreparedStatement pstmt = conn.prepareStatement(insertQuery);
					pstmt.setString(1, name);
					pstmt.setString(2, email);
					pstmt.setString(3, password);
					pstmt.setString(4, contactnumber);
					pstmt.executeUpdate();
				} else {
					out.println("Error: Invalid role");
				}
				String insertQuery = "INSERT INTO users(name,email,password,contactnumber,role)values(?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(insertQuery);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, password);
				pstmt.setString(4, contactnumber);
				pstmt.setString(5, role);
				pstmt.executeUpdate();
				out.println("<center><strong><h1>Data is successfully inserted!</h1></strong></center>");
			} catch (SQLException e) {
				out.println("Error: " + e.getMessage());
			} catch (ClassNotFoundException e) {
				out.println("Error: " + e.getMessage());
			} catch (Exception e) {
				out.println("Error: " + e.getMessage());
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
		}
	}
}