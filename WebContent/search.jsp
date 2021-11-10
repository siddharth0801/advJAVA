<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*,javax.servlet.*,java.io.*" %>

<%@page errorPage="error.jsp" %>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
 	<style><%@include file="css/Login.css"%></style>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
	<meta charset="ISO-8859-1">
	<title>Login Page</title>
</head>
<body>
	<div class="holder">
		<form name="my_form" id='my_form' action='' method='POST'  >
			  <div class="form-group">
			
				    <label><b>FirstName</b></label><br>
				    <input type='text' class="form-control" name='user_firstname' 
				           placeholder='Enter here' required/>
					<br>
				    
				    <label><b>LastName</b></label><br>
				    <input type='text' class="form-control" name='user_lastname' 
				           placeholder='Enter here' required/>
				    <br>
				   
			  </div>
			   
			   <button type='submit' class="btn btn-primary" name='user_search'
				       formaction="search">Search</button>
			   <button type='button' class="btn btn-primary" name='user_login' 
			           onclick='document.location.href="index.jsp"'>
			           Login
			           </button>
			        
		</form>
	</div>
</body>
</html>
