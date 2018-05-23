<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Java Part Two Login</title>
  <!-- Bootstrap core CSS-->
  <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<c:url value="/assets/css/sb-admin.min.css"/>" rel="stylesheet">
</head>
<body class="bg-dark">
 	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Login</div>
	        <div class="card-body">
				<form method="post" action="login">
					<div class="form-group">
						<label for="username">Username</label>
						<input id="username" class="form-control" type="text" name="username" placeholder="Username" />
					</div>
					<div class="form-group">
						<label for="password">Password</label>
						<input id="password" class="form-control" type="password" name="password" placeholder="Password" />
					<div class="form-group">
					<br/>
					<input  type="submit" class="btn btn-primary btn-block" value="Log in">
				</form>
      		</div>
    	</div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="/assets/js/jquery.min.js"/>"></script>
  <script src="<c:url value="/assets/js/bootstrap.bundle.min.js"/>"></script>
  <!-- Core plugin JavaScript-->
  <script src="<c:url value="/assets/js/jquery.easing.min.js"/>"></script>
</body>
</html>