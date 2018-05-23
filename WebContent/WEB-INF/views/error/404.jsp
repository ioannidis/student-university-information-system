<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>404 - Not Found</title>
<!-- Bootstrap core CSS-->
  	<link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
  	<style>
  	body { background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMC8yOS8xMiKqq3kAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABHklEQVRIib2Vyw6EIAxFW5idr///Qx9sfG3pLEyJ3tAwi5EmBqRo7vHawiEEERHS6x7MTMxMVv6+z3tPMUYSkfTM/R0fEaG2bbMv+Gc4nZzn+dN4HAcREa3r+hi3bcuu68jLskhVIlW073tWaYlQ9+F9IpqmSfq+fwskhdO/AwmUTJXrOuaRQNeRkOd5lq7rXmS5InmERKoER/QMvUAPlZDHcZRhGN4CSeGY+aHMqgcks5RrHv/eeh455x5KrMq2yHQdibDO6ncG/KZWL7M8xDyS1/MIO0NJqdULLS81X6/X6aR0nqBSJcPeZnlZrzN477NKURn2Nus8sjzmEII0TfMiyxUuxphVWjpJkbx0btUnshRihVv70Bv8ItXq6Asoi/ZiCbU6YgAAAABJRU5ErkJggg==);}
	.error-template {padding: 40px 15px;text-align: center;}
	.error-actions {margin-top:15px;margin-bottom:15px;}
	.error-actions .btn { margin-right:10px; }
  	</style>
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	            <div class="error-template">
	                <h1>
	                    Oops!</h1>
	                <h2>
	                    404</h2>
	                <div class="error-details">
	                    Not Found!
	                </div>
	                <div class="error-actions">
	                    <a href="<c:url value="/"/>" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
	                        Go Back</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>