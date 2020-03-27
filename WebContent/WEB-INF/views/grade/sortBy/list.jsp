<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<div class="card mb-3">
	<div class="card-header">
		<i class="fa fa-table"></i><b>Course list</b>
	</div>
    <div class="card-body">
      	<div class="table-responsive">
			<table class="table table-bordered table-striped" id="dataTable-list" width="100%" cellspacing="0">	
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Ects</th>
						<th>Teaching Hours</th>
						<th>Semester</th>
						<th>Grade</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grades}" var="grade" varStatus="loop">
				        <tr>
							<th><c:out value="${grade.courseId}" /></th>
							<th><c:out value="${grade.title}" /></th>
							<th><c:out value="${grade.ects}" /></th>
							<th><c:out value="${grade.teachingHours}" /></th>
							<th><c:out value="${grade.semester}" /></th>
							<th>
								<c:choose>
								    <c:when test="${grade.grade=='-1'}">
								        <span style="color:red">-</span>
								    </c:when>    
								    <c:otherwise>
								        <span style="color:red"><c:out value="${grade.grade}" /></span>
								    </c:otherwise>
								</c:choose>
							</th>
							<th><a class="btn btn-primary" href="studentgrades?courseId=${grade.courseId}"><i class="fas fa-external-link-alt" style="margin-right:8px"></i>Show</a></th>
						</tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
					