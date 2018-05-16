<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Secretary Management</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Ects</th>
				<th>Teaching Hours</th>
				<th>Instructor</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${courses}" var="course">
		        <tr>
					<th><c:out value="${course.courseId}" /></th>
					<th><c:out value="${course.title}" /></th>
					<th><c:out value="${course.ects}" /></th>
					<th><c:out value="${course.teachingHours}" /></th>
					<th><c:out value="${course.instructorUsername}" /></th>
					<th>
						<a href="courses?id=${course.courseId}" class="btn">Show</a>
						<a href="courses?id=${course.courseId}&action=edit" class="btn">Edit</a>
						<a href="courses?id=${course.courseId}&action=delete" class="btn">Delete</a>
					</th>
				</tr>
		    </c:forEach>
		</tbody>
	</table>

</body>
</html>