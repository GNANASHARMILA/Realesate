package com.ntt.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	public static String username=null;
	public static String password=null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username: " + username); // debug statement
        System.out.println("Password: " + password);//debug statement

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro", "root", "Sharmilasql@29");
            String query = "select * from users where (email=? or contactnumber=?) and password=?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                System.out.println("Welcome " + username + " Successfully logged in");
                if (role.equalsIgnoreCase("admin")) {
                    response.sendRedirect("admin.jsp");
                } else if (role.equalsIgnoreCase("seller")) {
                    response.sendRedirect("seller.jsp");
                } else if (role.equalsIgnoreCase("buyer")) {
                    response.sendRedirect("buyer.jsp");
                } else {
                    System.out.println("Invalid role: " + role);
                }
            } else {
                System.out.println("Invalid username or password.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
