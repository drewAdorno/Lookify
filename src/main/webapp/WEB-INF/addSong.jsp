<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Song</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<a href="/dashboard">Dashboard</a>
		</div>
		<div class="row">
			
			<p><form:form action="/songs/new" method="POST" modelAttribute="song">
			<form:label path="title">Title</form:label>
			<form:errors path="title" />
			<form:input path="title" /></p>

			<p><form:label path="artist">Artist</form:label>
			<form:errors path="artist" />
			<form:input path="artist" /></p>

			<p><form:label path="rating">Rating(1-10)</form:label>
			<form:errors path="rating" />
			<form:select path="rating">
				<c:forEach begin="1" end="10" varStatus="loop">
					<form:option value="${loop.index}">${loop.index}</form:option>
				</c:forEach>
			</form:select></p>
			<p><button class="btn btn-primary" type="submit">Add Song</button></p>
		</form:form>
		</div>
	</div>
</body>
</html>