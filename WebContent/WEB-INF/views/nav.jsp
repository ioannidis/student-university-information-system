<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page import="com.javaparttwo.model.User" %>
<%
	User user = (User)session.getAttribute("user");
%>    

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	    <a class="navbar-brand" href="<c:url value="/" />">Java Part Two</a>
	    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarResponsive">
	      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="General course list">
	          <a class="nav-link" href="<c:url value="/courses"/>">
	            <i class="fa fa-fw fa-dashboard"></i>
	            <span class="nav-link-text">General course list</span>
	          </a>
	        </li>
	        
	        <!-- Role specific menu  -->
	        <c:if test="${user.roleId=='secretary'}">
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
	        </c:if>
	        <!-- End role specific menu  -->
	        
	        <!-- Role specific menu  -->
	        <c:if test="${user.roleId=='student'}">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="Secretary Actions">
	        	<a class="nav-link" href="#" style="color:#fff !important; padding-bottom: 0px;">
	        		<b>Secretary Actions</b>
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
	        </c:if>
	        <!-- End role specific menu  -->
	    	
	      </ul>
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item">
	          <a href="<c:url value="/logout"/>" class="nav-link">
	            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
	        </li>
	      </ul>
	   </div>
	</nav>