<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Professor | View Courses</title>
<c:import url="/WEB-INF/views/styles.jsp"></c:import>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top"
	cz-shortcut-listen="true">
	<c:import url="/WEB-INF/views/nav.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">

			<ol class="breadcrumb">
				<li class="breadcrumb-item text-primary"><a href="instructor">Professor</a></li>
				<li class="breadcrumb-item active">View Courses</li>
			</ol>

			<div class="card-columns">
				<c:forEach items="${ courses }" var="courses">
					<div class="card">
						<div class="card-header">
							<i class="fas fa-graduation-cap"></i><b><c:out value="${ courses.title }" /></b>
						</div>
						<div class="card-body">
							<h6 class="card-title">Information</h6>
							<p class="card-text">
								ID:
								<strong><c:out value="${ courses.courseId }" /></strong>
								<br />
								ECTs:
								<strong><c:out value="${ courses.ects }" /></strong>
								<br />
								Teaching Hours:
								<strong><c:out value="${ courses.teachingHours }" /></strong>
								<br />
								Semester:
								<strong><c:out value="${ courses.semester }" /></strong>
							</p>
						</div>
						<div class="card-footer">
							<a href="gradestudents?course_id=<c:out value="${ courses.courseId }" />" class="btn btn-primary">
								<i class="fas fa-users"></i>
								Grade Students
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>

	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>