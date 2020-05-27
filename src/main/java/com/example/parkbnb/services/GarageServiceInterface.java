/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.User;
import java.util.ArrayList;

/**
 *
 * @author dimit
 */
public interface GarageServiceInterface {
    
    public Garage addGarage(Garage garage); 
    
    public Garage[] getGaragesByConfirmation(Integer confirmationType);
    
    public Garage findById(Integer id);
    
    public Garage[] getUserGarages(User user);
    
}
