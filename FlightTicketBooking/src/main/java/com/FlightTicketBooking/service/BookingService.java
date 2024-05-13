package com.FlightTicketBooking.service;

import java.util.List;
import java.util.Optional;

import com.FlightTicketBooking.model.Booking;

public interface BookingService {
	Booking createBooking (Booking booking);
	
	List<Booking> getAllBookings();

	List<Booking> getBookingByCustomerID(long customerID);
	
	List<Booking> getBookingByFlightId(long flightid);
	
	Optional<Booking> getBookingByBookingId(long bookingid);

	void cancelBooking(Long bookingid);
	
}
