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
  <link rel="shortcut icon" href="/assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>Orders</title>
  <link rel="stylesheet" href="/assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/assets/animatecss/animate.css">
  <link rel="stylesheet" href="/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="/assets/mobirise/css/mbr-additional.css" type="text/css">
 
  <style type="text/css">
  	body{
  		background-color: #fafafa;
  	}
  	
  	.errImage{
  		width: 33%;
  		
  	}
  	
  	.errContainer{
  		display: flex;
  		justify-content: center;
  		align-items: center;
  	}
  	
  </style>
  
</head>
<body>
  <%@include file="navbar.jsp" %>
  
  <section data-bs-version="5.1" class="features8 cid-t0yeS1ILdl" xmlns="http://www.w3.org/1999/html" id="features9-9">
    
    
	<c:choose>
		<c:when test="${noOrder == true }">
		<div class="container errContainer">
			<img src="/projectImages/noOrder.svg" class="errImage">
			</div>
			<div class="text-center display-5 mt-3">No order yet</div>
		</c:when>
		
	<c:otherwise>
	
		<h1 class="text-center mb-3">Your Orders</h1>

	    <div class="container">
	    
	    <c:forEach items="${orders}" var="order">
	    <c:forEach items="${order.ordered_products}" var="product">		
	        <div class="card">
	            <div class="card-wrapper">
	                <div class="row align-items-center">
	                    <div class="col-12 col-md-4">
	                        <div class="image-wrapper">
	                            <img src='<c:url value="/images/${product.productPic}"></c:url>' alt="Product Image" style="width:350px; height:225px; border: 2px solid lightgrey" >
	                    
	                        </div>
	                    </div>
	                    <div class="col-12 col-md">
	                        <div class="card-box">
	                            <div class="row">
	                                <div class="col-md">
	                                    <h6 class="card-title mbr-fonts-style display-5">
	                                        <strong>${product.name }</strong>
	                                    </h6>
	                                    <p class="mbr-text mbr-fonts-style display-7">
	                                    	${product.description}
	                                    </p>
	                                </div>
	                                <div class="col-md-auto">
	                                    	<span>Order id : ${order.order_id}</span>
	                                    <p class="price mbr-fonts-style display-5">${product.price}/-</p>
	                                    <div class="display-7">
	                                     	${order.purchased_date}
	                                    </div>
	                                </div>
	                                <div></div>
	                            </div>
	                            <a href="/${user_id}/purchaseProduct/${product.productId}" class="btn btn-info ">
	                                            Buy Again
	                             </a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        </c:forEach>
	        </c:forEach>
	        
	    </div>
    
    </c:otherwise>   
	</c:choose> 
  
  <input name="animation" type="hidden">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
  </body>
</html>