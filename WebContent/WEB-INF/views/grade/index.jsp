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
	  
		<div class="btn-group">
			    <a href="studentgrades?sortBy=all" class="btn btn-info ${sortBy == 'list' ? 'active' : ''}" >List</a>

		    	<a href="studentgrades?sortBy=semester" class="btn btn-info ${sortBy == 'semester' ? 'active' : ''}" >Semester</a>

		    	<a href="studentgrades?sortBy=average" class="btn btn-info ${sortBy == 'average' ? 'active' : ''}" >Average</a>
		</div>
		
		<c:if test="${sortBy == 'semester'}">
			<c:import url="/WEB-INF/views/grade/sortBy/semester.jsp" />
		</c:if>
	  </div>
	  <c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
	
	<c:import url="/WEB-INF/views/scripts.jsp"></c:import>
</body>
</html>