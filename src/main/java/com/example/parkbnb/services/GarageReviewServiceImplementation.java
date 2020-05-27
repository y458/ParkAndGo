/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.GarageReview;
import com.example.parkbnb.repositories.GarageReviewsRepository;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dimit
 */
@Service
@Transactional
public class GarageReviewServiceImplementation implements GarageReviewServiceInterface{

    @Autowired
    GarageReviewsRepository grr;
    
    @Override
    public void addGarageReview(GarageReview garageReview) {
        grr.save(garageReview);
    }

    @Override
    public GarageReview[] findByGarageId(Garage garage) {
        return grr.findByGreviewGarageid(garage);
    }
    
}
