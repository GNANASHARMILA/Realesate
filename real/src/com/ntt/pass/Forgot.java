package com.ntt.pass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

//@WebServlet("/forgot")

public class Forgot {
    static String jdbcURL = "jdbc:mysql://localhost:3306/pro";
    static String username = "root";
    static String password = "Sharmilasql@29";
    public static String email;
    public static String newPassword;
    public static void main(String[] args) {
        String email = "Email";
        String newPassword = "Newpassword";

        if (email == null || email.trim().isEmpty()) {
            System.out.println("Email parameter is missing or empty!");
        } else {
            try (Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {
                String update = "UPDATE users SET password=? WHERE email=?";
                PreparedStatement updateStatement = conn.prepareStatement(update);
                updateStatement.setString(1, newPassword);
                updateStatement.setString(2, email);

                int rowsUpdated = updateStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    System.out.println("<h2><strong><center>Password updated successfully!</center></strong></h2>");
                } else {
                    System.out.println("Failed to update the password for the email: " + email);
                }

            } catch (SQLException e) {
                System.out.println("Error updating password: " + e.getMessage());
            }
        }
    }
}
