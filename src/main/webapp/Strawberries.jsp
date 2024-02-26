<!DOCTYPE html>
<%@page import="javax.lang.model.element.QualifiedNameable"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600);

        * {
            margin:0;
            padding:0;
            box-sizing:border-box;
            -webkit-box-sizing:border-box;
            -moz-box-sizing:border-box;
            -webkit-font-smoothing:antialiased;
            -moz-font-smoothing:antialiased;
            -o-font-smoothing:antialiased;
            font-smoothing:antialiased;
            text-rendering:optimizeLegibility;
        }

        body {
            font-family:"Open Sans", Helvetica, Arial, sans-serif;
            font-weight:300;
            font-size: 12px;
            line-height:30px;
            color:#777;
            background:url('img/slider3.png') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            max-width:400px;
            width:100%;
            margin:0 auto;
            position:relative;
        }

        #contact input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact textarea, #contact button[type="submit"] { font:400 12px/16px "Open Sans", Helvetica, Arial, sans-serif; }

        #contact {
            background:rgba(255,255,255,0.8);
            padding:25px;
            margin:50px 0;
            border-radius: 10px;
        }

        #contact h1 {
            color: #F96;
            display: block;
            font-size: 30px;
            font-weight: 400;
        }

        #contact h4 {
            color: rgb(37, 7, 92);
            margin:5px 0 15px;
            display:block;
            font-size:13px;
        }

        fieldset {
            border: medium none !important;
            margin: 0 0 10px;
            min-width: 100%;
            padding: 0;
            width: 100%;
        }

        #contact input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact textarea {
            width:100%;
            border:1px solid #CCC;
            background:#FFF;
            margin:0 0 5px;
            padding:10px;
        }

        #contact input[type="text"]:hover, #contact input[type="email"]:hover, #contact input[type="tel"]:hover, #contact input[type="url"]:hover, #contact textarea:hover {
            transition:border-color 0.3s ease-in-out;
            border:1px solid #AAA;
        }

        #contact textarea {
            height:100px;
            max-width:100%;
            resize:none;
        }

        #contact button[type="submit"] {
            cursor:pointer;
            width:100%;
            border:none;
            background:#0CF;
            color:#FFF;
            margin:0 0 5px;
            padding:10px;
            font-size:15px;
            border-radius: 5px;
        }

        #contact button[type="submit"]:hover {
            background:#09C;
            transition:background 0.3s ease-in-out;
        }

        #contact button[type="submit"]:active {
            box-shadow:inset 0 1px 3px rgba(0, 0, 0, 0.5);
        }

        #contact input:focus, #contact textarea:focus {
            outline:0;
            border:1px solid #999;
        }

        ::-webkit-input-placeholder {
            color:#888;
        }
        :-moz-placeholder {
            color:#888;
        }
        ::-moz-placeholder {
            color:#888;
        }
        :-ms-input-placeholder {
            color:#888;
        }

    </style>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
		
    if ("POST".equalsIgnoreCase(request.getMethod()))
    {
    	int quantityi=0;
    	int price=0;
    	int Total=0;
    	String name = request.getParameter("name");
    	String product="Strawberries";
    	String phone = request.getParameter("phone");
    	String quantity=request.getParameter("Quantity");
       	quantityi=Integer.parseInt(quantity);
       	
		
    
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/7132project","root","root");

            
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Shop_sell (name, phonenumber, product_name, quantity) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, phone);
            preparedStatement.setString(3, product);
            preparedStatement.setInt(4, quantityi);
           	preparedStatement.executeUpdate();
           	
           
            String sql = "SELECT  productname,price FROM Products Where productid=1711";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            
            while (rs.next())
            {
                String productName = rs.getString("productname");
                price = rs.getInt("price");
            }
            Total=quantityi*price;%>
               <div class="container">  
        <form id="contact" action="" method="post">
          <h1>Thank You For Shopping in Small Basket...</h1>
          &nbsp;
          <H4>Your Order Has Been Placed Successfully.........!</H4>
            <h4>Cart Details : </h4>
            <h4>Product Name :<% out.print(product);%> </h4>
            <h4>Quantity : <%out.print(quantityi); %></h4>
            <h4>MRP : <%out.print(Total); %></h4>
            
        
      </div>
            <% //out.println(Total);
            connection.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
     
%>

    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>