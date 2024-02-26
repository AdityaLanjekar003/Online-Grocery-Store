
<!-- Students.jsp -->
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login Details</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }
    </style>
</head>
<body>

<%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
	
    try {     
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb7132","root","root");
        statement = connection.createStatement();
        String query = "SELECT userid, password from logindetails";
        resultSet = statement.executeQuery("SELECT userid, password from logindetails");
%>

    <h2>Login Details</h2>

    <table>
        <tr>
            <th>Login ID</th>
            <th>Password</th>
        </tr>
        <%
            while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("userid") %></td>
            <td><%= resultSet.getString("password") %></td>
        </tr>
        <%
            }
        %>
    </table>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
