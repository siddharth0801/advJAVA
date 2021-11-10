package java_files.register_login_logout;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java_files.database_connection.*;
import java_files.user.*;

import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Servlet implementation class helloWorldFromServletIvan
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	
	//Variable Declaration
	Connection conn;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		System.out.println("Arrived at /welcometonextpage");
		
		UserBean user=new UserBean();
		System.out.println("Started taking response.");
		user.setFirstName(request.getParameter("user_firstname"));
		user.setLastName(request.getParameter("user_lastname"));
		user.setAddress(request.getParameter("user_address"));
		user.setCity(request.getParameter("user_city"));
		user.setState(request.getParameter("user_state"));
		user.setCountry(request.getParameter("user_country"));
		user.setZip(request.getParameter("user_zip"));
		user.setPhone(request.getParameter("user_phone"));
		user.setPassword(request.getParameter("user_password"));
		user.setUserLoginId(request.getParameter("user_userid"));
		System.out.println("completed taking response.");
		
		conn=ConnectionProvider.registerConnection(user);
		
		//Registration faliure
		if(conn==null)
		{
			System.out.println("User Already Exist..");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.jsp");
			rd.forward(request, response);
	    	return;
		}
		
		//Registration success
		System.out.println("Registration is Successful.");
		PrintWriter out=response.getWriter();
		request.setAttribute("user",user);
		ConnectionProvider.fetchUserByUserId(user);
    	RequestDispatcher rd=request.getRequestDispatcher("/UserProfile.jsp");
    	rd.forward(request, response);
		
	}

}
