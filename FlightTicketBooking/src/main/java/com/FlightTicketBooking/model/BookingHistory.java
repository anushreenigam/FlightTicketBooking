package com.FlightTicketBooking.model;

import java.sql.Date;

public class BookingHistory {
	private long bookingID;
    private long customerID;
    private long flightid;
    private Date bookingDate;
	private int numberofseats;
	private int totalPrice;
	private String flightName;
	private Date departureTime;
	private String timeString;
	public long getBookingID() {
		return bookingID;
	}
	public void setBookingID(long bookingID) {
		this.bookingID = bookingID;
	}
	public long getCustomerID() {
		return customerID;
	}
	public void setCustomerID(long customerID) {
		this.customerID = customerID;
	}
	public long getFlightid() {
		return flightid;
	}
	public void setFlightid(long flightid) {
		this.flightid = flightid;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public int getNumberofseats() {
		return numberofseats;
	}
	public void setNumberofseats(int numberofseats) {
		this.numberofseats = numberofseats;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public Date getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}
	public String getTimeString() {
		return timeString;
	}
	public void setTimeString(String timeString) {
		this.timeString = timeString;
	}
	public BookingHistory(long bookingID, long customerID, long flightid, Date bookingDate, int numberofseats,
			int totalPrice, String flightName, Date departureTime, String timeString) {
		super();
		this.bookingID = bookingID;
		this.customerID = customerID;
		this.flightid = flightid;
		this.bookingDate = bookingDate;
		this.numberofseats = numberofseats;
		this.totalPrice = totalPrice;
		this.flightName = flightName;
		this.departureTime = departureTime;
		this.timeString = timeString;
	}
	public BookingHistory() {
		super();
	}
	@Override
	public String toString() {
		return "BookingHistory [bookingID=" + bookingID + ", customerID=" + customerID + ", flightid=" + flightid
				+ ", bookingDate=" + bookingDate + ", numberofseats=" + numberofseats + ", totalPrice=" + totalPrice
				+ ", flightName=" + flightName + ", departureTime=" + departureTime + ", timeString=" + timeString
				+ "]";
	}
	
}
