<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Professor | Grade Students</title>
<c:import url="/WEB-INF/views/styles.jsp"></c:import>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top"
	cz-shortcut-listen="true">

	<!-- Navigation -->
	<c:import url="/WEB-INF/views/nav.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">

			<ol class="breadcrumb">
				<li class="breadcrumb-item text-primary"><a href="instructor">Professor</a></li>
				<li class="breadcrumb-item text-primary"><a href="gradestudents?course_id=<c:out value="${pendingCourse.courseId}" />">Grade  Student</a></li>
				<li class="breadcrumb-item active"><c:out value="${pendingCourse.title}" /></li>
			</ol>
			
			<ul class="nav nav-pills mb-3" id="grade-tabs" role="tablist">
				<li class="nav-item">
				    <a class="nav-link active" id="pills-home-tab" data-toggle="grade-tab" href="#pending-students" role="tab" aria-controls="pending-students" aria-selected="true">Pending Students</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link" id="pills-profile-tab" data-toggle="grade-tab" href="#graded-students" role="tab" aria-controls="graded-students" aria-selected="false">Graded Students</a>
				</li>
			</ul>

			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade active show" id="pending-students" role="tabpanel" aria-labelledby="v-pills-home-tab">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-book"></i>
							<b><c:out value="${ pendingCourse.title }" /></b>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered prof-courses" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Id</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Email</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${ pendingCourse.students }"
											var="pendingStudent">
											<tr>
												<th><c:out value="${ pendingStudent.username }" /></th>
												<th><c:out value="${ pendingStudent.name }" /></th>
												<th><c:out value="${ pendingStudent.surname }" /></th>
												<th><c:out value="${ pendingStudent.email }" /></th>
												<th><a class="btn btn-success"
													href="gradestudent?username=<c:out value="${ pendingStudent.username }" />&course_id=<c:out value="${ pendingCourse.courseId }" />">
														<i class="fas fa-plus-circle"></i> Assign
												</a></th>
											</tr>
		
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="graded-students" role="tabpanel" aria-labelledby="v-pills-home-tab">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-book"></i>
							<b><c:out value="${ gradedCourse.title }" /></b>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered prof-courses" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Id</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Email</th>
											<th>Grade</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
		
										<c:forEach items="${ gradedCourse.students }"
											var="gradedStudent">
											<tr>
												<th><c:out value="${ gradedStudent.username }" /></th>
												<th><c:out value="${ gradedStudent.name }" /></th>
												<th><c:out value="${ gradedStudent.surname }" /></th>
												<th><c:out value="${ gradedStudent.email }" /></th>
												<th style="color:red"><c:out value="${ gradedStudent.grade }" /></th>
												<th><a
													class="btn btn-warning"
													href="gradestudent?username=<c:out value="${ gradedStudent.username }" />&course_id=<c:out value="${ gradedCourse.courseId }" />">
														<i class="fas fa-edit"></i> Change
												</a></th>
											</tr>
										</c:forEach>
		
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>

	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>