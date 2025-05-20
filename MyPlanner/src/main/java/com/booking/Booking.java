package com.booking;

public class Booking {
	private int booking_id;
	private String client_id;
	private String hotel;
	private String hall;
	private String edate;
	private String etime;

	public Booking(int booking_id, String client_id, String hotel, String hall, String edate, String etime) {
		super();
		this.booking_id = booking_id;
		this.client_id = client_id;
		this.hotel = hotel;
		this.hall = hall;
		this.edate = edate;
		this.etime = etime;
	}

	

	public int getBooking_id() {
		return booking_id;
	}



	public String getClient_id() {
		return client_id;
	}



	public String getHotel() {
		return hotel;
	}

	public String gethall() {
		return hall;
	}

	public String getEdate() {
		return edate;
	}

	public String getEtime() {
		return etime;
	}
	
}
