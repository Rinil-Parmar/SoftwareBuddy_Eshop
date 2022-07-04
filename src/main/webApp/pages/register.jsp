<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html  >
<head>
  <!-- Site made with Mobirise Website Builder v5.6.3, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.3, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>register</title>
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,400;0,700;1,400;1,700&display=swap&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,400;0,700;1,400;1,700&display=swap&display=swap"></noscript>
  <link rel="preload" as="style" href="assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  
  
</head>
<body>
  
  <section data-bs-version="5.1" class="form4 cid-t02fyh0dsU mbr-fullscreen" id="form4-0">

    

    

    <div class="container">
        <div class="row content-wrapper justify-content-center">
            <div class="col-lg-3 offset-lg-1 mbr-form">
            	<div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="mbr-section-title mb-4 display-2">
                        <strong>Register</strong>
                    </h3>
                 </div>
                <!-- registration form -->
                <form:form action="addUser" method="post" modelAttribute="user" cssStyle="color:white" enctype="multipart/form-data">
					<div class="d-flex justify-content-center my-3">
                		<img id="thumbnail" style="width:300px; border-radius:30%">
                	</div>
					<div class="input-group mb-3">
						<form:input path="name" cssClass="form-control" placeholder='Name'/>
					</div>
					<div class="input-group mb-3">
						<form:password path="password" cssClass="form-control" placeholder='Password'/>
					</div>
					<div class="input-group mb-3">
						<form:input path="email" cssClass="form-control " placeholder='Email'/>
					</div>
					<div class="input-group mb-3">
						<form:input path="mobileNo" cssClass="form-control " placeholder='Mobile Number'/>
					</div>
					<div class="input-group mb-3">
						<form:hidden path="type" value="customer" cssClass="form-control " placeholder='Mobile Number'/>
					</div>
					<div class="input-group mb-3">
						<input type="file" name="fileImage" id="fileImage" accept="image/png, image/jpeg" />
					</div>

					<button class="btn btn-outline-primary w-100">Submit</button>
				</form:form>
				<div class=" mt-3">Already Registered? Click <a href="login">Here </a>to Login</div>
            </div>
            <div class="col-lg-7 offset-lg-1 col-12">
                <div class="image-wrapper">
                    <img class="w-100" src="assets/images/mbr-1.jpg" alt="Mobirise Website Builder">
                </div>
            </div>
        </div>
    </div>
	
	<script type="text/javascript">
       	$(document).ready(function() {
       		
       		$("#fileImage").change(function() {
       			showImageThumbnail(this);
       			console.log(2);
       		})
       		
       		function showImageThumbnail(fileInp) {
       			file = fileInp.files[0];
       			reader = new FileReader();
       			
       			reader.onload = function(e) {
       				$("#thumbnail").attr("src", e.target.result);
       				console.log(1);
       			};
       			
       			reader.readAsDataURL(file);
       		}
                		
          });
                
       </script>  
  	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   
</body>
</html>