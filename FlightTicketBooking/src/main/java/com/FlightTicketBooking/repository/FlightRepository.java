package com.FlightTicketBooking.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.FlightTicketBooking.model.Flight;

@Repository 
public interface FlightRepository extends JpaRepository<Flight, Long> 

{
	@Query(value = "SELECT f FROM Flight f WHERE DATE(f.departureTime) = :departureTime")
    List<Flight> findByDepartureTime(Date departureTime);

}