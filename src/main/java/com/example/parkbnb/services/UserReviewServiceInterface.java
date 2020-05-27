/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.User;
import com.example.parkbnb.models.UserReview;

/**
 *
 * @author dimit
 */
public interface UserReviewServiceInterface {
    public void addNewUserReview(UserReview userReview);
    
    public UserReview[] findAllByToUser(User toUser);
}
