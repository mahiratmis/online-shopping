<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Company Enterprise Framework - ${title}</title>
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap 4 core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap materia theme CSS -->
<link href="${css}/bootstrapmateria.css" rel="stylesheet">

<!-- Font Awesome Icons -->
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Home</a>
				</div>
			</div>
		</nav>

		<!-- Page Content -->
		<div class="content">
			<div class="row">
				<div class="col-12">
					<div class="jumbotron">
						<h1>${errorTitle}</h1>
						<hr />
						<blockquote style="word-wrap: break-word">
							${errorDescription}</blockquote>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>
	</div>
</body>
</html>