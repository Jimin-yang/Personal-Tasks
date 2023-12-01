<%@ page import="java.sql.*"%>
<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/test1";
	String user = "root";
	String password = "admin";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
%>