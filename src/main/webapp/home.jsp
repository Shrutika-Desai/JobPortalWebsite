<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="com.demo.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.JobDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="AllComponent/allcss.jsp"%>
<style>
.back-color {
	background-color: gray
}

back-img {
	background: url("images/admin-wallpaper.png");
	width: 100%;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>


</head>
<body>
 <c:if test="${empty userobj }">
    
    <c:redirect url="login.jsp"></c:redirect>
    </c:if>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid back-color">
		<div class="row ">
			<div class="col-md-12 ">
				<h1 class="text-center text-white">All Jobs</h1>
				<%-- <c:if test="${not empty msg }">
								<div class="alert alert-success fs-3 text-center" role="alert">${msg}</div>
								<c:remove var="msg"/>

							</c:if>--%>


				<div class="card m-4">
					<div class="card-body  ">


						<form class=" row form-row" action="moreview.jsp" method="get">

							<div class="form-group col-md-5">
								<h5 class="mt-5">Location</h5>
								<select class="form-select mt-4"id="inlineFormCustomSelectPref" aria-label="Default select example"
									name="loc" >
									<option selected value="lo">Choose</option>
									<option value="pune">Pune</option>
									<option value="mumbai">Mumbai</option>
									<option value="Banglore">Banglore</option>
									<option value="Hydrabad">Hydrabad</option>
									<option value="Chennai">Chennai</option>
								</select>

							</div>

							<div class="form-group col-md-5 mt-1">
								<h5 class="mt-5">category</h5>
								<select class="form-select mt-4" id="inlineFormCustomSelectPref" aria-label="Default select example"
									name="cat">
									<option selected value="ca" >Choose</option>
									<option value="IT">IT</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>

								</select>

							</div>

							
							<div class="form-group col-md-2 mt-5">
								<button class="btn btn-success mt-4">Submit</button>

							</div>
							
							


						</form>

					</div>
				</div>



				<%
				JobDao.getConnection();
				List<Jobs> list = JobDao.getAllJobsForUser();

				for (Jobs j : list) {
				%>


				<div class="card mt-2 m-4 ">
					<div class="card-body  ">
						<div class="text-center text-primary">
							<i class="fa-solid fa-clipboard fa-2x "></i>
						</div>

						<h5><%=j.getTitle()%></h5>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 100) {
						%>
						<p><%=j.getDescription()%></p>

						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 100)%>
						</p>

						<%
						}
						%>





						<br>
						<div class="form row">

							<div class="form-group col-md-4">
								<input class="form-control form-control-lg" type="text"
									value="Location:<%=j.getLocation()%>" readonly>
							</div>



							<div class="form-group col-md-4">

								<input class="form-control form-control-lg" type="text"
									value="category:  <%=j.getCategory()%>" readonly>
							</div>





							<h5 class="mt-4">
								Publish Date:
								<%=j.getPdate()%></h5>

							<div class="text-center">
								<a href="oneview.jsp?id=<%=j.getId()%>"
									class="btn btn-lg bg-success text-white">View More</a>


							</div>




						</div>



					</div>
				</div>

				<%
				}
				%>







			</div>
		</div>
	</div>











</body>
</html>