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
 * Servlet implementation class deletevendorServlet
 */
@WebServlet("/deletevendorServlet")
public class deletevendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		boolean isTrue;
		
		isTrue=VendorDBUtil.deletevendor(id);
		
		
		if(isTrue==true) {
			
			String successMessage="Account Deleted successfully.";
			request.setAttribute("successMessage", successMessage);
			
			
			RequestDispatcher dis=request.getRequestDispatcher("vendorlogin.jsp");
			dis.forward(request, response);
		}
			
			else  {
				
				List<vendor> clientDetails=VendorDBUtil.getvendorDetails(id);
				request.setAttribute("clientDetails", clientDetails);
				
				String unsuccessMessage="Failed to delete account.";
				request.setAttribute("unsuccessMessage", unsuccessMessage);
				
				RequestDispatcher dis1=request.getRequestDispatcher("vuseraccount.jsp");
				dis1.forward(request, response);		}
		
		
		
		
	}
	}


