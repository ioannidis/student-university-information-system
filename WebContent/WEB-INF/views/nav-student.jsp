<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Student Actions">
	<a class="nav-link" href="#" style="color:#fff !important; padding-bottom: 0px;">
		<b>Student Actions</b>
	</a>
	<ul class="sidenav-second-level">
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Manage Courses">
			<a class="nav-link" href="<c:url value="/studentgrades"/>">
				<i class="fa fa-fw fa-dashboard"></i>
				<span class="nav-link-text">Grades</span>
			</a>
		</li>
	</ul>
</li>