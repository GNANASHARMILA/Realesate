package com.ntt.registration;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;


class RegistrationControllerTest {
	
	
	@Test
	public void test() throws SQLException {
		RegistrationController test = new RegistrationController();
		String Op = RegistrationController.name;
		String Op1 = RegistrationController.email;
		String Op2 = RegistrationController.password;
		String Op3 = RegistrationController.contactnumber;
		String Op4 = RegistrationController.role;
		Connection cn = null;
		String JdbcURL = "jdbc:mysql://localhost:3306/pro";
		String Username = "root";
		String password = "Sharmilasql@29";
		cn = DriverManager.getConnection(JdbcURL, Username, password);
		PreparedStatement stmt = cn.prepareStatement("SELECT * FROM users WHERE name = ? AND  email = ? AND password = ? AND contactnumber =? AND role=?");
		stmt.setString(1, Op);
		stmt.setString(2, Op1);
		stmt.setString(3, Op2);
		stmt.setString(4, Op3);
		stmt.setString(5, Op4);
	}
}