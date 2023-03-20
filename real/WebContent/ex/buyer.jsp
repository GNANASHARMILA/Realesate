<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email"); 
session.putValue("email",email); 
String password=request.getParameter("password"); 

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro1","root","Sharmilasql@29"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from buyer where email='"+email+"' and password='"+password+"'"); 
try{
	rs.next();
	        if(rs.getString("password").equals(password)&&rs.getString("email").equals(email)) 
			{ 
			      out.println("Welcome "  +email); 
			} 
		else{
			 System.out.println("Invalid password or username.");
			  }
}
catch (Exception e) {
e.printStackTrace();
}
%>