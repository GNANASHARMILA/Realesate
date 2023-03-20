package com.ntt.real;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.Test;

import com.ntt.login.LoginController;

public class PostAvailabilityTest {

	@Test
	public void test() throws SQLException {
		PostAvailability test = new PostAvailability();
		String Op = PostAvailability.location;
		String Op1 = PostAvailability.property_type;
		String Op2 = PostAvailability.budget;
		Connection cn = null;
		String JdbcURL = "jdbc:mysql://localhost:3306/pro";
		String Username = "root";
		String password = "Sharmilasql@29";
		cn = DriverManager.getConnection(JdbcURL, Username, password);
		PreparedStatement stmt = cn.prepareStatement("SELECT * FROM site WHERE Location=? AND Property_Type=? AND Budget<=? AND Availability='yes'");
		stmt.setString(1, Op);
		stmt.setString(2, Op1);
		stmt.setString(3, Op2);
	}

}
