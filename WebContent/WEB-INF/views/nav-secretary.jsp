<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Secretary Actions">
	<a class="nav-link" href="#" style="color:#fff !important; padding-bottom: 0px;">
		<b>Secretary Actions</b>
	</a>
	
	<ul class="sidenav-second-level">
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Manage Courses">
			<a class="nav-link" href="<c:url value="/secretary"/>">
				<i class="fa fa-fw fa-dashboard"></i>
				<span class="nav-link-text">Manage Courses</span>
			</a>
		</li>
	</ul>
</li>