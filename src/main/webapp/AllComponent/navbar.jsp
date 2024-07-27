
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="">Home</a></li>

				<c:if test="${userobj.role eq 'admin'}">

					<li class="nav-item"><a class="nav-link" href="addjob.jsp">Add
							Job</a></li>
					<li class="nav-item"><a class="nav-link" href="viewjob.jsp">View
							Job</a></li>
				</c:if>



			</ul>



			<form class="d-flex" role="search">

				<c:if test="${userobj.role eq 'admin' }">

					<a href="#" class="btn btn-light me-2"><i
						class="fa-solid fa-user"></i> Admin</a>
					<a href="Logout" class="btn btn-light ">Logout</a>


				</c:if>

				<c:if test="${userobj.role eq 'user' }">

					<a href="#" class="btn btn-light me-2" data-bs-toggle="modal"
						data-bs-target="#exampleModal"><i class="fa-solid fa-user"></i>${userobj.name }</a>
					<a href="Logout" class="btn btn-light ">Logout</a>


				</c:if>


				<c:if test="${ empty userobj }">

					<a href="login.jsp" class="btn btn-light m-1"><i
						class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
					<a href="signup.jsp" class="btn btn-light m-1"><i
						class="fa-solid fa-user"></i> SignUp</a>

				</c:if>



			</form>
		</div>
	</div>
</nav>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="card">
					<div class="card-body">

						<div class="text-center">

							<i class="fa-solid fa-circle-user fa-3x"></i>
						</div>

						<table class="table">

							<tbody>
								<tr>

									<th >Name</th>

									<th>${userobj.name}</th>
								</tr>


								<tr>

									<th >Email</th>

									<th>${userobj.qualification}</th>
								</tr>
								
								<tr>

									<th >Qualification</th>

									<th>${userobj.password}</th>
								</tr>

							</tbody>
						</table>

					</div>

				</div>




			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>