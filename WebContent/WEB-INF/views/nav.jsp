<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page import="com.javaparttwo.model.User" %>
<%
	User user = (User)session.getAttribute("user");
%>    

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	    <a class="navbar-brand" href="<c:url value="/" />">Java Final</a>
	    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarResponsive">
	      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="" data-original-title="General course list">
	          <a class="nav-link" href="<c:url value="/courses"/>">
	            <i class="fa fa-fw fa-dashboard"></i>
	            <span class="nav-link-text">General Course List</span>
	          </a>
	        </li>
	        
			<c:if test="${ user.roleId=='secretary' }">
	        	<c:import url="/WEB-INF/views/nav-secretary.jsp"></c:import>
	        </c:if>
	        
	        <c:if test="${ user.roleId=='instructor' }">
	        	<c:import url="/WEB-INF/views/nav-professor.jsp"></c:import>
	        </c:if>
	        
	        <c:if test="${ user.roleId=='student' }">
				<c:import url="/WEB-INF/views/nav-student.jsp"></c:import>
	        </c:if>
	    	
	      </ul>
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item">
	          <a href="<c:url value="/logout"/>" class="nav-link">
	            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
	        </li>
	      </ul>
	   </div>
	</nav>