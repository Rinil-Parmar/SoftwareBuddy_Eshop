
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="/" style="color: #47b5ed"><b>SoftwareBuddy</b></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/">Home</a></li>
				<c:if test="${isLogin != true}">
					<li class="nav-item"><a class="nav-link" href="login">Login</a>
					</li>
				</c:if>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Explore </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/viewProduct">view
								Products</a></li>
						<c:if test="${isLogin == true}">
							<li><a class="dropdown-item"
								href="/cart/${userLogged.userId}">Cart</a></li>
							<li><a class="dropdown-item"
								href="/${userLogged.userId}/orders">Orders</a></li>
						</c:if>
						<li><hr class="dropdown-divider"></li>
						<c:if test="${isAdmin == true }">
							<li><a class="dropdown-item" href="users">View Users</a></li>
							<li><a class="dropdown-item" href="/create_product">Add
									Product</a></li>
						</c:if>
					</ul></li>

			</ul>
			<div class="d-flex justify-content-center align-items-center">


				<c:choose>
					<c:when test="${isLogin == true}">

						<form action="updateUser/${userLogged.userId}" method="post"
							class="mt-1 p-0">
							<c:choose>
								<c:when test="${userLogged.photos.length() == 0 }">
									<button type="submit" style="border: none">
										<img
											src='<c:url value="/projectImages/default-user.png"></c:url>'
											style="width: 50px; border-radius: 100%" />
									</button>
								</c:when>
								<c:otherwise>
									<button type="submit" style="border: none">
										<img
											src='<c:url value="/images/${userLogged.photos}"></c:url>'
											style="width: 50px; border-radius: 100%" />
									</button>
								</c:otherwise>
								</c:choose>
						</form>

						<a class="dropdown-item" href="/logout"><button
								class="btn btn-outline-secondary">Logout</button></a>
					</c:when>

					<c:otherwise>
						<a class="dropdown-item" href="register"><button
								class="btn btn-info text-light">Sign Up</button></a>
					</c:otherwise>
				</c:choose> 
			
			</div>
		</div>
	</div>
</nav>
