<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Courses</title>
		<c:import url="/WEB-INF/views/styles.jsp"></c:import>
	</head>
	<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">
	
		<!-- Navigation -->
		<c:import url="/WEB-INF/views/nav.jsp"></c:import>
  
		<div class="content-wrapper">
			<div class="container-fluid">
			
				<ol class="breadcrumb">
					<li class="breadcrumb-item text-primary"><a href="courses" >Courses</a></li>
				</ol>
			
				<div class="card mb-3">
				
					<div class="card-header">
						<i class="fa fa-table"></i><b>Courses Table</b>
					</div>
					
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>Id</th>
										<th>Title</th>
										<th>Ects</th>
										<th>Teaching Hours</th>
										<th>Semester</th>
										<th>Instructor</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${courses}" var="course">
								        <tr>
											<th><c:out value="${course.courseId}" /></th>
											<th><c:out value="${course.title}" /></th>
											<th><c:out value="${course.ects}" /></th>
											<th><c:out value="${course.teachingHours}" /></th>
											<th><c:out value="${course.semester}" /></th>
											<th><c:out value="${course.instructorUsername}" /></th>
										</tr>
								    </c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	  <c:import url="/WEB-INF/views/scripts.jsp"></c:import>
		</div>
	
	<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</body>
</html>