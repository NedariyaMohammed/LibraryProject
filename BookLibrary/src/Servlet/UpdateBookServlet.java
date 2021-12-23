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


import Model.Book;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet
{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
  
  {
	  Book b = new Book();
		b.setBookid(Integer.parseInt(req.getParameter("bookid")));
		b.setBookname(req.getParameter("bookname"));
		b.setAuthor(req.getParameter("author"));
		b.setPrice(Float.parseFloat(req.getParameter("price")));
		b.setLink(req.getParameter("link"));
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","root");
			PreparedStatement ps=con.prepareStatement("update books set bookname=?,author=?,price=?,link=? where bookid=?");
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setFloat(3, b.getPrice());
			ps.setString(4, b.getLink());
			ps.setInt(5, b.getBookid());
			ps.executeUpdate();
			resp.sendRedirect("books.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
}
}
