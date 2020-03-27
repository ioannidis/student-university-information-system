<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Student |  Single course</title>
		<c:import url="/WEB-INF/views/styles.jsp"></c:import>
	</head>
	<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">
		
		<!-- Navigation -->
		<c:import url="/WEB-INF/views/nav.jsp"></c:import>
	  
		<div class="content-wrapper">
			<div class="container-fluid">
			
				<ol class="breadcrumb">
					<li class="breadcrumb-item text-primary"><a href="student" >Student</a></li>
					<li class="breadcrumb-item text-primary"><a href="studentgrades" >Grades</a></li>
					<li class="breadcrumb-item active"><c:out value="${grade.title}" /></li>
				</ol>
			
				<div class="card mb-3">
			        <div class="card-header">
			        	<i class="fa fa-table"></i><b>Course</b>
			        </div>
		       <div class="card-body">
		         	<div class="table-responsive">
						<table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
							<tbody>
								<tr>
									<td><b>Id</b></td>
									<td><c:out value="${grade.courseId}" /></td>
								</tr>
								<tr>
									<td><b>Title</b></td>
									<td><c:out value="${grade.title}" /></td>
								</tr>
								<tr>
									<td><b>Ects</b></td>
									<td><c:out value="${grade.ects}" /></td>
								</tr>
								<tr>
									<td><b>Teaching Hours</b></td>
									<td><c:out value="${grade.teachingHours}" /></td>
								</tr>
								<tr>
									<td><b>Instructor</b></td>
									<td><c:out value="${grade.instructorUsername}" /></td>
								</tr>
								<tr>
									<td><b>Semester</b></td>
									<td><c:out value="${grade.semester}" /></td>
								</tr>
								<tr>
									<td><b>Grade</b></td>
									<td><span style="color:red">
										<c:choose>
										    <c:when test="${grade.grade=='-1'}">
										        - 
										    </c:when>    
										    <c:otherwise>
										        <c:out value="${grade.grade}" />
										    </c:otherwise>
										</c:choose>
								</tr>
						        <tr>
						        	<td><b>Actions</b></td>
									<td>
										<a class="btn btn-warning" href="studentgrades"><i class="fas fa-caret-left" style="margin-right:8px"></i>Back</a>
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