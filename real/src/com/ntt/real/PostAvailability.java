package com.ntt.real;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

@WebServlet("/real")
public class PostAvailability {
    String jdbcURL = "jdbc:mysql://localhost:3306/pro";
    String username = "root";
    String password = "Sharmilasql@29";
    public static String location;
    public static String property_type;
    public static String budget;
    public static int siteid;
    public void checkAvailability(String location, String property_type, String budget) {
    	
        try (Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {
            String query = "SELECT * FROM site WHERE Location=? AND Property_Type=? AND Budget<=? AND Availability='yes'";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, location);
            statement.setString(2, property_type);
            statement.setString(3, budget);

            System.out.println("<h1><center>Available sites are:</center></h1>");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int SiteId = rs.getInt("SiteId");
                String Location = rs.getString("Location");
                String Property_type = rs.getString("Property_type");
                String Budget = rs.getString("Budget");

                // Output the data as HTML
                System.out.println("<div>");
                System.out.println("<h2>Site ID: " + SiteId + "</h2>");
                System.out.println("<p>Location: " + Location + "</p>");
                System.out.println("<p>Property Type: " + Property_type + "</p>");
                System.out.println("<p>Budget: " + Budget + "</p>");
                System.out.println("</div>");
            }
        } catch (SQLException e) {
            System.out.println("Error checking availability: " + e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
