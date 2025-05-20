package com.booking;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Call the database utility method to retrieve all booking details
        List<Booking> bookingDetails = BookingDBUtil.getAllBookings();

        if (bookingDetails != null && !bookingDetails.isEmpty()) {
            // Set the retrieved booking details in the request attribute
            request.setAttribute("BookingDetails", bookingDetails);

            // Forward the request to a JSP for displaying the details
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooking.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle the case where no booking details were found
            request.setAttribute("errorMessage", "No bookings found.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
            dispatcher.forward(request, response);
        }
    }
}


