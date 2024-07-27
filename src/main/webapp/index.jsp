
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
    background: url("images/backimg2.jpg");
    width: 100%;
    height: 85vh;
    background-repeat: no-repeat;
    background-size: cover;
  }
</style>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container-fluid back-img">

		<div class="text-center">

			<h1 class="text-black  p-4">
				<i class="fa-solid fa-book text-black"></i> Online Job Portal
			</h1>
		</div>

	</div>
	<%@include file="AllComponent/footer.jsp" %>
</body>
</html>