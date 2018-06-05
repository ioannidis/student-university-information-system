<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<c:forEach items="${grades}" var="courses" varStatus="loop">
<c:out value="${grade}" />
<div class="card mb-3">
	<div class="card-header">
		<i class="fa fa-table"></i><b>Semester ${loop.index + 1}</b>
	</div>
    <div class="card-body">
      	<div class="table-responsive">
      		<c:if test="${empty courses}">
				<p><b>No courses available. Please contact the secretary of your department!</b></p>
			</c:if>
			<c:if test="${!empty courses}">        
			<table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">	
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Ects</th>
						<th>Teaching Hours</th>
						<th>Grade</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${courses}" var="grade">
				        <tr>
							<th><c:out value="${grade.courseId}" /></th>
							<th><c:out value="${grade.title}" /></th>
							<th><c:out value="${grade.ects}" /></th>
							<th><c:out value="${grade.teachingHours}" /></th>
							<th>
								<c:choose>
								    <c:when test="${grade.grade=='-1'}">
								        - 
								    </c:when>    
								    <c:otherwise>
								        <c:out value="${grade.grade}" />
								    </c:otherwise>
								</c:choose>
							</th>
							<th><a class="btn btn-primary" href="studentgrades?courseId=${grade.courseId}" class="btn">Show</a></th>
						</tr>
				    </c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>
</div>
</c:forEach>
					