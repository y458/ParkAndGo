/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;


import com.example.parkbnb.models.User;

/**
 *
 * @author dimit
 */
public interface UserServiceInterface {
 
    public boolean checkIfUsernameExists(String username);
    
    public void insertNewUser(User u);
    
    public User getUserByUsername(String username);

    public User getByGeneratedArray(String generatedArray);

    public User getByEmail(String mail);
    
    public User getUserByID(Integer id);
    
    public User[] findByUserType(short type);
}
