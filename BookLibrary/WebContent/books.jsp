<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="books.css"/>

<style>
 .container{
 margin:40px;

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


     <c:if test="${param.sort!=null}">
	<c:if test="${param.sort=='hightolow'}">	
	<sql:query var="rs" dataSource="${con}">
		select * from books where status='A' order by price desc
	</sql:query>
	</c:if>

	<c:if test="${param.sort=='lowtohigh'}">
	<sql:query var="rs" dataSource="${con}">
		select * from books where status='A' order by price ASC
	</sql:query>
	</c:if>
	</c:if>

	<c:if test="${param.bookname!=null && param.sort==null}">
	<sql:query var="rs" dataSource="${con}">
		select * from books where status='A' and bookname like '%' ? '%'
		<sql:param>${param.bookname}</sql:param>
    </sql:query>
	</c:if>
	
    <c:if test="${param.bookname==null && param.sort==null}">
	<sql:query var="rs" dataSource="${con}">
		select * from books where status='A'
	</sql:query>
     </c:if>
	

	<div class="container">
  
    <div class="row">
        <c:forEach items="${rs.rows}" var="row">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid">
                <div class="product-image">
                    <a href="book.jsp?bookid=${row.bookid}">
                        <img src="ImageServlet?bookid=${row.bookid}" style="height:300px">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#"></a>${row.bookname}</h3>
                    <div class="price">Rs. ${row.price}</div>
                    <a class="btn btn-primary" href="AddToCartServlet">+ Add To Cart</a>
                </div>
            </div>
        </div>
        </c:forEach>	
      </div>
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>