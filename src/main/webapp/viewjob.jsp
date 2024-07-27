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
  .back-color{
    background-color: gray
  }
  
  back-img
  {
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
			<c:if test="${not empty msg }">
								<div class="alert alert-success fs-3 text-center" role="alert">${msg}</div>
								<c:remove var="msg"/>

							</c:if>
			
	        <%
	        JobDao.getConnection();
	        List<Jobs> list=JobDao.getAllJobs();
	        
	        for(Jobs j:list)
	        {%>
	        	
	        
				<div class="card mt-3 m-5  ">
					<div class="card-body back-img ">
					<div class="text-center">
					<i class="fa-solid fa-clipboard fa-2x "></i>
					</div>
					
						<h5><%=j.getTitle() %></h5>
						<p><%=j.getDescription() %></p>
						<br>
						<div class="form row">

							<div class="form-group col-md-4">
								<input class="form-control form-control-lg" type="text"
									value="Location:<%=j.getLocation() %>" readonly>
							</div>



							<div class="form-group col-md-4">

								<input class="form-control form-control-lg" type="text"
									value="category:  <%=j.getCategory()%>" readonly>
							</div>


							<div class="form-group col-md-4">
								<input class="form-control form-control-lg" type="text"
									value="status:  <%=j.getStatus() %>" readonly>

							</div>
							
							
							<h5 class="mt-4">Publish Date:  <%=j.getPdate() %></h5>

							<div class="text-center">
							<a href="editjob.jsp?id=<%=j.getId() %>" class="btn btn-lg bg-success text-white">Edit</a>
							<a href="delete?id=<%=j.getId() %>" class="btn btn-lg bg-danger text-white">Delete</a>
								
							</div>




						</div>

											

					</div>
				</div>	
	        	
	       <%} %> 
	 
			

			</div>
		</div>
	</div>
	
	
	

	
	
	

	


</body>
</html>