<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.back-img {
	background: url("images/backimg.jpg");
	width: 100%;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.back-color {
	background-color: aqua;
}
</style>

<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="AllComponent/allcss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card  ">
					<div class="card-body back-color">
						<div class="text-center">
							<i class="fa-solid fa-user"></i>
							<h5>Login Page</h5>

						</div>
						
						<c:if test="${not empty msg }">
						
						<h4 class="text-center text-danger">${msg }</h4>
						<c:remove var="msg"/>
						
						</c:if>
						<form action="Login" method="post">
							<div class="mb-3 ">
								<label for="exampleInputEmail1" class="form-label">
									Enter Email</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Enter
									Password</label> <input type="password" class="form-control"
									id="exampleInputPassword1" name="password">
							</div>
							<button type="submit" class="btn btn-primary">Login</button>
						</form>


					</div>

				</div>
			</div>
		</div>


	</div>

</body>
</html>