<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home| Crowfly</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
form {
	top: 100px;
	padding: 30px 20px 20px 20px;
	background-color: rgb(93, 40, 140);
	border-radius: 20px;
	color: aliceblue;
	margin: 0 auto;
}
/* body {
	background-image: url('/bg-image.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
	margin: 0;
} */

input {
	background-color: transparent;
	outline: none;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
}

#swap {
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px;
	line-height: 60px;
}
</style>
</head>

<body>



	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Crowfly</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="form-inline ml-auto">
				<c:choose>
					<c:when test="${sessionScope.cust==null }">
						<a class="btn btn-outline-success my-2 my-sm-0" type="submit"
							href="/customers/login">Login/Signup</a>
					</c:when>
					<c:otherwise>
						<div class="dropdown">
							<a class="navbar-brand btn dropdown-toggle mx-5" href="#"
								role="button" data-toggle="dropdown" aria-expanded="false">
								Welcome, ${sessionScope.cust.firstName} ${sessionScope.cust.lastName}</a>

							<div
								class="dropdown-menu border-0 row justify-content-center mx-auto">
								<a href="/bookings/history/${sessionScope.custId}" class="dropdown-item">Bookings</a>
								<a href="/customers/update/${sessionScope.custId}" class="dropdown-item">Profile</a>
								<a class="dropdown-item" href="/customers/logout">Logout</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>



		</nav>
		<c:if test="${not empty msg}">
			<div class="alert alert-success alert-dismissible fade show mb-3"
				role="alert">
				${msg }
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<form action="/flight/searchFlight" method="post">
			<div class="form-row">
				<div class="form-group col-md-5">
					<label for="flightSource">Source</label> <input type="text"
						class="form-control" id="flightSource" name="flightSource" required>
				</div>
				<div class="form-group col-md-2 text-center">
					<label>&nbsp;</label><br>
					<button type="button" class="btn btn-light" id="swap">
						<img src="${pageContext.request.contextPath}\swap.png" width="25"
							height="25">
					</button>
				</div>
				<div class="form-group col-md-5">
					<label for="flightDestination">Destination</label> <input
						type="text" class="form-control" id="flightDestination"
						name="flightDestination" required>
				</div>
			</div>
			<div class="form-group">
				<label for="departureTime">Date</label> <input type="date"
					class="form-control" id="departureTime" name="departureTime" required>
			</div>
			<div class="form-group d-flex justify-content-center">
				<button type="submit" class="btn btn-primary">Search</button>
			</div>
		</form>
		
		
		
		

		<footer class="footer mt-auto py-3 bg-light">
			<div class="container text-center">
				<span class="text-muted">Follow us on:</span> <a href="#"><i
					class="fab fa-facebook-f"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a>
			</div>
		</footer>

	</div>
	<script>
		document.getElementById('swap').addEventListener('click', function() {
			var source = document.getElementById('flightSource');
			var destination = document.getElementById('flightDestination');
			var temp = source.value;
			source.value = destination.value;
			destination.value = temp;
		});
	</script>
	
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
</body>
</html>