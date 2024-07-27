
<%@page import="com.demo.Jobs"%>
<%@page import="com.demo.JobDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Jobs</title>
<%@include file="AllComponent/allcss.jsp"%>
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
							
<%
int id=Integer.parseInt(request.getParameter("id"));
  JobDao.getConnection();
  Jobs j=JobDao.getJobById(id);
%>
							<h4 class="text-center">Edit Jobs</h4>
							

							<form action="Update" method="post">
							<input type="hidden" value="<%=j.getId() %>" name="id">

								<div class="mb-3 ">
									<label for="exampleInputEmail1" class="form-label text-right">
										Enter Title</label> <input type="text" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="title" value="<%=j.getTitle() %>">

								</div>
								<div class="form row">

									<div class="form-group col-md-4">
										<lable class="text-right">Location</lable>
										<select class="form-select"
											aria-label="Default select example" name="location">
											<option value="<%= j.getLocation()%>"><%=j.getLocation() %></option>
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
											<option value="<%= j.getCategory()%>"><%=j.getCategory() %></option>
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
											<option value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
											
											<option value="Active">Active</option>
											
											<option value="Inactive">Inactive</option>


										</select>

									</div>


									<div class="mb-3">
										<label for="exampleFormControlTextarea1"
											class="form-label text-right">Enter Description</label>
										<textarea class="form-control" required rows="6" cols=""
											id="exampleFormControlTextarea1" rows="3" name="description"><%=j.getDescription() %></textarea>
									</div>




								</div>

								<button type="submit" class="btn btn-primary">Edit Job</button>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>


	</div>
</body>
</html>