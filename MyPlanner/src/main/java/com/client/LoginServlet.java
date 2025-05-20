package com.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		
		
		String username=request.getParameter("uid");
		String password=request.getParameter("pass");
		
		
		boolean isTrue;
		
		isTrue= ClientDBUtil.validate(username, password);
		
		if(isTrue==true) {
			List<Client> clientDetails=ClientDBUtil.getClient(username);
			request.setAttribute("clientDetails", clientDetails);
			
			
			RequestDispatcher dis1=request.getRequestDispatcher("homepage.jsp");
			dis1.forward(request, response);
			
		}
		
		else {
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Your Username or Password is incorrect.Please try again');");
			out.println("location='clientlogin.jsp'");
			out.println("</script>");
			
		}
		
	}

}
