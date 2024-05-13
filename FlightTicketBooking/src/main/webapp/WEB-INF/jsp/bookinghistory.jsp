<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>History| Crowfly</title>
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
								Welcome, ${sessionScope.cust.firstName}
								${sessionScope.cust.lastName}</a>

							<div
								class="dropdown-menu border-0 row justify-content-center mx-auto">
								<a class="dropdown-item"
									href="/bookings/history/${sessionScope.custId}">Bookings</a> <a
									class="dropdown-item" href="/customers/index">Home</a> <a
									class="dropdown-item" href="/customers/logout">Logout</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>

		<table class="table table-striped table-dark">
			<thead>
				<tr>
					<th scope="col">Booking Id</th>
					<th scope="col">Flight Id</th>
					<th scope="col">Flight Name</th>
					<th scope="col">Departure Date</th>
					<th scope="col">Flight Timing</th>
					<th scope="col">Booking Date</th>
					<th scope="col">Customer Id</th>
					<th scope="col">Passengers</th>
					<th scope="col">Fare</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookings}">
					<tr>
						<th scope="row">${booking.bookingID }</th>
						<td>${booking.flightid }</td>
						<td>${booking.flightName }</td>
						<td>${booking.departureTime }</td>
						<td>${booking.timeString }</td>
						<td>${booking.bookingDate}</td>
						<td>${booking.customerID }</td>
						<td>${booking.numberofseats }</td>
						<td>${booking.totalPrice }</td>
						<td><a class="btn btn-danger" href="/bookings/cancel/${booking.bookingID }">Cancel</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>



	</div>




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