<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<p>Songs by artist: ${song}</p>
			</div>
			<div class="col">
				<form action="/search" method="post">
					<input type="text" name="title">
					<button class="btn btn-primary" type="submit">New Search</button>
				</form>
			</div>
			<div class="col"><a href="/dashboard">Dashboard</a></div>
		</div>
		<div class="row">
			<table class="table mt-3 table-striped">
				<tr>
					<th>Name</th>
					<th>Rating</th>
					<th>Actions</th>
				</tr>
				<c:forEach items="${songs}" var="song">
					<tr>
						<td><a href="/songs/${song.id}">${song.title}</a></td>
						<td>${song.rating}</td>
						<td><a href="songs/delete/${song.id}">Delete</a>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>