<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Professor | View Courses</title>
	<c:import url="/WEB-INF/views/styles.jsp"></c:import>	
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">
	<c:import url="/WEB-INF/views/nav.jsp"></c:import>
	
	<div class="content-wrapper">
		<div class="container-fluid">
		
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="#">Professor</a>
				</li>
				<li class="breadcrumb-item active">
					View Courses
				</li>
			</ol>
		
			<c:forEach items="${ gradedCourses }" var="gradedCourse">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-book"></i><!--
						 --><c:out value="${ gradedCourse.title }" />
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered prof-courses">
	
								<thead>
									<tr>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Email</th>
										<th>Grade</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ gradedCourse.gradedStudents }" var="gradedStudent">
										<tr>
											<th><c:out value="${ gradedStudent.name }" /></th>
											<th><c:out value="${ gradedStudent.surname }" /></th>
											<th><c:out value="${ gradedStudent.email }" /></th>
											<th><c:out value="${ gradedStudent.grade }" /></th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					
					</div>
				</div>
			</c:forEach>

		</div>
		
		<c:import url="/WEB-INF/views/footer.jsp"></c:import>	
	</div>
	
	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>	
</body>
</html>