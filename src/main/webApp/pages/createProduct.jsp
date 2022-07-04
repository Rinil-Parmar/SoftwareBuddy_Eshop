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
  
  
  <title>createProduct</title>
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  
  <section data-bs-version="5.1" class="form4 cid-t0ra3j6Rxr mbr-fullscreen" id="form4-6">

    <div class="container">
        <div class="row content-wrapper justify-content-center">
            <div class="col-lg-3 offset-lg-1 mbr-form">
                <!-- <form action="https://mobirise.eu/" method="POST" class="mbr-form form-with-styler"> -->
                <form:form action="addProduct" method="POST" modelAttribute="product" enctype="multipart/form-data">
                    <div class="row">
                        
                        <div hidden="hidden" data-form-alert-danger="" class="alert alert-danger col-12">
                            Oops...! some problem!
                        </div>
                    </div>
                    <div class="dragArea row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <h1 class="mbr-section-title mb-4"><strong>Create Product</strong></h1>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <p class="mbr-text mbr-fonts-style mb-4 display-7">Make your deal</p>
                        </div>
                        <div class="col-lg-12 col-md col-12 form-group mb-3">
                            <!-- <input type="text" name="name" placeholder="Name" data-form-field="name" class="form-control" value="" id="name-form4-6"> -->
                            <form:input path="name" placeholder="Name" class="form-control"/>
                        </div>
                        
                        <div class="input-group mb-3">
						<input type="file" name="fileImage" id="fileImage" accept="image/png, image/jpeg" class="form-control"/>
						</div>
						
                        <div class="col-lg-12 col-md col-12 form-group mb-3" >
                            <form:input path="price" placeholder="Price" class="form-control"/>
                        </div>
                        <div class="col-lg-12 col-md col-12 form-group mb-3" >
                            <form:textarea path="description" placeholder="Description" class="form-control"/>
                        </div>
                        
                        
                        <div class="col-12 col-md-auto mbr-section-btn"><button type="submit" class="btn btn-info display-4">Create</button></div>
                    </div>
                    </form:form>
                <!-- </form> -->
                <a href="/" class="btn btn-outline secondary mt-3" style="border:1px solid lightgrey; color:grey">Home</a>
            </div>
            <div class="col-lg-7 offset-lg-1 col-12">
                <div class="image-wrapper">
                    <img class="w-100" src="assets/images/mbr.png" id="thumbnail" >
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