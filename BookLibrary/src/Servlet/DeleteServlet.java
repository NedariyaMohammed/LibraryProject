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


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet
{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
   {
	   int bookid=Integer.parseInt(req.getParameter("bookid"));

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","root");
		PreparedStatement ps=con.prepareStatement("update books set status='D' where bookid="+bookid);
		ps.executeUpdate();
	   
		PrintWriter out=resp.getWriter();
		out.println(""
				+ "<script>"
				+ "alert('Book Deleted Successfully!!');"
				+ "window.location='books.jsp';"
				+ "</script>");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
   
}
