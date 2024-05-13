package com.FlightTicketBooking.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.FlightTicketBooking.model.Customer;
import com.FlightTicketBooking.service.CustomerService;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/customers")
public class CustomerController {
	@Autowired
    private CustomerService customerService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("home");
	}
    
	@GetMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("home");
	}
	
	@GetMapping("/signup")
	public ModelAndView signup() {
		return new ModelAndView("signup");
	}

    @PostMapping("/create")
    public ModelAndView createCustomer(Customer customer) { 
    	if (customerService.checkIfExists(customer) ){
    		return new ModelAndView("login");
    	}
        Customer createdCustomer = customerService.createCustomer(customer);
        return new ModelAndView("login");
    }
    
    @PostMapping("/login")
    public ModelAndView loginCustomer(Customer customer, HttpSession session) {
    	ModelAndView view = new ModelAndView();
    	
    	if(customer.getEmail().equals("admin@admin.com") && customer.getUserPassWord().equals("admin")) {
    		session.setAttribute("customer", "Admin");
    		view.setViewName("adminHome");
    		view.addObject("req", "");
    		return view;
    	}
    	
    	Customer existing = customerService.validate(customer);
    	if (existing == null) {
    		view.setViewName("login");
    		view.addObject("message", "Invalid Credentials! Please try again.");
    	}
    	else {
    		view.setViewName("home");
    		view.addObject("customer",existing);
    		session.setAttribute("cust", existing);
    		session.setAttribute("custId", existing.getCustomerID());
    		
    	}
    	return view;
    }
    
    @GetMapping("/update/{customerId}")
    public ModelAndView updateView(@PathVariable long customerId) {
    	ModelAndView mView = new ModelAndView("profile");
    	
    	Optional<Customer> optionalCustomer = customerService.getCustomerByCustomerID(customerId);
    	if(optionalCustomer.isPresent()) {
    		mView.addObject("customer", optionalCustomer.get());
    	}
    	
    	return mView;
    }
    
    @PostMapping("/updateCustomer")
    public ModelAndView updateProfile(Customer customer) {
    	ModelAndView mView= new ModelAndView("home");
    	
    	Optional<Customer> optionalCustomer = customerService.getCustomerByCustomerID(customer.getCustomerID());
    	if(optionalCustomer.isPresent()) {
    		Customer existingCustomer = optionalCustomer.get();
    		
    		existingCustomer.setContactNumber(customer.getContactNumber());
    		existingCustomer.setEmail(customer.getEmail());
    		existingCustomer.setUserPassWord(customer.getUserPassWord());
    		
    		customerService.createCustomer(existingCustomer);
    	}
    	mView.addObject("msg", "Profile Updated!" );
    	return mView;
    }
    

}
