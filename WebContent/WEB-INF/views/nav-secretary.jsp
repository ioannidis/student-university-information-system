<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Secretary Actions">
	<a class="nav-link" href="#" style="color:#fff !important; padding-bottom: 0px;">
		<b>Secretary Actions</b>
	</a>
	
	<ul class="sidenav-second-level">
	<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="View Assigned Courses">
			<a class="nav-link" href="<c:url value="/secretary"/>">
				<span class="nav-link-text">
					<i class="fas fa-home"></i>
					Home
				</span>
			</a>
		</li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Manage Courses">
			<a class="nav-link" href="<c:url value="/secretarycourses"/>">
				<i class="fa fa-fw fa-bookmark"></i>
				<span class="nav-link-text">Manage Courses</span>
			</a>
		</li>
	</ul>
</li>