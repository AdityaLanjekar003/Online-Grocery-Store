<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Handling form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobileNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate if password and confirm password match
        if (!password.equals(confirmPassword)) {
            out.println("Passwords do not match. Please try again.");
        } else {
            // Perform database operations
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/7132project","root","root");

                // Check if the email already exists in the database
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email=?");
                preparedStatement.setString(1, email);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    out.println("Email already exists. Please use a different email.");
                } else {
                    // Insert new user into the database
                    preparedStatement = connection.prepareStatement("INSERT INTO users (full_name, email, mobile_number, password, confirm_password) VALUES (?, ?, ?, ?, ?)");
                    preparedStatement.setString(1, fullName);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, mobileNumber);
                    preparedStatement.setString(4, password);
                    preparedStatement.setString(5, confirmPassword);
                    preparedStatement.executeUpdate();

                    out.println("Registration successful!");
                }

                connection.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
%>

</body>
</html>
