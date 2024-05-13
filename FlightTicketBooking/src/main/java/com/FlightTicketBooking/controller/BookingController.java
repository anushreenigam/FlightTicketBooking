package com.FlightTicketBooking.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.FlightTicketBooking.model.Booking;
import com.FlightTicketBooking.model.BookingHistory;
import com.FlightTicketBooking.model.Flight;
import com.FlightTicketBooking.service.BookingService;
import com.FlightTicketBooking.service.FlightService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/bookings")
public class BookingController {
	@Autowired
    private BookingService bookingService;
	
	@Autowired
    private FlightService flightService;
	
	@PostMapping("/book")
    public ModelAndView booking(Booking booking, HttpSession session) {
		//System.out.println(booking.getTotalPrice());
		
		if(session.getAttribute("cust")==null) {
			return new ModelAndView("login");
		}
		booking.setBookingDate(new Date(System.currentTimeMillis()));
        //Booking createdBooking = bookingService.createBooking(booking);
		ModelAndView mView=new ModelAndView("booking");
		mView.addObject("booking", booking);
        return new ModelAndView("booking");
    }
	
	@PostMapping("/create")
    public ModelAndView createBooking(Booking booking, HttpSession session) {
		
		if(session.getAttribute("cust")==null) {
			return new ModelAndView("login");
		}
		booking.setBookingDate(new Date(System.currentTimeMillis()));
		ModelAndView mView=new ModelAndView("home");
		
		Flight flight= flightService.getFlightById(booking.getFlightid()).get();
		if(flight.getAvailableSeats()>booking.getNumberofseats()) {
			mView.addObject("msg", "Bon Voyage! Booking Confirmed");
			bookingService.createBooking(booking);
			flight.setAvailableSeats(flight.getAvailableSeats()-booking.getNumberofseats());
			flightService.createFlight(flight);
		}else {
			mView.addObject("msg", "Insufficient no. of seats available!");
		}
		
        return mView;
    }
	
	@GetMapping("/history/{customerId}")
	public ModelAndView bookingHistory(@PathVariable long customerId, HttpSession session) {
		if(session.getAttribute("cust")==null) {
			return new ModelAndView("login");
		}
		ModelAndView mView = new ModelAndView("bookinghistory");
		List<Booking> list = bookingService.getBookingByCustomerID(customerId);
		
		Flight flight;
		List<BookingHistory> bookings = new ArrayList<>();
		for(Booking book : list) {
			flight= flightService.getFlightById(book.getFlightid()).get();
			bookings.add(new BookingHistory(book.getBookingID(),book.getCustomerID(),book.getFlightid(),book.getBookingDate(),book.getNumberofseats(),book.getTotalPrice(),flight.getFlightName(),flight.getDepartureTime(),flight.getTimeString()));
		}
		
		
		mView.addObject("bookings", bookings);
		return mView;
	}
	
	@GetMapping("/getAllBookings")
    public ResponseEntity<List<Booking>> getAllBookings() {
        List<Booking> bookingList = bookingService.getAllBookings();
        if (!bookingList.isEmpty()) {
            return new ResponseEntity<>(bookingList, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
        }
    }
	
	@GetMapping("/customerId/{customerId}")
    public ResponseEntity<List<Booking>> getBookingByCustomerID(@PathVariable Long customerId) {
        List<Booking> bookingList = bookingService.getBookingByCustomerID(customerId);
        if (!bookingList.isEmpty()) {
            return new ResponseEntity<>(bookingList, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
        }
    }
	
	@GetMapping("/flightId/{flightId}")
    public ResponseEntity<List<Booking>> getBookingByFlightId(@PathVariable Long flightId) {
        List<Booking> bookingList = bookingService.getBookingByFlightId(flightId);
        if (!bookingList.isEmpty()) {
            return new ResponseEntity<>(bookingList, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
        }
    }
	
	@GetMapping("/bookingid/{bookingId}")
    public ResponseEntity<Booking> getBookingById(@PathVariable Long bookingId) {
        Optional<Booking> booking = bookingService.getBookingByBookingId(bookingId);
        return ResponseEntity.ok(booking.get());
    }
	
	@GetMapping("/cancel/{bookingId}")
	public ModelAndView cancelBooking(@PathVariable Long bookingId, HttpSession session) {
		if(session.getAttribute("cust")==null) {
			return new ModelAndView("login");
		}
		ModelAndView mView = new ModelAndView("home");
		mView.addObject("msg1", "Booking cancelled successfully! Hope to see you again.");
		Booking booking=bookingService.getBookingByBookingId(bookingId).get();
		Flight flight = flightService.getFlightById(booking.getFlightid()).get();
		flight.setAvailableSeats(flight.getAvailableSeats()+booking.getNumberofseats());
		flightService.createFlight(flight);
        bookingService.cancelBooking(bookingId);
        return mView;
    }
	

}
