package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.User;
import others.Email;


@WebServlet(name="RegistrationServlet",urlPatterns = "/RegistrationServlet")
public class RegistrationServlet extends HttpServlet
{
	  @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	 {
	
		  User u=new User();
			u.setUsername(req.getParameter("username"));
			u.setEmail(req.getParameter("email"));
			u.setPassword(req.getParameter("password"));

			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","root");
				PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?)");
				ps.setString(1, u.getUsername());
				ps.setString(2, u.getEmail());
				ps.setString(3, u.getPassword());
				ps.setString(4, "user");
				ps.executeUpdate();
				
				Email em=new Email(u.getEmail(), "Registered Successfull!!!", "Welcome to Book Website hope You Find Some Awesome Books here ");
				em.sendEmail();
				resp.sendRedirect("login.jsp");
			}
			catch(Exception e)
			{
				PrintWriter out=resp.getWriter();
				out.println(e+"");
			}
	}
}
