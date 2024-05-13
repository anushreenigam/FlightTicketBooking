package com.FlightTicketBooking.model;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Bookings")
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="bookingid")
	private long bookingID;
	@Column(name="customerid")
    private long customerID;
	@Column(name="flightId")
    private long flightid;
	@Column(name="bookingdate")
    private Date bookingDate;
	private int numberofseats;
	@Column(name="totalprice")
	private int totalPrice;
	
	public int getNumberofseats() {
		return numberofseats;
	}

	public void setNumberofseats(int numberofseats) {
		this.numberofseats = numberofseats;
	}

	public Booking(long bookingID, long customerID, long flightid, Date bookingDate, int numberofseats, int totalPrice) {
		super();
		this.bookingID = bookingID;
		this.customerID = customerID;
		this.flightid = flightid;
		this.bookingDate = bookingDate;
		this.numberofseats=numberofseats;
		this.totalPrice = totalPrice;
	}

	public Booking() {
		super();
	}

	@Override
	public String toString() {
		return "Booking [bookingID=" + bookingID + ", customerID=" + customerID + ", flightid=" + flightid
				+ ", bookingDate=" + bookingDate + "]";
	}

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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
