<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*,javax.servlet.*,java.io.*" %>

<%@page errorPage="error.jsp" %>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
 	<style><%@include file="css/Registeration.css"%></style>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
	<meta charset="ISO-8859-1">
	<title>Registration Page</title>
</head>
<body>
		<form name="my_form" id='my_form' action='Registration' method='POST' onSubmit="return validateForm(event);">
			<div class=".container-sm holder">
			<!-- 	<h1 id="heading">REGISTRATION FORM</h1> -->
				<div class="row">
					<div class="col">
						<label><b>First Name<span id="star">*</span></b></label>
						<input type='text' class="form-control my-control" name='user_firstname' 
						placeholder='Enter here'/>
				
					</div>
					<div class="col">
						<label><b>Last Name<span id="star">*</span></b></label>
						<input type='text'  class="form-control my-control" name='user_lastname' 
						placeholder='Enter here' />
					</div>
				</div>
				
				<label><b>Address</b></label>
				<textarea  class="form-control my-control" name='user_address' rows='8' ></textarea>
				
				<div class="row">
					<div class="col-md-4">
					<label><b>City</b></label>
						<input type='text'  class="form-control my-control" name='user_city' 
						placeholder='Enter here'/>
			   	
					</div>
					<div class="col-md-4">
						<label><b>State</b></label>
						<input type='text' class="form-control my-control" name='user_state' 
						placeholder='Enter here' />
					</div>
					<div class="col-md-3">
						<label><b>Country</b></label>
						<input type='text' class="form-control my-control" name='user_country' 
						placeholder='Enter here' />
					</div>
					<div class="col-md-4">
						<label><b>Zip</b></label>
						<input type='text' class="form-control my-control" name='user_zip' 
						placeholder='Enter number here' />
					</div>
					<div class="col-md-4">
						<label><b>Phone</b></label>
						<input type='text' class="form-control my-control" name='user_phone' 
						placeholder='Enter here' />
					</div>
				</div>
				<label><b>User Id<span id="star">*
					<stlc:if test="request.getAttribute('alert')!=null">
						<%="<h4>User Id already exist.</h4>"%>
					</stlc:if>
				</span></b></label>
				<input type='text' class="form-control my-control" name='user_userid' 
				placeholder='Enter number here' required/>
				
				<label><b>Password<span id="star">*</span></b></label>
			    <input type='password' class="form-control my-control" name='user_password' placeholder='Enter here' required/>
				 
				  <br><br> 
				  <div class="buttons my-control">
			  		 <button type='submit' class="my_button" name='user_register'> 
		   		 	     <span id="btn-name">Register</span>
		   		 	 </button> 
		   		 	 <button type='reset' class="my_button" name='user_reset'> 
		   		 	     <span id="btn-name">Reset</span>
		   		 	 </button> 	 	  	
			      </div>
			</div>
		</form>
		
</body>
<!-- <script language="JavaScript" type="text/JavaScript" src="/LoginExample/js/validation.js"></script> -->
<script>
 	function validateForm(event)
	{
 		
	    event.preventDefault(); // this will prevent the submit event.
    	console.log(document.my_form.user_firstname.value+" "+document.my_form.user_password.value);
    	let zip=document.my_form.user_zip.value;
	    let pwd=document.my_form.user_password.value;
	    let id=document.my_form.user_userid.value; 
	    let fname=document.my_form.user_firstname.value; 
	    let lname=document.my_form.user_lastname.value; 
	    let phone=document.my_form.user_phone.value; 
	    if(fname==null || fname=="")
	    {
	        alert("FirstName should not be empty.");
		    return false;
	    }
	    else if(lname==null || lname=="")
	    {
	        alert("LastName should not be empty.");
		    return false;
	    }
	    else if(phone=="" || isNaN(phone))
    	{
		    alert("Phone No. should be a number.");
		    console.log("Incorrect phone number entered");
		    return false;
    	}
	    else if(zip=="" || isNaN(zip))
    	{
		    alert("Zip should be a number");
		    console.log("Incorrect zip entered");
		    return false;
    	}
	    else if(isNaN(id))
	    {
	      alert("UserId should be a number");
	      console.log("Incorrect userId entered");
	      return false;
	    }
	    else {
	    	document.getElementById("my_form").submit();
	    }

	} 
</script>
</html>