<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Edit: ${course.title}</h1>
	<form action="courses?id=${course.courseId}&action=edit" method="POST">
		<label for="title"><strong>Course Title</strong></label>
		<br />
		<input type="text" name="title" id="title" value="${course.title}" />
		
		<br />
		<br />
		
		<label for="ects"><strong>Course ECTs</strong></label>
		<br />
		<input type="text" name="ects" id="ects" value="${course.ects}" />
		
		<br />
		<br />
		
		<label for="teachingHours"><strong>Teaching Hours</strong></label>
		<br />
		<input type="text" name="teachingHours" id="teachingHours" value="${course.teachingHours}" />
		
		<br />
		<br />
		
		<label for="teachingInstructor"><strong>Select Instructor</strong></label>
		<br />
		<select name="teachingInstructor" id="teachingInstructor">
			<c:forEach items="${ instructors }" var="professor">
				<option value="<c:out value="${ professor.username }" />">
					<c:out value="${ professor.name } ${ professor.surname } (${ professor.username})" />
				</option>
			</c:forEach>
		</select>
		
		<br />
		<br />
		
		<input type="submit" value="Update Course" />
	</form>
</body>
</html>