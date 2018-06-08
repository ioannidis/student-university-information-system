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
				<li class="breadcrumb-item text-primary">Professor</li>
				<li class="breadcrumb-item text-primary">Grade Students</li>
				<li class="breadcrumb-item active"><c:out
						value="${course.title}" /></li>
			</ol>

			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-book"></i>
					<c:out value="${ course.title }" />
				</div>
				<div class="card-body">
					<h5 class="card-title">Pending Students</h5>
					<div class="table-responsive">
						<table class="table table-bordered prof-courses" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Grade</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${ course.pendingStudents }"
									var="pendingStudent">

									<tr>
										<th><c:out value="${ pendingStudent.name }" /></th>
										<th><c:out value="${ pendingStudent.surname }" /></th>
										<th><c:out value="${ pendingStudent.email }" /></th>
										<th><a class="btn btn-success"
											href="gradestudent?username=<c:out value="${ pendingStudent.username }" />&course_id=<c:out value="${ course.courseId }" />">
												<i class="fas fa-plus-circle"></i> Assign
										</a></th>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-book"></i>
					<c:out value="${ course.title }" />
				</div>
				<div class="card-body">
					<h5 class="card-title">Graded Students</h5>
					<div class="table-responsive">
						<table class="table table-bordered prof-courses" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Grade</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${ course.gradedStudents }"
									var="gradedStudent">
									<tr>
										<th><c:out value="${ gradedStudent.name }" /></th>
										<th><c:out value="${ gradedStudent.surname }" /></th>
										<th><c:out value="${ gradedStudent.email }" /></th>
										<th><span class="mr-2"><c:out
													value="${ gradedStudent.grade }" /></span> <a
											class="btn btn-warning"
											href="gradestudent?username=<c:out value="${ gradedStudent.username }" />&course_id=<c:out value="${ course.courseId }" />">
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
		<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>

	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>