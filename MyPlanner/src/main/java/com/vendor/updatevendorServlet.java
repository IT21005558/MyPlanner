package com.vendor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class updatevendorServlet
 */
@WebServlet("/updatevendorServlet")
public class updatevendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
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
		
		boolean isTrue;
		
		isTrue=VendorDBUtil.updatevendor(id, name, email, phone, address,services, username, password);
		
		if(isTrue==true) {
			
			List<vendor> vendorDetails=VendorDBUtil.getvendorDetails(id);
			request.setAttribute("vendorDetails", vendorDetails);
			
			String successMessage=" Details updated successfully.";
			request.setAttribute("successMessage", successMessage);
			
			
			RequestDispatcher dis1=request.getRequestDispatcher("vuseraccount.jsp");
			dis1.forward(request, response);
		}
		else {
			
			List<vendor> vendorDetails=VendorDBUtil.getvendorDetails(id);
			request.setAttribute("vendorDetails", vendorDetails);
			
			
			String unsuccessMessage="Error,Vendor details updation failed.";
			request.setAttribute("unsuccessMessage", unsuccessMessage);
			
		RequestDispatcher dis1=request.getRequestDispatcher("vuseraccount.jsp");
		dis1.forward(request, response);
		}
		
		}
		

}
