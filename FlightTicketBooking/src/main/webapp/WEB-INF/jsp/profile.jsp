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
	
    <title>Profile| Crowfly</title>
    <style>
      .container {
        background-image: linear-gradient(rgb(62, 200, 254),white);
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.15);
      }
    .signupform {
      background-image: linear-gradient(white,rgb(62, 200, 254));
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.15);
      }
      .form-control {
        box-shadow: 0 0 10px 0 rgba(0,0,0,.1);
      }
      .navbar-custom{
    background-color: transparent;
    font-weight: bolder;
    font-size: larger;
  }
  input{
    opacity: 0.5;
    width: 50%;
  }
    </style>
  </head>
  <body>
    <!-- Image and text -->
    <div class="container">
<nav class="navbar navbar-custom">
    <a class="navbar-brand" href="#">
      <!--<img src="/docs/4.6/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">-->
      Crowfly
    </a>
     <div class="form-inline ml-auto">
        
        <a class="btn btn-outline-light my-2 my-sm-0" type="submit" href="/customers/index">Home</a>
      </div>
  </nav>

  <div class="container mx-auto my-5 signupform" style="width:50%;">
    <div class="row justify-content-center my-5">
    <h2 class=>PROFILE UPDATE</h2>
    </div>
    <form action="/customers/updateCustomer" method ="POST">
    <input type="number" class="form-control" id="customerID" name="customerID" value=${customer.customerID } style="display:none;" required>
        <div class="form-group row ">
          <label for="email" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="email" name="email" value=${customer.email } required>
          </div>
        </div>
        <div class="form-group row mb-5">
          <label for="userPassWord" class="col-sm-2 col-form-label">Password</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="userPassWord" name="userPassWord" value=${customer.userPassWord } required>
          </div>
        </div>
        <div class="form-group row">
            <label for="confirmpassword" class="col-sm-2 col-form-label">Confirm Password</label>
            <div class="col-sm-10">
              <input type="text" class="form-control float-right" id="confirmpassword" name="confirmpassword" value=${customer.userPassWord } required>
            </div>
        </div>
        <div class="form-group row">
            <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="firstName" name="firstName" value=${customer.firstName } readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="lastName" class="col-sm-2 col-form-label">Last Name</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lastName" name="lastName" value=${customer.lastName } readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="userName" class="col-sm-2 col-form-label">User Name</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="userName" name="userName" value=${customer.userName } readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="contactNumber" class="col-sm-2 col-form-label">Contact Number</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="contactNumber" name="contactNumber" value=${customer.contactNumber } required>
            </div>
        </div>
        <div class="form-group row">
            <label for="aadhaarNumber" class="col-sm-2 col-form-label">Aadhaar Number</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="aadhaarNumber" name="aadhaarNumber" value=${customer.aadhaarNumber } readonly>
            </div>
        </div>        
        <div class="row justify-content-center my-4">
        <button type="submit" class="btn btn-outline-dark">Save</button>
    </div>
      </form>

    </div>
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