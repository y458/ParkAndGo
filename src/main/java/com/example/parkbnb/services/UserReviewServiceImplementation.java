/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.User;
import com.example.parkbnb.models.UserReview;
import com.example.parkbnb.repositories.UserReviewRepository;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dimit
 */
@Service
@Transactional
public class UserReviewServiceImplementation implements UserReviewServiceInterface{

    @Autowired
    UserReviewRepository urr;
    
    @Override
    public void addNewUserReview(UserReview userReview) {
        urr.save(userReview);
    }

    @Override
    public UserReview[] findAllByToUser(User toUser) {
        return urr.findByUreviewTouserid(toUser);
    }
    
}
