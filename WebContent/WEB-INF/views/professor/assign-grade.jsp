<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Professor | Assign Grade</title>
	<c:import url="/WEB-INF/views/styles.jsp"></c:import>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top" cz-shortcut-listen="true">

	<!-- Navigation -->
	<c:import url="/WEB-INF/views/nav.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">
		
			<ol class="breadcrumb">
				<li class="breadcrumb-item text-primary">
					Professor
				</li>
				<li class="breadcrumb-item text-primary">
					Grade Student
				</li>
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