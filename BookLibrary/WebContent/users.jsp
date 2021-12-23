<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="header.jsp"></jsp:include>
     
     <sql:setDataSource driver="com.mysql.jdbc.Driver"
	  					password="root"
	  					url="jdbc:mysql://localhost:3306/bookdb"
	  					user="root"
	  					var="con"/>

	  <sql:query var="data"  dataSource="${con}">
	  	select * from users
	  </sql:query>			


	  <table class="table table-bordered">
	  	<tr>
	  		<th>Username</th>
	  		<th>Email</th>
	  		<th>Password</th>
	  		</tr>

	  <c:forEach items="${data.rows}" var="row">
	  <tr>
	  		<td>${row.username}</td>
	  		<td>${row.email}</td>
	  		<td>${row.password}</td>
	  		</tr>
	  </c:forEach>	
	   </table>	
     
</body>
</html>