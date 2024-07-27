<%@page import="java.util.ArrayList"%>
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

</head>
<body>

    <c:if test="${empty userobj }">
    
    <c:redirect url="login.jsp"></c:redirect>
    </c:if>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<div class="row ">
			<div class="col-md-12 ">
			<h1 class="text-center text-white">All Jobs</h1>
			
			<%
			String location=request.getParameter("loc");
			String category=request.getParameter("cat");
			String msg="";
			
			
			JobDao.getConnection();
			List<Jobs>list=null;
			
			if("lo".equals(location)&& "ca".equals(category))
			{
				list=new ArrayList<Jobs>();
				msg="Job Not Available";
			}
			else
				if("lo".equals(location)|| "ca".equals(category))
				{
					list=JobDao.getJob1(category,location);
					
							
				}
				else
				{
					list=JobDao.getJob2(category,location);
				}
			
			
			if(list.isEmpty()){
			%>
			<h4 class="text-center text-success">Job Not Available</h4>
			<%
			}
			
			
			
			if(list!=null){
			
				for(Jobs j:list){
				%>
				
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


							
							<h5 class="mt-4">Publish Date:  <%=j.getPdate().toString() %></h5>

							<div class="text-center">
							<a href="oneview.jsp?id=<%=j.getId() %>" class="btn btn-lg bg-success text-white">Edit</a>
							
								
							</div>
											

					</div>
				</div>	
	        	
	       <%
	       }
				
			}else{
			%> 
			
			<h4><%=msg %></h4>
			<%
			}
			%>
				
				
				
	 
				
			
			
			
			
			
			</div>
		</div>
	</div>
	
	
	</div>

	
	
	

	


</body>
</html>