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
  </style>

</head>
<body>
 <c:if test="${empty userobj }">
    
    <c:redirect url="login.jsp"></c:redirect>
    </c:if>
<%@include file="AllComponent/navbar.jsp"%>

<div class="container-fluid back-img">
 
 <div class="text-center">
   <h1 class="text-white p-4">Welcome Admin</h1>
 
 </div>

</div>

</body>
</html>