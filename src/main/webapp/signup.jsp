
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
							<h5>Registration Page</h5>
							
							</div>
							
							<c:if test="${not empty msg }">
								<div class="alert alert-success fs-3 text-center" role="alert">${msg}</div>
								<c:remove var="msg"/>

							</c:if>

							<form action="adduser" method="post">
								<div class="mb-3 ">
									<label for="exampleInputEmail1" class="form-label">
										Enter Name</label> <input type="text" required="required"   class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp" name="name">

								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">
										Enter Qualification</label> <input type="text" required="required" class="form-control"
										 name="qualification">
								</div>
								
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">
										Enter Email</label> <input type="email" required="required" class="form-control"
										 name="email">
								</div>
								
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">
										Enter Password</label> <input type="password" required="required" class="form-control"
										id="exampleInputPassword1" name="password">
								</div>
								<button type="submit" class="btn btn-primary">Register</button>
							</form>

						
					</div>

				</div>
			</div>
		</div>


	</div>
</body>
</html>