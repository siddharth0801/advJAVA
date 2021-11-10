package java_files.register_login_logout;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;


import java_files.database_connection.*;
import java_files.user.*;
/**
 * Servlet implementation class helloWorldFromServletIvan
 */
@WebServlet("/login")
public class Login  extends HttpServlet {
	
	/* Variable Declaration */
	Statement stmt;
	Connection conn;
	HttpServletRequest request;
	HttpServletResponse response;
	PrintWriter out;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.request=request;
		this.response=response;
		System.out.println("Arrived at Login Page");
		
		UserBean user=new UserBean();
		user.setUserLoginId(request.getParameter("user_userid"));
		user.setPassword(request.getParameter("user_password"));
	
		conn=ConnectionProvider.loginConnection(user);
		
	    //Returning alert in Register.jsp if user doesn't exist
		PrintWriter out=response.getWriter();
		if(conn==null)
		{
			//System output
			System.out.println("User doesnot exist, take it to login form again.");
		    //Forwarding Request
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			return;
		}
		else {
	        //Forwarding server to Success Page	
			System.out.println("Successful Login");
			request.setAttribute("user", user);
			user=ConnectionProvider.fetchUserByUserId(user);
			
			//Creating cookie to store successful registration.
			Cookie c=new Cookie("login","yes");
			response.addCookie(c);
			c.setMaxAge(300);
			
			RequestDispatcher rd=request.getRequestDispatcher("/UserProfile.jsp");
			rd.forward(request, response);
		}

		
	}

}

