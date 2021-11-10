package java_files.crud_operation;
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
@WebServlet("/search")
public class Search extends HttpServlet {
	
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
		System.out.println("Arrived at Search Page");
		
		UserBean user=new UserBean();
		user.setFirstName(request.getParameter("user_firstname"));
		user.setLastName(request.getParameter("user_lastname"));
	
		conn=ConnectionProvider.loginConnection(user);
		boolean userExist=ConnectionProvider.searchUser(user);
		
		if(userExist==true)
		{
			System.out.println("Search User Exist");
			request.setAttribute("user",user);
			RequestDispatcher rd=request.getRequestDispatcher("/AllUsers.jsp");
			rd.forward(request, response);
			return;
		}
		else {
			
			System.out.println("Search User Doesnot Exist");
			request.setAttribute("user",user);
			RequestDispatcher rd=request.getRequestDispatcher("/Search.jsp");
			rd.forward(request, response);
			return;
		}	
		}

	}



