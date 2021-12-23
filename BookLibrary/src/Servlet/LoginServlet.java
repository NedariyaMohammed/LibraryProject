package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
	{
	   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   User user=new User();
			user.setUsername(req.getParameter("username"));
			user.setPassword(req.getParameter("password"));

			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","root");
				PreparedStatement ps=con.prepareStatement("select * from users where username=? and password=?");
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());

				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					user.setEmail(rs.getString("email"));
					user.setRole(rs.getString("role"));

					HttpSession hs=req.getSession();
					hs.setAttribute("user", user);
					
					Cookie ck1=new Cookie("un", user.getUsername());
					Cookie ck2=new Cookie("pwd", user.getPassword());
					
					ck1.setMaxAge(30);
					ck2.setMaxAge(30);
					
					resp.addCookie(ck1);
					resp.addCookie(ck2);

					PrintWriter out=resp.getWriter();
					
					out.println(""
							+ "<script>"
							+ "alert('Welcome user');"
							+ "window.location='books.jsp'"
							+ "</script>");
				}
				else
				{
					PrintWriter out=resp.getWriter();
					out.println(""
							+ "<script>"
							+ "alert('Username or password is incorrect');"
							+ "window.location='login.jsp'"
							+ "</script>");
				}

			}
			catch(Exception e)
			{
				System.out.println(e);
			}
	}
}
