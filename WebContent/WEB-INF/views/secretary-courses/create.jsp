<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Secretary Management</title>
		<c:import url="/WEB-INF/views/styles.jsp"></c:import>
	</head>
	<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">

		<!-- Navigation -->
		<c:import url="/WEB-INF/views/nav.jsp"></c:import>
	
  
		<div class="content-wrapper">
			<div class="container-fluid">
			
				<ol class="breadcrumb">
					<li class="breadcrumb-item text-primary"><a href="student" >Home</a></li>
					<li class="breadcrumb-item text-primary"><a href="secretarycourses" >Cousres</a></li>
					<li class="breadcrumb-item text-secondary">Create course</li>
				</ol>
				
		    	<div class="card mb-3">
		        	<div class="card-header">
		         		<i class="fa fa-table"></i><b>Edit course</b>
		         	</div>
		       		<div class="card-body">
						<form action="secretarycourses?action=save" method="POST">
						<div class="form-group">
								<label for="title"><strong>Course Id</strong></label>
								<input type="text" class="form-control"  name="id" id="id" value="" required/>
							</div>
							<div class="form-group">
								<label for="title"><strong>Course Title</strong></label>
								<input type="text" class="form-control"  name="title" id="title" value="" required />
							</div>
							<div class="form-group">
								<label for="ects"><strong>Semester</strong></label>
								<input type="number" min="1" max="8" class="form-control"  name="semester" id="semester" value="" required/>
							</div>
							<div class="form-group">
								<label for="ects"><strong>Course ECTs</strong></label>
								<input type="number" min="0" max="10" class="form-control"  name="ects" id="ects" value="" required/>
							</div>
							<div class="form-group">
								<label for="teachingHours"><strong>Teaching Hours</strong></label>
								<input type="number" min="1" max="100" class="form-control"  name="teachingHours" id="teachingHours" value="" required />
							</div>
							<div class="form-group">
							<label for="teachingInstructor"><strong>Select Instructor</strong></label>
								<select class="form-control" name="teachingInstructor" id="teachingInstructor" required>
									<c:forEach items="${ instructors }" var="professor">
										<option value="<c:out value="${ professor.username }"/>" >
											<c:out value="${ professor.name } ${ professor.surname } (${ professor.username})" />
										</option>
									</c:forEach>
								</select>
							</div>
							<br />
							<input type="submit" class="btn btn-success" value="Save" />
							<a href="<c:url value="secretarycourses"/>" class="btn btn-warning">Cancel</a>
						</form>
		 			</div>
		      </div>
		  </div>
		  <c:import url="/WEB-INF/views/footer.jsp"></c:import>
		</div>
	
		<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
	
	</body>
</html>