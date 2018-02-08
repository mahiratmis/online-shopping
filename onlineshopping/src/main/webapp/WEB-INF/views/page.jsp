<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

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
<!-- Bootstrap dataTable CSS -->
<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Bootstrap mobile compatible dataTable CSS -->
<link href="${css}/responsive.dataTables.min.css" rel="stylesheet">
<link href="${css}/rowReorder.dataTables.min.css" rel="stylesheet">

<!-- Bootstrap materia theme CSS
<link href="${css}/bootstrapmateria.css" rel="stylesheet">  -->

<!-- Font Awesome Icons -->
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>
	<div class="wrapper">
		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>

		<!-- Page Content -->
		<div class="content">
			<!-- load home content -->
			<c:if test="${userClickHome == true}">
				<%@include file="home.jsp"%>
			</c:if>

			<!-- load load only when user clicks ABOUT link -->
			<c:if test="${userClickAbout == true}">
				<%@include file="about.jsp"%>
			</c:if>

			<!-- load only when user clicks CONTACT link -->
			<c:if test="${userClickContact == true}">
				<%@include file="contact.jsp"%>
			</c:if>

			<!-- load only when user clicks ALL PRODUCTS or CATEGORY PRODUCTS link -->
			<c:if
				test="${userClickAllProducts == true or userClickCategoryProducts == true}">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- load only when user clicks to view A SINGLE PRODUCT DETAIL link -->
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>
			<!-- load only when user clicks MANAGE PRODUCTs link -->
			<c:if test="${userClickManageProducts == true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>


		</div>
		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>


		<!-- JQUERY -->
		<script src="${js}/jquery.js"></script>
		<script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/jquery.validate.js"></script>

		<!-- BOOTSRAP -->
		<script src="${js}/dataTables.bootstrap4.js"></script>
		<script src="${js}/bootstrap.bundle.min.js"></script>

		<!-- Mobile Compatible Responsive DataTable -->
		<script src="${js}/dataTables.responsive.min.js"></script>
		<script src="${js}/dataTables.rowReorder.min.js"></script>		

		<!-- BOOTBOX -->
		<script src="${js}/bootbox.min.js"></script>

		<!-- CUSTOM JS -->
		<script src="${js}/myapp.js"></script>

	</div>
</body>
</html>