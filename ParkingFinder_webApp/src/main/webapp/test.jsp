<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db","root","strawberry");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select user_username from user_tbl");
	while(rs.next())  
	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
	con.close();  

%>
</body>
</html>