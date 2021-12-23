<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="book.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

<style>
 .container{
 margin:40px;

 }
 .btn
 {
    padding:20px;
 }
 </style>
</head>
<body>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/bookdb"
					   user="root"
					   password="root"
					   var="con"/>

	<!-- Expression Language (EL) -->
	<sql:query var="rs" dataSource="${con}">
		select * from books where bookid=?
		<sql:param>${param.bookid}</sql:param>
	</sql:query>

	<jsp:include page="header.jsp"></jsp:include>

	<c:forEach items="${rs.rows}" var="row">
		<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="ImageServlet?bookid=${row.bookid}" /></div>
						</div>
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${row.bookname}</h3>
						<p class="product-description">Our acts can be no wiser than our thoughts,
						 Our thinking can be no wiser than our understanding.
						 One may not condemn a man for succeeding because he knows how. Neither may one with justice take away from a man what he has fairly earned,
						 to give to men of less ability. </p>
						<h4 class="price">current price: <span>Rs. ${row.price}</span></h4>
						<div class="action">
					 <form action="AddToCartServlet" method="post">
						    <input type="text" name="bookid" value="${row.bookid}" hidden/>
						       Quantity: <input type="number" name="qty"/>
						      <input type="submit" class="btn btn-success btn-block" value="Add To Cart">
					 </form>
							
							<c:if test="${user.role=='admin'}">
								<a href="DeleteServlet?bookid=${row.bookid}" class="btn btn-danger btn-block">Delete</a>
								
								
								<a href="edit.jsp?bookid=${row.bookid}" class="btn btn-secondary btn-block">Edit</a>
							</c:if>
							
							<c:if test="${row.price>0}">
								<a href="OrderController" target="_blank" class="btn btn-primary btn-block">Buy</a>
							</c:if>
							<c:if test="${row.price<=0}">
								<a href="${row.link}" target="_blank" class="btn btn-warning btn-block">Read</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	</c:forEach>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 