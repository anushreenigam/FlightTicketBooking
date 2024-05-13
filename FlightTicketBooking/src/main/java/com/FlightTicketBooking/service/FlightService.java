package com.FlightTicketBooking.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import com.FlightTicketBooking.model.Flight;



public interface FlightService {
	Flight createFlight (Flight flight);
	
	List<Flight> getAllFlights();

	Optional<Flight> getFlightById(long flightId);

	List<Flight> searchFlights(String flightSource, String flightDestination, Date departureTime);

	Flight updateFlight(long flightId, Flight flight);
	
	void deleteFlight(long flightId);
	


}