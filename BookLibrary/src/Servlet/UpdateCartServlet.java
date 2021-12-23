package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet
{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {

        int bookid      = Integer.parseInt(req.getParameter("bookid"));
		int quantity    = Integer.parseInt(req.getParameter("qty"));
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","root");
			PreparedStatement ps = con.prepareStatement("update carts set quantity=? where bookid=?");
			ps.setInt(1, quantity);
			ps.setInt(2, bookid);
			ps.executeUpdate();
			resp.sendRedirect("cart.jsp");
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	  
   }
}
