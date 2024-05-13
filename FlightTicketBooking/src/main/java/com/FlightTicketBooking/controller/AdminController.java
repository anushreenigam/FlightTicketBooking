package com.FlightTicketBooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.FlightTicketBooking.model.Flight;
import com.FlightTicketBooking.service.CustomerService;
import com.FlightTicketBooking.service.FlightService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	FlightService flightService;
	
	@GetMapping("/home")
	public ModelAndView home(HttpSession session) {
		if(!session.getAttribute("customer").equals("Admin")) {
			session.invalidate();
			return new ModelAndView("home");
		}
		ModelAndView view = new ModelAndView("adminHome");
		view.addObject("req", "");
		return view;
	}
	
	@GetMapping("/allCustomers")
	public ModelAndView allCustomers() {
		ModelAndView view = new ModelAndView("adminHome");
		view.addObject("req", "customers");
		view.addObject("customers", customerService.getAllCustomers());
		
		return view;
	}
	
	@GetMapping("/allFlights")
	public ModelAndView allFlights() {
		ModelAndView view = new ModelAndView("adminHome");
		view.addObject("req", "flights");
		view.addObject("flights", flightService.getAllFlights());
		
		return view;
	}
	
	@GetMapping("/addFlight")
	public ModelAndView addFlightView() {
		ModelAndView view = new ModelAndView("adminHome");
		view.addObject("req", "addFlight");
		
		return view;
	}
	
	@PostMapping("/addFlight")
	public ModelAndView addFlight(Flight flight) {
		ModelAndView view = new ModelAndView("adminHome");
		view.addObject("req", "");
		Flight newFlight=flightService.createFlight(flight);
		return view;
	}
	
	@PostMapping("/deleteFlight")
	public ModelAndView addFlight(@RequestParam long flightID, HttpSession session) {
		if(!session.getAttribute("customer").equals("Admin")) {
			session.invalidate();
			return new ModelAndView("home");
		}
		
		ModelAndView view = new ModelAndView("adminHome");
		view.addObject("req", "");
		flightService.deleteFlight(flightID);
		return view;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("home");
		
	}
}
