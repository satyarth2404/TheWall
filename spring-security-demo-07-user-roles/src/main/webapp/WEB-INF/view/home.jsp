<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "security" uri = "http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saty HomePage</title>
</head>
<body>
	<h2> Welcome to Saty Home Page</h2>
	<hr>
	
	<p>
		User: <security:authentication property = "principal.username" />
		<br><br>
		Role(s): <security:authentication property = "principal.authorities" />
	</p>
	<hr>
	
	<security:authorize access = "hasRole('MANAGER')">
	<!--  Add a link pointing to /leaders....this is for managers -->
	 <p>
		<a href = "${pageContext.request.contextPath}/leaders">Leadership Meeting</a> 
	 	(Only for manager peeps)
	 </p>
	 </security:authorize>
	 
	 <security:authorize access = "hasRole('ADMIN')">
	 <!--  Add a link pointing to /systems....this is for admins-->
	 <p>
		<a href = "${pageContext.request.contextPath}/systems">IT Systems Meeting</a> 
	 	(Only for admin peeps)
	 </p>
	</security:authorize>
	 
	 <hr>
	 
	<p>
	Welcome to Saty Homepage
	</p>
	
	<form:form action = "${pageContext.request.contextPath}/logout" method = "POST">
		<input type = "submit" value = "Logout" />
	</form:form>
</body>
</html>