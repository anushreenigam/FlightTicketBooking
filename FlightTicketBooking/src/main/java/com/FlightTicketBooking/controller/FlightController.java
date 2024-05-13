package com.FlightTicketBooking.controller;

import java.util.Collections;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.FlightTicketBooking.model.Flight;
import com.FlightTicketBooking.service.FlightService;


@RestController
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	private FlightService flightService;
	
	@PostMapping("/createFlight")
	public ResponseEntity<Flight> createFlight(@RequestBody Flight flight) {
		Flight newFlight = flightService.createFlight(flight);
		return new ResponseEntity<>(newFlight, HttpStatus.OK);
	}

    @GetMapping("/getAllFlight")
    public ResponseEntity<List<Flight>> getAllFlights() {
        List<Flight> flightList = flightService.getAllFlights();
        if (!flightList.isEmpty()) {
            return new ResponseEntity<>(flightList, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
        }
    }

    @GetMapping("/getFlight/{id}")
    public ResponseEntity<Optional<Flight>> getFlightById(@PathVariable long id) {
        Optional<Flight> flight = flightService.getFlightById(id);
        return flight.map(value -> new ResponseEntity<>(flight, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/updateFlight/{id}")
    public ResponseEntity<Flight> updateFlight(@PathVariable long id, @RequestBody Flight flight) {
        Flight updatedFlight = flightService.updateFlight(id, flight);
        if (updatedFlight != null) {
            return new ResponseEntity<>(updatedFlight, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/deleteFlight/{id}")
    public ResponseEntity<Void> deleteFlight(@PathVariable long id) {
        flightService.deleteFlight(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    } 
    
    @PostMapping("/searchFlight")
    public ModelAndView searchFlight(String flightSource,String flightDestination,Date departureTime) {
    	ModelAndView mView = new ModelAndView("flight");
    	
    	List<Flight> flights = flightService.searchFlights(flightSource,flightDestination,departureTime);
    	mView.addObject("flights", flights);
    	
    	return mView;
    }
	
}

