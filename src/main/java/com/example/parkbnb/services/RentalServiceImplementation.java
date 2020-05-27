/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.Rental;
import com.example.parkbnb.models.User;
import com.example.parkbnb.repositories.RentalRepository;
import java.util.ArrayList;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dimit
 */
@Service
@Transactional
public class RentalServiceImplementation implements RentalServiceInterface {

    @Autowired
    RentalRepository rr;

    @Override
    public void addNewRental(Rental rental) {
        rr.save(rental);
    }

    @Override
    public ArrayList<Rental> getAvailable() {
        return (ArrayList<Rental>) rr.findAll();
    }

    @Override
    public Rental[] getGarageRentals(Garage garage) {
        return rr.findByRentalGarageid(garage);
    }

    @Override
    public void removeRental(Rental rental) {
        rr.delete(rental);
    }

    @Override
    public Rental getRentalById(Integer id) {
        Rental temp = rr.findByRentalId(id);
        return temp;
    }

    @Override
    public Rental[] findByRentalUser(User user) {
        return rr.findByRentalUserid(user);
    }

}
