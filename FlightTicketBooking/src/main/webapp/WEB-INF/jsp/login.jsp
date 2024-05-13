<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Login| Crowfly</title>
    <style>
      /* body {
        background-image: url('C:\Users\2308936\OneDrive - Cognizant\Desktop\Login Image.jpg') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
      } */
      /* body{
        background-image: linear-gradient(rgb(62, 200, 254),white);
      } */
      .container {
        background-image: linear-gradient(rgb(62, 200, 254),white);
        padding: 30px;
        border-radius: 30px;
        box-shadow: 0px 0px 30px rgba(0,0,0,0.15);
      }
      .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        box-shadow: 0 0 10px 0 rgba(0,123,255,.5);
      }
      .btn-primary:hover {
        background-color: #0069d9;
        border-color: #0062cc;
      }
      .form-control {
        box-shadow: 0 0 10px 0 rgba(0,0,0,.1);
      }
      .message-style {
    color: #dc3545; /* This will make the text color red */
    font-weight: bold; /* This will make the text bold */
    margin-top: 10px; /* This will add some space above the message */
  }
  .navbar-custom{
    background-color: transparent;
    font-weight: bolder;
    font-size: larger;
  }
  input{
    opacity: 0.5;
  }
  .form-group{
            color: white;
            padding-top:10px;
            padding-right:20px;
            padding-left:20px;
            font-size: x-large;
        }
        input{
            background: rgba(0,0,0,0);
            opacity: 0.5;
            border: none;
            outline: none;
        }
        label{
            font-size: x-large;
        }
  /* form{
    background-image: url('https://img.freepik.com/free-photo/small-plane-with-trace-seashells_23-2148169792.jpg?size=626&ext=jpg&ga=GA1.1.715427508.1706858686&semt=ais');
  } */
    </style>
  </head>
  <body>
    <div class="container pb-3">
    <!--<img src="Login.jpg" class="img-fluid" style="object-fit: fill;width: 100%;">-->
    <!-- Image and text -->
    <nav class="navbar navbar-custom">
      <a class="navbar-brand" href="#">Crowfly
</a>
      <div class="form-inline ml-auto">
        
        <a class="btn btn-outline-light my-2 my-sm-0" type="submit" href="/customers/index">Home</a>
      </div>
    </nav>

    <div class="container " style="width:50%; height: auto;padding-top:10px;    background-image: url('https://img.freepik.com/free-photo/small-plane-with-trace-seashells_23-2148169792.jpg?size=626&ext=jpg&ga=GA1.1.715427508.1706858686&semt=ais');">
      <form action="/customers/login" method="post">
        <h2 style="text-align: center;">Login</h2>
        <br>
        <div class="form-group">
          <label for="email"></label><img src="https://cdn-icons-png.flaticon.com/128/646/646135.png" width="25px" height="25px"> Email</label>
          <!-- <div class="col-sm-10"> -->
            <input type="email" class="form-control" id="email" name="email">
          </div>
        <!-- </div> -->
        <div class="form-group">
          <label for="userPassWord" ><img src="https://cdn-icons-png.flaticon.com/128/807/807292.png" width="25px" height="25px"> Password</label>
          <!-- <div class="col-sm-10"> -->
            <input type="password" class="form-control" id="userPassWord" name="userPassWord">
          <!-- </div> -->
        </div>
        <p class="message-style"> ${message}</p>
        <div class="row justify-content-center my-4">
          <button type="submit" class="btn btn-outline-dark">Submit</button>
        </div>
        <p>Don't have an account? <a href="/customers/signup" style="color: white;">Create an account!</a></p>
      </form>
    </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
  </body>
</html>
	