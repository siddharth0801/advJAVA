<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*,javax.servlet.*,java.io.*" %>

<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
 	<style><%@include file="css/Error.css"%></style>
	<meta charset="ISO-8859-1">
	<title>Error Page</title>
</head>
<body>
<body>	
	<div class="message"> 
		<h1>Sorry!! Something went wrong.</h1>
		<h4>An error occurred while processing.We will solve it as soon as possible.</h4>
		<br>
		<%
			String error="";
			String errorMessage="No Specific Error Message.";
			if(exception!=null)
			{
				String s=(String)exception.getClass().getName();
				if(s=="org.apache.jasper.JasperException")
				{
					error="JasperException: Error in Error.jsp page.";
				}
				else if(s=="java.lang.ArithmeticException")
				{
					error="Arithmetic Exception: A number is divided by zero.";
				}
				else if(s=="java.lang.NullPointerException")
				{
					error="Null Pointer Exception: Some variables are not defined.";
				}
				else if(s=="java.sql.SqlException")
				{
					error="SQL Exception: There is some error in your queries.";
				}
				else if(s=="java.sql.SqlException")
				{
					error="SQL Exception: There is some error in your queries.";
				}
				else if(s=="java.lang.NumberFormatException")
				{
					error="Number Format Exception: You are converting a wrong string to number.";
				}
				else
				{
					error="Exception occured";
				}

				String result = exception.getMessage();
				if(result!=null)
				{
					errorMessage=exception.getMessage();
				}
			}
			else
			{
				error="No error found.";
			}
		%>
		 <div align="center">
        <table border="1" cellpadding="5">
            <tr>
                <th>Error type : </th>
                <td>
                  <%=error%>
               </td>
            </tr>
            <tr>     
                 <th>Message : </th>
    		     <td><%= errorMessage %></td> 
    		     
            </tr>
            <tr>
                <th>Status Code :  </th>
                <td><%= response.getStatus() %></td>
            </tr>
            <tr>
                <th>Error Page :  </th>
                <td> <%=pageContext.getErrorData().getRequestURI() %></td>
            </tr>
            <tr>
            	<th>Goto :  </th>
            	<td>
	            	<button type='submit' class="btn btn-primary" name='user_login'
					onclick='document.location.href="index.jsp"'>Login</button>
					
				    <button type='button' class="btn btn-primary" name='user_register' 
					onclick='document.location.href="Register.jsp"'> Register</button>	
					           
					<button type='button' class="btn btn-primary" name='user_search' 
			         onclick='document.location.href="Search.jsp"'>Search</button>
			         
			         <button type='button' class="btn btn-primary" name='user_update' 
			         onclick='document.location.href="AllUsers.jsp"'>AllUsers</button>
			     </td>
            </tr>
        </table>
    </div>
	</div>
</body>
</html>