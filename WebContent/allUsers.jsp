<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.util.*,javax.servlet.*,java.io.*" %>

<%@ page import = "java_files.user.UserBean" %>
<%@ page import = "java_files.database_connection.ConnectionProvider" %>
<%@ include file="navbar.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
 	<style><%@include file="css/Login.css"%></style>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
	<meta charset="ISO-8859-1">
	<title>All Users</title>
</head>

<body>
	
	 <sql:setDataSource
        var="mydb"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/mydb"
        user="root" password="ivan@2002"
    />
	<sql:query var="listPartyTable"   dataSource="${mydb}">
        SELECT * FROM party;
    </sql:query>
    	<sql:query var="listUserTable"   dataSource="${mydb}">
        SELECT * FROM UserLogin;
    </sql:query>
    
    <div class="userTable" align="center">
        <table class="first" border="1" cellpadding="5">
            <tr>
                <th>User Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>City</th>
                <th>Zip</th>
                <th>State</th>
                <th>Country</th>
                <th>Phone</th>
                <th>Update</th>
            </tr>
            <c:forEach var="user" items="${listPartyTable.rows}">
               	
               	
               	<c:forEach var="party" items="${listUserTable.rows}">
	               	<c:if test="${party.partyId==user.partyId}">
		                <tr>
		                    <td><c:out value="${party.userLoginId}" /></td>
		                    <td><c:out value="${user.firstname}" /></td>
		                    <td><c:out value="${user.lastname}" /></td>
		                    <td><c:out value="${user.address}" /></td>
		                    <td><c:out value="${user.city}" /></td>
		                    <td><c:out value="${user.zip}" /></td>
		                    <td><c:out value="${user.state}" /></td>
		                    <td><c:out value="${user.country}" /></td>
		                    <td><c:out value="${user.phone}" /></td>
		                    <td>
		                    	<a id="link1" href="update?id=<c:out value='${party.userLoginId}'/>"><button class="my_button">Edit</button></a>
								<a href="delete?id=<c:out value='${party.userLoginId}' />"><button class="my_button">Delete</button></a>
							</td>
		                </tr>
	                </c:if>
 		        </c:forEach>
 
            </c:forEach>
        </table>
    </div>
</body>
</html>
