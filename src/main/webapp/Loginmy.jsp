<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Handling form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/7132project","root","root");

            // Verify email and password in the database
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Verification successful, forward to the next page
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            } else {
                // Verification failed, include an error message on the same page
                %>
                <p style="color: red;">Invalid email or password. Please try again.</p>
                <%
            }

            connection.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>


</body>
</html>
