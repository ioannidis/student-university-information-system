<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Course</title>
	<c:import url="/WEB-INF/views/styles.jsp"></c:import>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">
	
<!-- Navigation -->
<c:import url="/WEB-INF/views/nav.jsp"></c:import>
  
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
			<input type="text" class="form-control"  name="title" id="title" value="${course.title}" required />
		</div>
		<div class="form-group">
			<label for="ects"><strong>Course ECTs</strong></label>
			<input type="number" min="0" max="10" class="form-control"  name="ects" id="ects" value="${course.ects}" required/>
		</div>
		<div class="form-group">
			<label for="teachingHours"><strong>Teaching Hours</strong></label>
			<input type="number" min="1" max="100" class="form-control"  name="teachingHours" id="teachingHours" value="${course.teachingHours}" required />
		</div>
		<div class="form-group">
		<label for="teachingInstructor"><strong>Select Instructor</strong></label>
			<select class="form-control" name="teachingInstructor" id="teachingInstructor" required>
				<c:forEach items="${ instructors }" var="professor">
					<option value="<c:out value="${ professor.username }"/>" <c:if test="${course.instructorUsername == professor.username}">selected</c:if> >
						<c:out value="${ professor.name } ${ professor.surname } (${ professor.username})" />
					</option>
				</c:forEach>
			</select>
		</div>
		<br />
		<input type="submit" class="btn btn-success" value="Update Course" />
		<a href="<c:url value="/secretary"/>" class="btn btn-warning">Cancel</a>
	</form>
	 </div>
	      </div>
	  </div>
	  <c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
	
	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>