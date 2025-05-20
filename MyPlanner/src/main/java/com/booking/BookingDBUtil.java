package com.booking;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.client.DBConnection;
import com.mysql.jdbc.PreparedStatement;

public class BookingDBUtil {
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	

	public static List<Booking> getBookingDetails(String client_id) {
	    List<Booking> booking = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	         java.sql.PreparedStatement ps = con.prepareStatement("SELECT * FROM bookingdata WHERE cid = ?")) {
	        ps.setString(1, client_id);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                int booking_id = rs.getInt("booking_id"); // Replace with the actual column name
	                String c_id = rs.getString("cid");
	                String hotel = rs.getString("hotel");
	                String hall = rs.getString("hall");
	                String edate = rs.getString("edate");
	                String etime = rs.getString("etime");

	                Booking b = new Booking(booking_id, c_id, hotel, hall, edate, etime);
	                booking.add(b);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return booking;
	}
	
	public static List<Booking> getAllBookings() {
	    List<Booking> booking = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery("SELECT * FROM bookingdata")) {
	        while (rs.next()) {
	            int booking_id = rs.getInt("booking_id");
	            String client_id = rs.getString("client_id");
	            String hotel = rs.getString("hotel");
	            String hall = rs.getString("hall");
	            String edate = rs.getString("edate");
	            String etime = rs.getString("etime");

	            Booking b = new Booking(booking_id, client_id, hotel, hall, edate, etime);
	            booking.add(b);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return booking;
	}



public static boolean bookingevent(String client_id, String hotel,String hall,String edate,String etime) {
	
	 isSuccess=false;

	
	
	try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		
		
		
		String sql="insert into bookingdata values(0,'"+client_id+"','"+hotel+"','"+hall+"','"+edate+"','"+etime+"');";
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0) {
			isSuccess=true;
		}
		else {
			isSuccess=false;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	return isSuccess;
	
	
}
public static boolean updateBooking(String booking_id, String client_id, String hotel, String hall, String edate, String etime) {
    boolean isSuccess = false;

    try {
        con = DBConnection.getConnection();

        String sql = "UPDATE bookingdata SET client_id=?, hotel=?, hall=?, edate=?, etime=? WHERE booking_id=?";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
        
        // Set the parameters for the prepared statement
        pstmt.setString(1, client_id);
        pstmt.setString(2, hotel);
        pstmt.setString(3, hall);
        pstmt.setString(4, edate);
        pstmt.setString(5, etime);
        pstmt.setString(6, booking_id);

        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            isSuccess = true;
        } else {
            isSuccess = false;
        }

    } catch (SQLException e) {
        e.printStackTrace();
      
    } finally {
       
        DBConnection.close(con);
    }

    return isSuccess;
}


public static boolean deletebooking(String bid) {
	isSuccess=false;
		int convId=Integer.parseInt(bid);
	
	
	try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		String sql="delete from bookingdata where booking_id='"+convId+"'";
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0) {
			isSuccess=true;
		}
		else {
			isSuccess=false;
		}
		
		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
	
	
	return isSuccess;
}

}
