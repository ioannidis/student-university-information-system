<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Professor Actions">
	<a class="nav-link" href="#" style="color:#fff !important; padding-bottom: 0px;">
		<b>Professor Actions</b>
	</a>
	<ul class="sidenav-second-level">
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="View Assigned Courses">
			<a class="nav-link" href="<c:url value="/instructor"/>">
				<i class="fa fa-fw fa-dashboard"></i>
				<span class="nav-link-text">View Courses</span>
			</a>
		</li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Grade Students">
			<a class="nav-link" href="<c:url value="/instructor/grade"/>">
				<i class="fa fa-fw fa-dashboard"></i>
				<span class="nav-link-text">Grade Students</span>
			</a>
		</li>
	</ul>
</li>