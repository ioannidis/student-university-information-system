<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Single Course</title>
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
		</ol>
	  
		<div>
			<span>Sort by:</span>
			<div class="btn-group">
				<a href="studentgrades?sortBy=average" class="btn btn-info ${sortBy == 'average' ? 'active' : ''}" >Average</a>
			    <a href="studentgrades?sortBy=list" class="btn btn-info ${sortBy == 'list' ? 'active' : ''}" >List</a>
			   	<a href="studentgrades?sortBy=semester" class="btn btn-info ${sortBy == 'semester' ? 'active' : ''}" >Semester</a>
			</div>
		</div>

		<br/>
		
		<c:choose>
			<c:when test="${sortBy == 'list'}">
				<c:import url="/WEB-INF/views/grade/sortBy/list.jsp" />
			</c:when>
			<c:when test="${sortBy == 'semester'}">
				<c:import url="/WEB-INF/views/grade/sortBy/semester.jsp" />
			</c:when>
			<c:when test="${sortBy == 'average'}">
				<c:import url="/WEB-INF/views/grade/sortBy/average.jsp" />
			</c:when>
		</c:choose>

	  </div>
	  <c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
	
	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>