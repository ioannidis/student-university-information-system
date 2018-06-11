<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Professor | Grade Student</title>
	<c:import url="/WEB-INF/views/styles.jsp"></c:import>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">

	<!-- Navigation -->
	<c:import url="/WEB-INF/views/nav.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">
		
			<ol class="breadcrumb">
				<li class="breadcrumb-item text-primary"><a href="instructor">Professor</a></li>
				<li class="breadcrumb-item text-primary"><a href="gradestudents?course_id=<c:out value="${course.courseId}" />">Grade  Student</a></li>
				<li class="breadcrumb-item active">
					<c:out value="${student.fullName}" />
				</li>
			</ol>

		
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-edit"></i>Grade Student
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-striped" id="dataTable"
							width="100%" cellspacing="0">
							<tbody>
								<tr>
									<td><b>Course</b></td>
									<td><c:out value="${course.title}" /></td>
								</tr>
								<tr>
									<td><b>Id</b></td>
									<td><c:out value="${student.username}" /></td>
								</tr>
								<tr>
									<td><b>First Name</b></td>
									<td><c:out value="${student.name}" /></td>
								</tr>
								<tr>
									<td><b>Last Name</b></td>
									<td><c:out value="${student.surname}" /></td>
								</tr>
								<tr>
									<td><b>Email</b></td>
									<td><c:out value="${student.email}" /></td>
								</tr>
								<tr>
									<td><b>Grade</b></td>
									<td>
										<form class="form-inline" action="gradestudent?username=<c:out value="${ username }" />&course_id=<c:out value="${ courseId }" />" method="post">
											<input type="number" min="0" max="10" value="<c:out value="${ grade }" />" class="form-control col-md-2" name="grade" placeholder="Grade" required>
											<button type="submit" class="btn btn-success ml-2"><i class="far fa-save" style="margin-right:8px"></i>Save</button>
										</form>
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