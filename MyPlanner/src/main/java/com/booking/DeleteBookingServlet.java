package com.booking;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.booking.Booking;
import com.booking.BookingDBUtil;

/**
 * Servlet implementation class DeleteBookingServlet
 */
@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String booking_id=request.getParameter("booking_id");
		boolean isTrue;
		
		isTrue=BookingDBUtil.deletebooking(booking_id);
		
		
		if (isTrue) {
		    String successMessage = "Booking Deleted successfully.";
		    response.sendRedirect("viewbooking.jsp?successMessage=" + successMessage);
		}
		// In the case of a failure to delete the booking
		else {
		    List<Booking> bookingDetails = BookingDBUtil.getBookingDetails(booking_id);
		    request.setAttribute("bookingDetails", bookingDetails);

		    String unsuccessMessage = "Failed to delete Booking.";
		    request.setAttribute("unsuccessMessage", unsuccessMessage);

		    RequestDispatcher dis1 = request.getRequestDispatcher("viewbooking.jsp");
		    dis1.forward(request, response);
		}
		
		
	}

}
