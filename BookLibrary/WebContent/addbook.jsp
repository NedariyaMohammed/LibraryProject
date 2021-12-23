<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <html>
<head>
<meta charset="ISO-8859-1">
<style>
 .container{
 margin:40px;

 }
 
 .myclass{
  margin: 0 auto;
 }
</style>
<title>Insert title here</title>
</head>
<body>
   
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<form action="AddBookServlet" method="post"  enctype="multipart/form-data"  class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
			<div class="form-group">
				<label>Enter BookName</label>
				<input type="text" name="bookname" class="form-control" placeholder="Enter Bookname"/>
			</div>
			<div class="form-group">
				<label>Enter Author</label>
				<input type="text" name="author" class="form-control" placeholder="Enter Author"/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" class="form-control" placeholder="Enter Price"/>
			</div>
			<div class="form-group">
				<label>Enter Link</label>
				<input type="text" name="link" class="form-control" placeholder="Enter Link"/>
			</div>
			<div class="form-group">
				<label>Select Image</label>
				<input type="file" name="image" accept="image/*" class="form-control" placeholder="Select Image"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Add Book" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 
</body>
</html>