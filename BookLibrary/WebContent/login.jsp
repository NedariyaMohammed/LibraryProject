<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
 .container{
 margin:30px;

 }
 
 .myclass{
  margin: 0 auto;
 }
</style>
<title>Insert title here</title>
</head>
<body>

     <%
		session.removeAttribute("user");
		session.invalidate();
		
		String username="",password="";
		try
		{
			Cookie ck[]=request.getCookies();
			for(Cookie c:ck)
			{
				if(c.getName().equals("un"))
				{
						username=c.getValue();
				}
				else if(c.getName().equals("pwd"))
				{
						password=c.getValue();
				}
			}
		}
		catch(Exception e)
		{
			
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<form class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass" action="LoginServlet" method="post">
			<div class="form-group">
				<label>Enter Username</label>
				<input type="text" name="username" value="<%=username%>" class="form-control" placeholder="Enter Username"/>
			</div>
			<div class="form-group">
				<label>Enter Password</label>
				<input type="password" name="password" value="<%=password%>" class="form-control" placeholder="Enter Password"/>
			</div>
			<div class="form-group">
			   <a href="collectemail.jsp">Forgot Password?</a>
			</div>
			<div class="form-group">
				<input type="submit" value="Login" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 