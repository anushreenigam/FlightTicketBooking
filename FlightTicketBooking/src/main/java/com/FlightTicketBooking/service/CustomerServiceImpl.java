package com.FlightTicketBooking.service;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FlightTicketBooking.model.Customer;
import com.FlightTicketBooking.repository.CustomerRepository;
@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Customer createCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return customerRepository.save(customer);
	}
	
	@Override
	public Customer validate(Customer customer) {
		Optional<Customer> optionalCustomer=customerRepository.findByEmail(customer.getEmail());
		if (optionalCustomer.isPresent()) {
			if (optionalCustomer.get().getUserPassWord().equals(customer.getUserPassWord())){
				return optionalCustomer.get();
				
			}
		}
		return null;
		
	}

	@Override
	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		return customerRepository.findAll();
	}

	@Override
	public Optional<Customer> getCustomerByUserName(String userName) {
		// TODO Auto-generated method stub
		return customerRepository.findByUserName(userName);
	}

	@Override
	public Optional<Customer> getCustomerByCustomerID(long customerID) {
		// TODO Auto-generated method stub
		return customerRepository.findById(customerID);
	}

	@Override
	public Customer updateCustomer(String userName, Customer customer) {
		// TODO Auto-generated method stub
		Optional<Customer> existingCustomerOptional = customerRepository.findByUserName(userName);

        if (existingCustomerOptional.isPresent()) {
            Customer existingCustomer = existingCustomerOptional.get();
//            existingCustomer.setUserName(customer.getUserName());
            existingCustomer.setUserPassWord(customer.getUserPassWord());
            existingCustomer.setEmail(customer.getEmail());
            existingCustomer.setContactNumber(customer.getContactNumber());
            // Update other fields as needed

            return customerRepository.save(existingCustomer);
        } else {
            
            return null; 
        }
	}

	@Override
	public Customer updateCustomer(long customerID, Customer customer) {
		// TODO Auto-generated method stub
		Optional<Customer> existingCustomerOptional = customerRepository.findById(customerID);

        if (existingCustomerOptional.isPresent()) {
            Customer existingCustomer = existingCustomerOptional.get();
            //existingFlight.setFlightID(flight.getFlightID());
//            existingCustomer.setUserName(customer.getUserName());
            existingCustomer.setUserPassWord(customer.getUserPassWord());
            existingCustomer.setEmail(customer.getEmail());
            existingCustomer.setContactNumber(customer.getContactNumber());
            

            return customerRepository.save(existingCustomer);
        } else {
            
            return null; 
        }
	}

	@Override
	public void deleteCustomer(String userName) {
		// TODO Auto-generated method stub
		customerRepository.deleteByUserName(userName);

	}

	@Override
	public void deleteCustomer(long customerID) {
		// TODO Auto-generated method stub
		customerRepository.deleteById(customerID);

	}

	@Override
	public boolean checkIfExists(Customer customer) {
		// TODO Auto-generated method stub
		
		if(customerRepository.findByUserName(customer.getUserName()).isPresent()) {
			return true;
		}
		if(customerRepository.findByEmail(customer.getEmail()).isPresent()) {
			return true;
		}
		if(customerRepository.findByAadhaarNumber(customer.getAadhaarNumber()).isPresent()) {
			return true;
		}
		if(customerRepository.findByContactNumber(customer.getContactNumber()).isPresent()) {
			return true;
		}
		
		return false;
	}

}
