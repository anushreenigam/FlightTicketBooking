package com.FlightTicketBooking.service;

import java.util.List;
import java.util.Optional;

import com.FlightTicketBooking.model.Customer;

public interface CustomerService {
	Customer createCustomer (Customer customer);
	
	boolean checkIfExists(Customer customer);
	
	List<Customer> getAllCustomers();

	Optional<Customer> getCustomerByUserName(String userName);
	
	Optional<Customer> getCustomerByCustomerID(long customerID);

	Customer updateCustomer(String userName, Customer customer);
	
	Customer updateCustomer(long customerID, Customer customer);
	
	void deleteCustomer(String userName);
	
	void deleteCustomer(long customerID);
	
	Customer validate(Customer customer);

}
