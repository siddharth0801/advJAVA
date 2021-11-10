package java_files.register_login_logout;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 * Servlet implementation class helloWorldFromServletIvan
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
	
	/* Variable Declaration */
	Statement stmt;
	Connection conn;
	HttpServletRequest request;
	HttpServletResponse response;
	PrintWriter out;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cookie cookies[]=request.getCookies();
		String login="login";

		System.out.println("Starting to write cookie details.");
		if(cookies!=null)
		{
			for(Cookie c:cookies)
			{
				System.out.println("Check cookie "+c+" "+c.getValue().equals("yes"));
				if(c.getName().equals("login") && c.getValue().equals("yes"))
				{
					System.out.println("Login is set to no.");
					c.setValue("no");
					c.setMaxAge(300);
				}
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
	}

}

