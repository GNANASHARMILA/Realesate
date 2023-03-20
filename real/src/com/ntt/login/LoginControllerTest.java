package com.ntt.login;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;


class LoginControllerTest {
	
	
	@Test
	public void test() throws SQLException {
		LoginController test = new LoginController();
		String Op = LoginController.username;
		LoginController loginPage = new LoginController();
		String Op1 = loginPage.password;
		Connection cn = null;
		String JdbcURL = "jdbc:mysql://localhost:3306/pro";
		String Username = "root";
		String password = "Sharmilasql@29";
		cn = DriverManager.getConnection(JdbcURL, Username, password);
		PreparedStatement stmt = cn.prepareStatement("SELECT * FROM users WHERE (email=? or contactnumber=?)  AND password = ?");
		stmt.setString(1, Op);
		stmt.setString(2, Op1);
	}
}