package com.FlightTicketBooking.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="customers")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="customerid")
	private long customerID;
	@Column(name="username")
    private String userName;
	@Column(name="userpassword")
    private String userPassWord;
	@Column(name="firstname")
    private String firstName;
	@Column(name="lastname")
    private String lastName;
	@Column(name="email")
    private String email;
	@Column(name="contactnumber")
    private String contactNumber;
	@Column(name="aadhaarnumber")
    private String aadhaarNumber;
    
	public Customer(long customerID, String userName, String userPassWord, String firstName, String lastName,
			String email, String contactNumber, String aadhaarNumber) {
		super();
		this.customerID = customerID;
		this.userName = userName;
		this.userPassWord = userPassWord;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.contactNumber = contactNumber;
		this.aadhaarNumber = aadhaarNumber;
		
	}

	public Customer() {
		super();
	}

	public long getCustomerID() {
		return customerID;
	}

	public void setCustomerID(long customerID) {
		this.customerID = customerID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassWord() {
		return userPassWord;
	}

	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getAadhaarNumber() {
		return aadhaarNumber;
	}

	public void setAadhaarNumber(String aadhaarNumber) {
		this.aadhaarNumber = aadhaarNumber;
	}

	@Override
	public String toString() {
		return "Customer [customerID=" + customerID + ", userName=" + userName + ", userPassWord=" + userPassWord
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", contactNumber="
				+ contactNumber + ", aadhaarNumber=" + aadhaarNumber + "]";
	}
	
	
    

}
