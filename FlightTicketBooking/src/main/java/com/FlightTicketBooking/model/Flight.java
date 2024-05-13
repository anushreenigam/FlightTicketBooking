package com.FlightTicketBooking.model;

import java.sql.Date;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Flight{
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
	    private long flightId;
	    private String flightName;
	    private Date departureTime;
	    private Date arrivalTime;
	    private String flightSource;
	    private String flightDestination;
	    private int availableSeats;
	    private String timeString;
	    private int price;
	    
	    
	    public Flight() {
	    	
	    }

	    public Flight(long flightId, String flightName, Date departureTime, Date arrivalTime, String flightSource,
				String flightDestination, int availableSeats, String timeString, int price) {
			super();
			this.flightId = flightId;
			this.flightName = flightName;
			this.departureTime = departureTime;
			this.arrivalTime = arrivalTime;
			this.flightSource = flightSource;
			this.flightDestination = flightDestination;
			this.availableSeats = availableSeats;
			this.timeString = timeString;
			this.price = price;
		}

		@Override
		public String toString() {
			return "Flight [flightId=" + flightId + ", flightName=" + flightName + ", departureTime=" + departureTime
					+ ", arrivalTime=" + arrivalTime + ", flightSource=" + flightSource + ", flightDestination="
					+ flightDestination + ", availableSeats=" + availableSeats + "]";
		}

		// Getters and Setters
	    public long getFlightID() {
	        return flightId;
	    }

	    public void setFlightID(long flightId) {
	        this.flightId = flightId;
	    }

	    public String getFlightName() {
	        return flightName;
	    }

	    public void setFlightName(String flightName) {
	        this.flightName = flightName;
	    }

	    public Date getDepartureTime() {
	        return departureTime;
	    }

	    public void setDepartureTime(Date departureTime) {
	        this.departureTime = departureTime;
	    }

	    public Date getArrivalTime() {
	        return arrivalTime;
	    }

	    public void setArrivalTime(Date arrivalTime) {
	        this.arrivalTime = arrivalTime;
	    }

	    public String getFlightSource() {
	        return flightSource;
	    }

	    public void setFlightSource(String flightSource) {
	        this.flightSource = flightSource;
	    }

	    public String getFlightDestination() {
	        return flightDestination;
	    }

	    public void setFlightDestination(String flightDestination) {
	        this.flightDestination = flightDestination;
	    }

	    public int getAvailableSeats() {
	        return availableSeats;
	    }

	    public void setAvailableSeats(int availableSeats) {
	        this.availableSeats = availableSeats;
	    }

		public String getTimeString() {
			return timeString;
		}

		public void setTimeString(String timeString) {
			this.timeString = timeString;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}
	}

