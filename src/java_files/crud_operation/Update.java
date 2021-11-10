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
@WebServlet("/update")
public class Update  extends HttpServlet {
	
	/* Variable Declaration */
	Statement stmt;
	Connection conn;
	HttpServletRequest request;
	HttpServletResponse response;
	PrintWriter out;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		conn=ConnectionProvider.getConnection();
		String id=request.getParameter("id");
		System.out.println("Need to perform edit operation.");
		System.out.println("id value= "+ request.getParameter("id"));

		UserBean user=new UserBean();
		user.setUserLoginId(id);
		user=ConnectionProvider.fetchUserByUserId(user);
		ConnectionProvider.deleteUser(Integer.parseInt(id));
		request.setAttribute("user", user);
		System.out.println("sending to edit.jsp page");
		RequestDispatcher rd=request.getRequestDispatcher("/Edit.jsp");
		rd.forward(request,response);
	}

}

