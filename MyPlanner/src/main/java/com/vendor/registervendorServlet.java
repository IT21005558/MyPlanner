package com.vendor;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class registervendorServlet
 */
@WebServlet("/registervendorServlet")
public class registervendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		
		
		String[] servicesArray = request.getParameterValues("services[]");
		String services="";
		if (servicesArray != null && servicesArray.length > 0) {
		     services = String.join(", ", servicesArray);
		   
		}
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
	boolean isTrue=	VendorDBUtil.registervendor(name, email, phone, address,services, username, password);
		
		if(isTrue==true) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Registration Successful');");
			out.println("location='vendorlogin.jsp'");
			out.println("</script>");
		}
		
		if(isTrue==false) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Registration Unsucessful.Please try again');");
			out.println("location='vendorlogin.jsp'");
			out.println("</script>");
		}
	}
	
	

}
