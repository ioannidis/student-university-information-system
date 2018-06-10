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
	<c:import url="/WEB-INF/views/nav.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">

			<ol class="breadcrumb">
				<li class="breadcrumb-item text-primary">Professor</li>
				<li class="breadcrumb-item active">Grade Students</li>
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
				<c:forEach items="${ courses }" var="status">
					<div class="tab-pane fade ${status.key == 'pending' ? 'active show' : ''}" id="<c:out value="${ status.key }" />-students" role="tabpanel" aria-labelledby="v-pills-home-tab">

							<c:forEach items="${ status.value }" var="course">
								
								<c:choose>
									<c:when test="${status.key == 'pending'}">
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
						
															<c:forEach items="${ course.students }"
																var="pendingStudent">
						
																<tr>
																	<th><c:out value="${ pendingStudent.name }" /></th>
																	<th><c:out value="${ pendingStudent.surname }" /></th>
																	<th><c:out value="${ pendingStudent.email }" /></th>
																	<th>-</th>
																</tr>
						
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<div class="card-footer">
												<a
													href="gradestudents?course_id=<c:out value="${ course.courseId }" />"
													class="btn btn-primary"> <i class="fas fa-users"></i> Grade
													Students
												</a>
											</div>
										</div>
									</c:when>
									<c:when test="${status.key == 'graded'}">
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
						
															<c:forEach items="${ course.students }"
																var="gradedStudent">
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
									</c:when>
								</c:choose>
								
							</c:forEach>
					</div>
					
				
				
					
				</c:forEach>
			</div>

		</div>

		<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>

	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>