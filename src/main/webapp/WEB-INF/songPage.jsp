<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${song.title}</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row mb-3">
			<a href="/dashboard">Dashboard</a>
		</div>
		<div class="border d-inline-block mt-3">
			<p>Title: ${song.title}</p>
			<p>Artist: ${song.artist}</p>
			<p>Rating: ${song.rating}</p>
			<p><a href="/songs/delete/${song.id}">Delete</a></p>
		</div>
	</div>
</body>
</html>