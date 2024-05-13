package com.FlightTicketBooking.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FlightTicketBooking.model.Flight;
import com.FlightTicketBooking.repository.*;

@Service
public class FlightServiceImpl implements FlightService {

	@Autowired
	private FlightRepository flightRepository;
	
	@Override
	public Flight createFlight(Flight flight) {
		// TODO Auto-generated method stub
		return flightRepository.save(flight);
	}
	
	@Override
	public List<Flight> getAllFlights() {
		// TODO Auto-generated method stub
		return flightRepository.findAll();
	}

	@Override
	public Optional<Flight> getFlightById(long flightId) {
		// TODO Auto-generated method stub
		return flightRepository.findById(flightId);
	}


	@Override
	public Flight updateFlight(long id, Flight flight) {
		Optional<Flight> existingFlightOptional = flightRepository.findById(id);

        if (existingFlightOptional.isPresent()) {
            Flight existingFlight = existingFlightOptional.get();
            //existingFlight.setFlightID(flight.getFlightID());
            existingFlight.setFlightName(flight.getFlightName());
            existingFlight.setFlightSource(flight.getFlightSource());
            existingFlight.setFlightDestination(flight.getFlightDestination());
            existingFlight.setDepartureTime(flight.getDepartureTime());
            existingFlight.setArrivalTime(flight.getArrivalTime());
            existingFlight.setAvailableSeats(flight.getAvailableSeats());
            

            return flightRepository.save(existingFlight);
        } else {
            
            return null; 
        }
	}

	@Override
	public void deleteFlight(long flightId) {
		// TODO Auto-generated method stub
		flightRepository.deleteById(flightId);
	}

	@Override
	public List<Flight> searchFlights(String flightSource, String flightDestination, Date departureTime) {
		// TODO Auto-generated method stub
		List<Flight> allByDate = flightRepository.findByDepartureTime(departureTime);
		
		
		List<Flight> filterFlight = new ArrayList<>();
		for(Flight cursor:allByDate) {
			
			if(cursor.getFlightSource().equalsIgnoreCase(flightSource) && cursor.getFlightDestination().equalsIgnoreCase(flightDestination)) {
				filterFlight.add(cursor);
			}
		}
		return filterFlight;
	}

	

}