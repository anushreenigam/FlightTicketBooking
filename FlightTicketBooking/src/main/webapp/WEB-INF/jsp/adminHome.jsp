<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<style>
body, .navbar-custom {
	/* background-image: url("${pageContext.request.contextPath}\back.webp");
	background-color: #5cdb95; */
	/*background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);*/
	background-color: #cccccc;
}

.userprofile {
	background-color: #022950;
	border-radius: 25px;
	color: white;
	/*font-size: larger;*/
	font-family: "Lucida Console", "Courier New", monospace;
}

input {
	opacity: 0.8;
}

.userprofileForm {
	border-radius: 25px;
}

.nav-link {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: 200;
	color: #022950;
}

.navbar-brand {
	color: #022950;
	font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande',
		'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
	font-weight: 400;
}

.card {
	background-color: #557a95;
	border-radius: 25px;
}

.card-text, h5 {
	color: #d4bfae;
}

#video-container {
	position: fixed;
/* 	top: 0;
	left: 0; */
	width: 120px !important;
	height: 100px !important;
	z-index: -1; /* Ensures the video stays behind other elements */
}
}
</style>
<title>Admin|Home</title>
</head>
<body>
	<%
	session = request.getSession();
	Object attribute = session.getAttribute("customer");
	if (attribute == null || !attribute.equals("Admin")) {
		response.sendRedirect("/customers/index");
		return;
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand mx-3" style="font-weight: bolder;">Crowfly
		</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item ${req == '' ? 'active' : ''} mx-2"><a
					class="nav-link" href="/admin/home">Home</a></li>
				<li class="nav-item ${req == 'customers' ? 'active' : ''} mx-2"><a
					class="nav-link" href="/admin/allCustomers">Customers</a></li>
				<li class="nav-item ${req == 'flights' ? 'active' : ''} mx-2">
					<a class="nav-link" href="/admin/allFlights">Flights</a>
				</li>
				<li class="nav-item mx-2 ${req == 'addFlight' ? 'active' : ''}"><a
					class="nav-link" href="/admin/addFlight">Add Flights</a></li>
			</ul>
		</div>

		<div class="form-inline">
			<div class="dropdown">
				<a class="navbar-brand btn dropdown-toggle mx-5" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false"
					style="font-weight: bolder;"> Welcome Admin </a>

				<div class="dropdown-menu">
					<a class="dropdown-item" href="/admin/logout">Logout</a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Add other elements and content here -->
	<div>
		<!-- Nav Bar -->


		<!-- alerts -->
		<c:if test="${not empty msg}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				${msg }
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>

		<c:if test="${not empty errors}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				${errors }
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>

		<!-- Body Part -->
		<div class="container mx-auto row">

			<!-- Chooses between Flights and Customers -->
			<c:choose>
				<c:when test="${req==''}">
					<!-- The video -->
					
						<video autoplay loop muted style="width: 100%;height: 100%">
							<source src="/HomePageVideo.mp4" type="video/mp4">
							<!-- Add fallback content here if needed -->
						</video>
				
				</c:when>

				<c:when test="${req=='customers'}">
					<table class="table table-striped my-3">
						<thead class="thead-dark">
							<tr class="justify-content-center">
								<th scope="col">Customer ID</th>
								<th scope="col">User Name</th>
								<th scope="col">Email</th>
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Contact Number</th>
								<th scope="col">Aadhaar Number</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(customers) == 0}">
									<tr class="justify-content-center">
										<td colspan="5" class="text-center">No data found</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="customer" items="${customers}">
										<tr class="justify-content-center">
											<td>${customer.customerID}</td>
											<td>${customer.userName}</td>
											<td>${customer.email}</td>
											<td>${customer.firstName}</td>
											<td>${customer.lastName}</td>
											<td>${customer.contactNumber}</td>
											<td>${customer.aadhaarNumber}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</c:when>

				<c:when test="${req=='flights'}">
					<table class="table table-striped my-3">
						<thead class="thead-dark">
							<tr class="justify-content-center">
								<th scope="col">Flight ID</th>
								<th scope="col">Flight Name</th>
								<th scope="col">Source</th>
								<th scope="col">Destination</th>
								<th scope="col">Available Seats</th>
								<th scope="col">Departure Time</th>
								<th scope="col">Time</th>

								<th scope="col"></th>

							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(flights) == 0}">
									<tr class="justify-content-center">
										<td colspan="5" class="text-center">No data found</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="flight" items="${flights}">
										<tr class="justify-content-center">
											<td>${flight.flightID}</td>
											<td>${flight.flightName}</td>
											<td>${flight.flightSource}</td>
											<td>${flight.flightDestination}</td>
											<td>${flight.availableSeats}</td>
											<td>${flight.departureTime}</td>
											<td>${flight.timeString}</td>


											<td><a onclick="deleteFlight(${flight.flightID})"
												class="btn btn-outline-danger mx-auto">Delete Flight</a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</c:when>
				<c:when test="${req=='addFlight'}">
					<div class="row justify-content-center container my-3">
						<h2>Add Flight</h2>
					</div>
					<div class="container w-75">

						<form action="/admin/addFlight" method="POST">
							<div class="form-group row ">
								<label for="flightName" class="col-sm-2 col-form-label">Flight
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="flightName"
										name="flightName" required>
								</div>
							</div>
							<div class="form-group row ">
								<label for="departureTime" class="col-sm-2 col-form-label">Departure
									Time</label>
								<div class="col-sm-10">
									<input type="date" class="form-control" id="departureTime"
										name="departureTime" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="arrivalTime" class="col-sm-2 col-form-label">Arrival
									Time</label>
								<div class="col-sm-10">
									<input type="date" class="form-control float-right"
										id="arrivalTime" name="arrivalTime" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="flightSource" class="col-sm-2 col-form-label">Source</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="flightSource"
										name="flightSource" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="flightDestination" class="col-sm-2 col-form-label">Destination</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="flightDestination"
										name="flightDestination">
								</div>
							</div>
							<div class="form-group row">
								<label for="availableSeats" class="col-sm-2 col-form-label">Available
									Seats</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="availableSeats"
										name="availableSeats" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="timeString" class="col-sm-2 col-form-label">Time</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="timeString"
										name="timeString" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="price" class="col-sm-2 col-form-label">Price</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="price"
										name="price" required>
								</div>
							</div>
							<div class="row justify-content-center my-4">
								<button type="submit" class="btn btn-outline-dark">Submit</button>
							</div>
						</form>
					</div>
				</c:when>

			</c:choose>
		</div>

		<!-- Delete Flight Modal -->
		<div class="modal fade" id="deleteFlightModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete this Flight!</p>
					</div>
					<form action="/admin/deleteFlight" method="post"
						class="modal-footer">
						<input type="hidden" id="flightID" name="flightID"> <input
							class="btn btn-danger" type="submit" value="Delete Flight">
					</form>
				</div>
			</div>
		</div>

	</div>

	<!-- Displays Delete Flight modal -->
	<script>
	function deleteFlight(flightId) {
    // Set the modal input
    console.log("Hi!!");
    	document.getElementById("flightID").value = flightId;
    // Show the modal
    $("#deleteFlightModal").modal("show");
  }
var video = document.getElementById("myVideo");

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
</body>
</html>