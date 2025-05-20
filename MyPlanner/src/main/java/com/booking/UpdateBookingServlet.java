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
 * Servlet implementation class UpdateBookingServlet
 */
@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String booking_id=request.getParameter("booking_id");
		String client_id=request.getParameter("client_id");
		String hotel=request.getParameter("hotel");
		String hall=request.getParameter("hall");
		String edate=request.getParameter("edate");
		String etime=request.getParameter("etime");
		
        boolean isTrue;
		
		isTrue=BookingDBUtil.updateBooking(booking_id, client_id, hotel, hall, edate, etime);
		
		if (isTrue) {
		    List<Booking> bookingDetails = BookingDBUtil.getBookingDetails(booking_id);
		    request.setAttribute("bookingDetails", bookingDetails);

		    String successMessage = "Client details updated successfully.";
		    request.setAttribute("successMessage", successMessage);

		    // Redirect to prevent resubmission
		    response.sendRedirect("viewbooking.jsp");
		} else {
		    // Error handling remains the same
		    List<Booking> bookingDetails = BookingDBUtil.getBookingDetails(booking_id);
		    request.setAttribute("bookingDetails", bookingDetails);

		    String unsuccessMessage = "Error, Booking details updation failed.";
		    request.setAttribute("unsuccessMessage", unsuccessMessage);

		    RequestDispatcher dis1 = request.getRequestDispatcher("viewbooking.jsp");
		    dis1.forward(request, response);
		}

		
	}

}
