<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Admin Control</title>
	<style type="text/css">
  	body{
  		background-color: #fafafa;
  	}
  	
  	.errImage{
  		width: 40%;
  		
  	}
  	
  	.errContainer{
  		display: flex;
  		justify-content: center;
  		align-items: center;
  	}
  	
  </style>
  </head>
  <body>
  	<c:choose>
		<c:when test="${userLogged.type != 'admin' }">
		<div class="container errContainer mt-5">
			<img src="/projectImages/notAccess.svg" class="errImage">
			</div>
			
			<div class="text-center display-5 mt-3 text-danger">Not Access to This Page</div>
		</c:when>
		
	<c:otherwise>
	
  
    <center><h1 class="bg-dark text-light">All Users</h1></center>
	<table class="table table-striped">
  		<tr>
  			<th>Id</th>
  			<th>Profile pic</th>
  			<th>Name</th>
  			<th>Email</th>
  			<th>Mobile No</th>
  			<th></th>
  		</tr>
		<c:forEach items="${allUsers}" var="user">		
			<tr>
				<td>${user.userId}</td>
				<td><img src='<c:url value="/images/${user.photos}"></c:url>' style="width:80px; border-radius:70%"/></td>
				<td>${user.name}</td>
				<td>${user.email}</td>
				<td>${user.mobileNo}</td>
				
				<td>
					<div class="d-flex justify-content-around">
                    <form:form method="post" action="/updateUser/${user.userId}" >
                        <input type="submit" value="UPDATE" class="btn btn-outline-dark"/>
                    </form:form>
					<form:form method="post" action="/${user.userId}/delete" cssClass="mr-3">
                        <input type="submit" value="DELETE" class="btn btn-outline-dark"/>
                    </form:form>
                    </div>
				</td>
			</tr>	
		</c:forEach>
	
	</table>
	<div class="mx-3">
		<a class="btn btn-primary btn-md" href="/">Back</a>
	</div>
	</c:otherwise>
	</c:choose>

 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>