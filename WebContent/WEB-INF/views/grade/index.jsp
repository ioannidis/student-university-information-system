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
	
<!-- Navigation -->
<c:import url="/WEB-INF/views/nav.jsp"></c:import>
  
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
				<td><b>Username</b></td>
				<td><c:out value="${grade.courseId}" /></td>
			</tr>
			<tr>
				<td><b>Name</b></td>
				<td><c:out value="${grade.title}" /></td>
			</tr>
			<tr>
				<td><b>Surname</b></td>
				<td><c:out value="${grade.ects}" /></td>
			</tr>
			<tr>
				<td><b>Phone</b></td>
				<td><c:out value="${grade.teachingHours}" /></td>
			</tr>
			<tr>
				<td><b>Email</b></td>
				<td><c:out value="${grade.instructorUsername}" /></td>
			</tr>
			<tr>
				<td><b>Email</b></td>
				<td><c:out value="${grade.grade}" /></td>
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