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
	<div class="container">
		<div class="row ">
			
			<div class="col-md-12"><%
int id=Integer.parseInt(request.getParameter("id"));
  JobDao.getConnection();
  Jobs j=JobDao.getJobById(id);
%>
			
	        
	        <form action="ApplyJob">
				<div class="card mt-5 ">
					<div class="card-body ">
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


						
							
							<h5 class="mt-4">Publish Date:  <%=j.getPdate().toString() %></h5>

							<span><button type= "submit" class="btn btn-success ms-5 ">Apply</button></span>


                           
						

											

					</div>
				</div>	
	        	
	     
			

			</div>
			
			</form>
			
			
		</div>
	</div>
	</div>
	
	

	
	
	

	


</body>
</html>