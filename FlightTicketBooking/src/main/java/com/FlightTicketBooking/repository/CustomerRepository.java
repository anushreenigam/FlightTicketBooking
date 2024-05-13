package com.FlightTicketBooking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.FlightTicketBooking.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>

{
	
	public Optional<Customer> findByUserName(String userName);
	
	public void deleteByUserName(String userName);
	
	public Optional<Customer> findByEmail(String email);
	
	public Optional<Customer> findByAadhaarNumber(String aadharNumber);
	
	public Optional<Customer> findByContactNumber(String contactNumber);
	
	
	
	

}