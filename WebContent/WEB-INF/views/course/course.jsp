<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Single Course</title>
<!-- Bootstrap core CSS-->
  	<link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
  	<!-- Custom styles for this template-->
  	<link href="<c:url value="/assets/css/sb-admin.min.css"/>" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	    <a class="navbar-brand" href="<c:url value="/" />">Java Part Two</a>
	    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarResponsive">
	      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Dashboard">
	          <a class="nav-link" href="<c:url value="/courses"/>">
	            <i class="fa fa-fw fa-dashboard"></i>
	            <span class="nav-link-text">Course list</span>
	          </a>
	        </li>
	      </ul>
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item">
	          <a href="<c:url value="/logout"/>" class="nav-link">
	            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
	        </li>
	      </ul>
	   </div>
	</nav>
  
	<div class="content-wrapper">
	  <div class="container-fluid">
	   <div class="card mb-3">
	       <div class="card-header">
	         <i class="fa fa-table"></i><b>Course</b></div>
	       <div class="card-body">
	         <div class="table-responsive">
	<table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
		<tbody>
			<tr>
				<td><b>Id</b></td>
				<td><c:out value="${course.courseId}" /></td>
			</tr>
			<tr>
				<td><b>Title</b></td>
				<td><c:out value="${course.title}" /></td>
			</tr>
			<tr>
				<td><b>Ects</b></td>
				<td><c:out value="${course.ects}" /></td>
			</tr>
			<tr>
				<td><b>Teaching Hours</b></td>
				<td><c:out value="${course.teachingHours}" /></td>
			</tr>
			<tr>
				<td><b>Instructor</b></td>
				<td><c:out value="${course.instructorUsername}" /></td>
			</tr>
	        <tr>
	        	<td><b>Actions</b></td>
				<td>
					<a class="btn btn-warning" href="courses?id=${course.courseId}&action=edit" class="btn">Edit</a>
					<a class="btn btn-danger" href="courses?id=${course.courseId}&action=delete" class="btn">Delete</a>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	        </div>
	      </div>
	  </div>
	  <footer class="sticky-footer">
	    <div class="container">
	      <div class="text-center">
	        <small>P16036 - P16097 - P16112</small>
	      </div>
	    </div>
	  </footer>
	</div>
	
	<!-- Bootstrap core JavaScript-->
  	<script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
  	<script src="<c:url value="/assets/js/bootstrap.bundle.min.js"/>"></script>
  	<!-- Core plugin JavaScript-->
  	<script src="<c:url value="/assets/js/jquery.easing.min.js"/>"></script>
</body>
</html>