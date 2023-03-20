package com.ntt.pass;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.ntt.login.LoginController;

class ForgotTest {

	@Test
	public void test() throws SQLException {
		Forgot test = new Forgot();
		String Op = Forgot.email;
		
		String Op1 = Forgot.newPassword;
		Connection cn = null;
		String JdbcURL = "jdbc:mysql://localhost:3306/pro";
		String Username = "root";
		String password = "Sharmilasql@29";
		cn = DriverManager.getConnection(JdbcURL, Username, password);
		PreparedStatement stmt = cn.prepareStatement("UPDATE users SET password=? WHERE email=?");
		stmt.setString(1, Op);
		stmt.setString(2, Op1);
	}
}
