package com.FlightTicketBooking.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FlightTicketBooking.model.Booking;
import com.FlightTicketBooking.repository.BookingRepository;
@Service
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingRepository bookingRepository;

	@Override
	public Booking createBooking(Booking booking) {
		// TODO Auto-generated method stub
		return bookingRepository.save(booking);
	}

	@Override
	public List<Booking> getAllBookings() {
		// TODO Auto-generated method stub
		return bookingRepository.findAll();
	}

	@Override
	public List<Booking> getBookingByCustomerID(long customerID) {
		// TODO Auto-generated method stub
		return bookingRepository.findByCustomerID(customerID);
	}

	@Override
	public List<Booking> getBookingByFlightId(long flightid) {
		// TODO Auto-generated method stub
		return bookingRepository.findByFlightid(flightid);
	}

	@Override
	public Optional<Booking> getBookingByBookingId(long bookingid) {
		// TODO Auto-generated method stub
		return bookingRepository.findById(bookingid);
	}

	@Override
	public void cancelBooking(Long bookingid) {
		// TODO Auto-generated method stub
		bookingRepository.deleteById(bookingid);


	}

}
