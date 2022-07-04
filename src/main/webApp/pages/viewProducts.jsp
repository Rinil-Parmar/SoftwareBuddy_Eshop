<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<head>
  <!-- Site made with Mobirise Website Builder v5.6.3, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v5.6.3, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="/assets/images/logo5.png" type="image/x-icon">
  <meta name="description" content="">
  
  
  <title>viewProduct</title>
  <link rel="stylesheet" href="/assets/web/assets/mobirise-icons2/mobirise2.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/assets/theme/css/style.css">
  <link rel="preload" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jost:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
  <link rel="preload" as="style" href="/assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  
  <style>
  	.item-wrapper{
  		position: relative;
  	}
  	
  	.buttons{
  		position: absolute;

  		bottom: 0;
  	}
  		
  	#features3-5{
  		background-image: linear-gradient(45deg,rgb(245, 245, 245), #47b5ed );
  	}
  </style>
  
</head>
<body>
  <%@include file="navbar.jsp" %>
  
  <section data-bs-version="5.1" class="features3 cid-t0r6BdO8l2" id="features3-5">
    
    
    <div class="container">
        <div class="mbr-section-head">
            <h4 class="mbr-section-title mbr-fonts-style align-center mb-0 display-5"><strong>Find Your best deal</strong></h4>
            <h5 class="mbr-section-subtitle mbr-fonts-style align-center mb-0 display-5">Software Products</h5>
        </div>
        <div class="row mt-4">
            
           <c:forEach items="${products}" var="product">           
           <!--  -->
           <div class="item features-image сol-12 col-md-6 col-lg-4" style="cursor:auto; border-radius:20px; height:80vh">
                <div class="item-wrapper">
                    <div class="item-img p-1">
                        <img src='<c:url value="/images/${product.productPic}"></c:url>' alt="Product Image" style="width:400px; height:300px; border: 2px solid lightgrey" >
                    </div>
                    <div class="item-content">
                        <h5 class="item-title mbr-fonts-style display-7"><strong>${product.name}</strong></h5>
                        <p class="mbr-text mbr-fonts-style mt-3 display-7">Price&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp; ${product.price}/-<br></p>
                        <p class="mbr-text mbr-fonts-style mt-3 display-8">${product.description}<br></p>
                    </div>
                    
                    <div class="d-flex justify-content-between my-2 buttons" >
                    <div class=""><a href="/${userLogged.userId}/purchaseProduct/${product.productId}" class="btn item-btn btn-primary " ><span class="mobi-mbri mobi-mbri-cash mbr-iconfont mbr-iconfont-btn"></span>Buy Now&nbsp;</a></div>
                	 <div class="addToCart"><a href="/addToCart/${userLogged.userId}/${product.productId}" class="btn item-btn " style="color:grey; border:1px solid lightgrey" >Add to cart</a></div> 
                	<!-- <button class="col mb-0 btn btn-outline-secondary btn-small item-btn" style="width:100px; height:20px">Add to cart</button>
                	 --></div>
                </div>
            </div>
            <!--  -->
            </c:forEach>
        </div>
    </div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
  
</body>
</html>