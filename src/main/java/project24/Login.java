
//Login.java
package project24;



import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
@WebServlet("/Login")
public class Login extends HttpServlet
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name=request.getParameter("username");
		String key= request.getParameter("password");
		String dbUsername,dbPassword;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb7132","root","root");
		
			Statement stmt=con.createStatement();
			//Statement stmt = (Statement) con.createStatement();
            String query = "SELECT password FROM logindetails where userid ='"+name+"'";
          ResultSet rs=  stmt.executeQuery(query);
         //   ResultSet rs = stmt.getResultSet();
         
            while(rs.next())
            {
                 dbUsername = name;
                dbPassword = rs.getString("password");
                if(dbUsername.equals(name)&& dbPassword.equals(key))
        		{
        			
        			RequestDispatcher rd= request.getRequestDispatcher("Dashboard.html");
        			rd.forward(request, response);
        		}
        		else
        		{
        			out.println("<p align='center'><font color='red'>Invalid Password...</font></p>");
        			RequestDispatcher rd= request.getRequestDispatcher("FirstApperenceLogin.html");
        			rd.include(request, response);
        		}
            }
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}




