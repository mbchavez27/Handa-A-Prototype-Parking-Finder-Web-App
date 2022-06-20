<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<style>
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
</style>
<body>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db","root","strawberry");
statement=connection.createStatement();
String sql = "SELECT user_Username, parkingLot_Name FROM users Where user_ID = 1";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<table class="styled-table">
<tbody>
<tr class="active-row">
<td><%=resultSet.getString("user_Username") %></td>
<td><%=resultSet.getString("parkingLot_Name") %></td>
</tr>
 </tbody>
</table>
<a href="index.html">Add New Record</a>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>