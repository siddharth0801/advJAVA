<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*,javax.servlet.*,java.io.*" %>

<%@page errorPage="error.jsp" %>
<%@ include file="navbar.jsp"%>
<%@ page import = "java_files.user.UserBean" %>
<!DOCTYPE html>
<html>
<head>
 	<style><%@include file="css/Login.css"%></style>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
	<meta charset="ISO-8859-1">
	<title>UserProfile</title>
</head>
<body>

	<%
		UserBean user=(UserBean) request.getAttribute("user");
	%>
		
	<h4>UserLoginId: <%=user.getUserLoginId()%></h4>
	<h4>First Name: <%=user.getFirstName() %></h4>
	<h4>Last Name: <%=user.getLastName() %></h4>
	<h4>Address: <%=user.getAddress() %></h4>
	<h4>City:  <%=user.getCity() %></h4>
	<h4>State: <%=user.getState() %></h4>
	<h4>Country: <%=user.getCountry() %></h4>
	<h4>Zip: <%=user.getZip() %></h4>
	<h4>Phone: <%=user.getPhone() %></h4>
	
</body>
</html>