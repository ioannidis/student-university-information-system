<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Professor | Grade Students</title>
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
					Grade Students
				</li>
			</ol>
			
			<c:forEach items="${ pendingCourses }" var="pendingCourses">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-book"></i><!--
						 --><c:out value="${ pendingCourses.title }" />
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
									<c:forEach items="${ pendingCourses.pendingStudents }" var="pendingStudents">
										<tr>
											<th><c:out value="${ pendingStudents.name }" /></th>
											<th><c:out value="${ pendingStudents.surname }" /></th>
											<th><c:out value="${ pendingStudents.email }" /></th>
											<th>
												<a class="btn btn-success" href="#" class="btn">
													<i class="fas fa-plus-circle"></i>
													Assign
												</a>
											</th>
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