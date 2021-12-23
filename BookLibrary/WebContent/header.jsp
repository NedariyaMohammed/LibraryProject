<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Welcome ${user.username}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     <c:if test="${user==null}">
      	<li class="nav-item">
	        	<a class="nav-link" href="login.jsp">Login</a>
    	</li>
      	<li class="nav-item">
        	<a class="nav-link" href="register.jsp">Register</a>
      	</li>
      </c:if>

      <c:if test="${user.role=='admin'}">
	      <li class="nav-item">
	        <a class="nav-link" href="addbook.jsp">Add Book</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="users.jsp">Users</a>
	      </li>
      </c:if>

      <li class="nav-item">
        <a class="nav-link" href="books.jsp">Books</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="aboutus.jsp">About Us</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="contactus.jsp">Contact Us</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="cart.jsp">Cart</a>
      </li>
       <c:if test="${user!=null}">
      	<li class="nav-item">
       		 <a class="nav-link" href="login.jsp">Logout</a>
     	 </li>
      </c:if>
     </ul>
     
     <a href="books.jsp?sort=hightolow" class="btn btn-primary">High To Low</a>
     <a href="books.jsp?sort=lowtohigh" class="btn btn-danger">Low to High</a>
    <form class="form-inline my-2 my-lg-0" action="books.jsp">
      <input class="form-control mr-sm-2" type="search" name="bookname" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
</body>
</html> 
