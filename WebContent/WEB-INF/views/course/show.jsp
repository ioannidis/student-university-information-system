<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Single Course</title>
	<c:import url="/WEB-INF/views/styles.jsp"></c:import>
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
					<a class="btn btn-primary" href="secretary" class="btn">Back</a>
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
	  <c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
	
	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>