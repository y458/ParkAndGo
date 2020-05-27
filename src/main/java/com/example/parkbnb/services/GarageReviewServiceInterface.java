/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.GarageReview;

/**
 *
 * @author dimit
 */
public interface GarageReviewServiceInterface {
    public void addGarageReview(GarageReview garageReview);
    
    public GarageReview[] findByGarageId(Garage garage);
}
