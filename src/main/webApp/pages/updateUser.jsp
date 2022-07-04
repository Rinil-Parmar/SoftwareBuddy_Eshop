<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Site made with Mobirise Website Builder v5.6.3, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.3, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="/assets/images/logo5.png" type="image/x-icon">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <meta name="description" content="">
  
  
  <title>updateUser</title>
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="/assets/mobirise/css/mbr-additional.css" type="text/css">
  
</head>
<body>
  <%@include file="navbar.jsp" %>
  <section data-bs-version="5.1" class="form5 cid-t081E3gcuO" id="form5-3">
       
    <div class="container">
        <div class="mbr-section-head">
            <h2 class="mbr-section-title mbr-fonts-style align-center my-3">
                <strong>Update Profile</strong>
            </h2>
            
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-lg-8 mx-auto mbr-form">
             
                <form:form action="updateUser" method="post" modelAttribute="userToUpdate" cssStyle="color:white" enctype="multipart/form-data">
                	<div class="d-flex justify-content-center my-3">
                		<c:choose>
                			<c:when test="${userLogged.photos.length() == 0 }">
                				<img id="thumbnail" src='<c:url value="/projectImages/default-user.png"></c:url>' style="width:300px; border-radius:30%">                			                			
                			</c:when>
                			<c:otherwise>
		                		<img id="thumbnail" src='<c:url value="/images/${userToUpdate.photos}"></c:url>' style="width:300px; border-radius:30%">                			
                			</c:otherwise>
                		</c:choose>
                	</div>
	                <div class="dragArea row">
	                <form:hidden path="userId"/>
	                 <div class="col-md col-sm-12 form-group mb-3" >
                            <form:input path="name" cssClass="form-control" placeholder='Name'/>
                     </div>
                     <div class="col-md col-sm-12 form-group mb-3" >
                            <form:password path="password" cssClass="form-control" placeholder='Password' value="${userToUpdate.password }"/>
                     </div>
                     <div class="input-group mb-3">
						<input type="file" name="fileImage" id="fileImage" accept="image/png, image/jpeg" value="${userToUpdate.photos }"/>
					</div>
                     </div>
                     <div class="col-md col-sm-12 form-group mb-3" >
                            <form:input path="email" cssClass="form-control " placeholder='Email'/>
                     </div>
                     <div class="col-md col-sm-12 form-group mb-3" >
                            <form:input path="mobileNo" cssClass="form-control " placeholder='Mobile Number'/>
                     </div>
                     <div class="col-md col-sm-12 form-group mb-3" >
                            <form:hidden path="type" value="customer" cssClass="form-control " placeholder='Mobile Number'/>						
                     </div>
						
						<!-- <button class="btn btn-outline-primary w-100">Submit</button> -->
						<div class="col-lg-12 col-md-12 col-sm-12 align-center mbr-section-btn d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary display-4">Update</button>
							<a href="/${userToUpdate.userId}/delete" class="text-secondary display-7">Delete Account</a>
                        </div>
					
				</form:form>
                
                
                <script type="text/javascript">
                	$(document).ready(function() {
                		
                		$("#fileImage").change(function() {
                			showImageThumbnail(this);
                		})
                		
                		function showImageThumbnail(fileInp) {
                			file = fileInp.files[0];
                			reader = new FileReader();
                			
                			reader.onload = function(e) {
                				$("#thumbnail").attr("src", e.target.result);
                			};
                			
                			reader.readAsDataURL(file);
                		}
                		
                	});
                
                </script>
                
            </div>
        </div>
    </div> 
  </section>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   
  
</body>
</html>