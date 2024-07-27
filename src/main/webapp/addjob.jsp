
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
<style>
  .back-img{
    background: url("images/admin-wallpaper.png");
    width: 100%;
    height: 100vh;
    background-repeat: no-repeat;
    background-size: cover;
    
    
  }
  .back-color
  
  {
      background-color: gray;
  }
  </style>

</head>
<body>
 <c:if test="${empty userobj }">
    
    <c:redirect url="login.jsp"></c:redirect>
    </c:if>

	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="row p-5">
			<div class="col-md-10 offset-md-1">
				<div class="card  ">
					<div class="card-body back-color">
						<div class="text-right">
							<c:if test="${not empty msg }">
								<div class="alert alert-success fs-3 text-center" role="alert">${msg}</div>
								<c:remove var="msg"/>

							</c:if>

							<h4 class="text-center">Post Jobs</h4>

							<form action="AddJob" method="post">
								<div class="mb-3 ">
									<label for="exampleInputEmail1" class="form-label text-right">
										Enter Title</label> <input type="text" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="title">

								</div>
								<div class="form row">

									<div class="form-group col-md-4">
										<lable class="text-right">Location</lable>
										<select class="form-select"
											aria-label="Default select example" name="location">
											<option selected>Choose</option>
											<option value="pune">Pune</option>
											<option value="mumbai">Mumbai</option>
											<option value="Banglore">Banglore</option>
											<option value="Hydrabad">Hydrabad</option>
											<option value="Chennai">Chennai</option>
										</select>

									</div>



									<div class="form-group col-md-4">
										<lable class="text-right">Category</lable>
										<select class="form-select"
											aria-label="Default select example" name="category">
											<option selected>Choose</option>
											<option value="IT">IT</option>
											<option value="Banking">Banking</option>
											<option value="Engineer">Engineer</option>
											<option value="Teacher">Teacher</option>

										</select>

									</div>


									<div class="form-group col-md-4">
										<lable class="text-right">Status</lable>
										<select class="form-select"
											aria-label="Default select example" name="status">
											<option selected>Active</option>
											<option value="1">Inactive</option>


										</select>

									</div>


									<div class="mb-3">
										<label for="exampleFormControlTextarea1"
											class="form-label text-right">Enter Description</label>
										<textarea class="form-control" required rows="6" cols=""
											id="exampleFormControlTextarea1" rows="3" name="description"></textarea>
									</div>




								</div>

								<button type="submit" class="btn btn-success fs-5 p-2">Post Job</button>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>


	</div>
</body>
</html>