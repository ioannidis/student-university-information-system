<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Course</title>
<!-- Bootstrap core CSS-->
  	<link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
  	<!-- Custom styles for this template-->
  	<link href="<c:url value="/assets/css/sb-admin.min.css"/>" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
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
	         <i class="fa fa-table"></i><b>Edit course</b></div>
	       <div class="card-body">
	<form action="courses?id=${course.courseId}&action=edit" method="POST">
	<div class="form-group">
			<label for="title"><strong>Course Id</strong></label>
			<input type="text" class="form-control"  name="title" id="title" value="${course.courseId}" disabled/>
		</div>
		<div class="form-group">
			<label for="title"><strong>Course Title</strong></label>
			<input type="text" class="form-control"  name="title" id="title" value="${course.title}" />
		</div>
		<div class="form-group">
			<label for="ects"><strong>Course ECTs</strong></label>
			<input type="text" class="form-control"  name="ects" id="ects" value="${course.ects}" />
		</div>
		<div class="form-group">
			<label for="teachingHours"><strong>Teaching Hours</strong></label>
			<input type="text" class="form-control"  name="teachingHours" id="teachingHours" value="${course.teachingHours}" />
		</div>
		<div class="form-group">
		<label for="teachingInstructor"><strong>Select Instructor</strong></label>
			<select class="form-control" name="teachingInstructor" id="teachingInstructor">
				<c:forEach items="${ instructors }" var="professor">
					<option value="<c:out value="${ professor.username }"/>" <c:if test="${course.instructorUsername == professor.username}">selected</c:if> >
						<c:out value="${ professor.name } ${ professor.surname } (${ professor.username})" />
					</option>
				</c:forEach>
			</select>
		</div>
		<br />
		<input type="submit" class="btn btn-primary" value="Update Course" />
		<a href="<c:url value="/secretary"/>" class="btn btn-warning">Cancel</a>
	</form>
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