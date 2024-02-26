<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb7132","root","root");
	Statement statement = connection.createStatement();
	ResultSet rs= statement.executeQuery("select * from logindetails");
	while(rs.next())
	{
		out.println(rs.getObject(1)+"\t"+rs.getObject(2));
		out.println("<br>");
	}
	connection.close();

%>
</body>
</html>