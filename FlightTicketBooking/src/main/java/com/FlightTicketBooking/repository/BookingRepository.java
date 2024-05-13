package com.FlightTicketBooking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.FlightTicketBooking.model.Booking;
@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
	
	List<Booking> findByFlightid(long flightid);
	
	List<Booking> findByCustomerID(long customerID);

}
