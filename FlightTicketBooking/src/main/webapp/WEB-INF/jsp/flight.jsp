<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home| Crowfly</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<style>
form {
	top: 100px;
	padding: 30px 20px 20px 20px;
	background-color: rgb(93, 40, 140);
	border-radius: 20px;
	color: aliceblue;
	margin: 0 auto;
}

input {
	background-color: transparent;
	outline: none;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
	0
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
								Welcome, ${sessionScope.cust.firstName}
								${sessionScope.cust.lastName}</a>

							<div
								class="dropdown-menu border-0 row justify-content-center mx-auto">
								<a class="dropdown-item" href="/bookings/history/${sessionScope.custId}">Bookings</a>
								<a class="dropdown-item" href="/customers/index">Home</a>
								<a class="dropdown-item" href="/customers/logout">Logout</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
		<div class="row justify-content-center m-3">
			<table class="table">
				<thead class="thead-dark">
					<tr class="justify-content-center">
						<th scope="col">Flight ID</th>
						<th scope="col">Flight Name</th>
						<th scope="col">Time</th>
						<th scope="col">Price</th>
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
								<form method="post" action="/bookings/book">
								<c:choose>
								<c:when test="${sessionScope.cust!=null }">
								<input type="number" id="customerID" name="customerID" value=${sessionScope.cust.customerID} style="display:none;">
								</c:when>
								</c:choose>
								<tr class="justify-content-center">
									<td><input type="number" id="flightid" name="flightid" value="${flight.flightID}" readonly></td>
									<td><input type="text" id="flightName" name="flightName" value="${flight.flightName}" readonly></td>
									<td><input type="text" id="timeString" name="timeString" value="${flight.timeString}" readonly></td>
									<td><input type="number" id="totalPrice" name="totalPrice" value="${flight.price}" readonly></td>
									<!-- <td></td>  -->
									<td><input type="submit" value="Book Flight" class="btn btn-outline-success mx-auto"></td>
								</tr>
								</form>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
</div>
		</div>
</body>
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
</html>