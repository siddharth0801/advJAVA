package java_files.crud_operation;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;

import java_files.database_connection.ConnectionProvider;
/**
 * Servlet implementation class helloWorldFromServletIvan
 */
@WebServlet("/delete")
public class Delete  extends HttpServlet {
	
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
		System.out.println("Need to perform delete operation.");
		System.out.println("id value= "+ request.getParameter("id"));
		ConnectionProvider.deleteUser(Integer.parseInt(id));
		RequestDispatcher rd=request.getRequestDispatcher("/AllUsers.jsp");
		rd.forward(request,response);
		return;
	}

}

