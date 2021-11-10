<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*,javax.servlet.*,java.io.*" %>

<%@page errorPage="error.jsp" %>
<%@ page import = "java_files.user.UserBean" %>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
 	<style><%@include file="css/Registeration.css"%></style>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
	<meta charset="ISO-8859-1">
	<title>Update Profile</title>
</head>
<body>
	<%
			UserBean user=(UserBean) request.getAttribute("user");
		%>
		<form name="my_form" id='my_form' action='Registration' method='POST' onSubmit="return validateForm(event);">
			<div class=".container-sm holder">
				<div class="row">
					<div class="col">
						<label><b>First Name<span id="star">*</span></b></label>
						<input type='text' class="form-control my-control" name='user_firstname' 
						value='<%=user.getFirstName()%>'/>
				
					</div>
					<div class="col">
						<label><b>Last Name<span id="star">*</span></b></label>
						<input type='text'  class="form-control my-control" name='user_lastname' 
						value='<%=user.getLastName()%>' />
					</div>
				</div>
				
				<label><b>Address</b></label>
				<textarea  class="form-control my-control" name='user_address' rows='8'><%=user.getAddress()%></textarea>
				
				<div class="row">
					<div class="col-md-4">
					<label><b>City</b></label>
						<input type='text'  class="form-control my-control" name='user_city' 
						value='<%=user.getCity()%>'/>
			   	
					</div>
					<div class="col-md-4">
						<label><b>State</b></label>
						<input type='text' class="form-control my-control" name='user_state' 
						value='<%=user.getState()%>' />
					</div>
					<div class="col-md-3">
						<label><b>Country</b></label>
						<input type='text' class="form-control my-control" name='user_country' 
						value='<%=user.getCountry()%>' />
					</div>
					<div class="col-md-4">
						<label><b>Zip</b></label>
						<input type='text' class="form-control my-control" name='user_zip' 
						value='<%=user.getZip()%>'/>
					</div>
					<div class="col-md-4">
						<label><b>Phone</b></label>
						<input type='text' class="form-control my-control" name='user_phone' 
						value='<%=user.getPhone()%>' />
					</div>
				</div>
				  <br><br> 
				  <button type='submit' class="my_button" name='user_login'
					onclick='document.location.href="Registration"'>Update</button>
				  <div class="buttons my-control">
					<input type='hidden' class="form-control my-control" name='user_userid' 
					value='<%=user.getUserLoginId()%>'/>
				    <input type='hidden' class="form-control my-control" name='user_password' 
				    value='<%=user.getPassword()%>'/>
				 
				  <br><br> 
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
	    else {
	    	document.getElementById("my_form").submit();
	    }

	} 
</script>
</html>