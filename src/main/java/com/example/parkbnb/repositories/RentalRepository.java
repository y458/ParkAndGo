/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.repositories;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.Rental;
import com.example.parkbnb.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dimit
 */
@Repository
public interface RentalRepository extends CrudRepository<Rental,Integer>{
    Rental[] findByRentalGarageid(Garage rentalGarage);
    
    Rental findByRentalId(Integer rentalId);
    
    Rental[] findByRentalUserid(User rentalUserid);
}
