<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
String contactnumber=request.getParameter("contactnumber");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro1", "root", "Sharmilasql@29");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into buyer(name,email,password,contactnumber)values('"+name+"','"+email+"','"+password+"','"+contactnumber+"')");
        out.println("Data is successfully inserted!");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>