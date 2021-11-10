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
		<form name="my_form" id='my_form' action='login' method='POST'  onSubmit="return validateForm(event);">
			  <div class="form-group">
			
			    <label><b>User Id</b></label><br>
			    <input type='text' class="form-control" name='user_userid' placeholder='Enter user number' required/>
				<br>
			    <label><b>Password</b></label><br>
			    <input type='password' class="form-control" name='user_password' placeholder='Enter here' required/>
			    <br>
			  </div>
			  <button type='submit' class="my_button" name='user_login'
				formaction="login">Login</button>
			  <button type='button' class="my_button" name='user_register' 
			          onclick='document.location.href="Register.jsp"'>
			           Register
			  </button>	
			  <button type='button' class="my_button" name='user_search' 
			           onclick='document.location.href="Search.jsp"'>
			           Search
			           </button>
			
		</form>
	</div>
</body>
<!-- <script language="JavaScript" type="text/JavaScript" src="/LoginExample/js/validation.js"></script> -->
<script>
function validateForm(event)
{
    event.preventDefault(); // this will prevent the submit event.
    let id=document.my_form.user_userid.value; 
	if(isNaN(id))
    {
      alert("User Id should be a number");
      console.log("Incorrect userId entered");
      return false;
    }
    else{
    	document.getElementById("my_form").submit();
    }
} 
</script>
</html>
