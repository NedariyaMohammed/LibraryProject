<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.myclass
	{
		margin:0 auto;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/bookdb"
					   user="root"
					   password="root"
					   var="con"/>

		<!-- Display only particular book -->
		<!-- Take bookid from last page books.jsp using ${param.bookid} -->   
		<sql:query var="rs" dataSource="${con}">
			select * from books where bookid=?
			<sql:param>${param.bookid}</sql:param>
		</sql:query>

		<div class="container">
		<c:forEach items="${rs.rows}" var="row">
		<form action="UpdateBookServlet" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
			<div class="form-group">
				<label>Enter BookId</label>
				<input type="text" name="bookid" value="${row.bookid}" class="form-control" placeholder="Enter Bookname"/>
			</div>
			<div class="form-group">
				<label>Enter BookName</label>
				<input type="text" name="bookname" value="${row.bookname}" class="form-control" placeholder="Enter Bookname"/>
			</div>
			<div class="form-group">
				<label>Enter Author</label>
				<input type="text" name="author" value="${row.author}" class="form-control" placeholder="Enter Author"/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" value="${row.price}" class="form-control" placeholder="Enter Price"/>
			</div>
			<div class="form-group">
				<label>Enter Link</label>
				<input type="text" name="link" value="${row.link}" class="form-control" placeholder="Enter Link"/>
			</div>
			<div class="form-group">
				<label>Select Image</label>
				<input type="file" name="image" accept="image/*" class="form-control" placeholder="Select Image"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Update Book" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		</c:forEach>
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
		
</body>
</html> 