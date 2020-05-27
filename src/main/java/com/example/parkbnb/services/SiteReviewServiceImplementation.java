/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.SiteReviews;
import com.example.parkbnb.repositories.SiteReviewRepository;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dimit
 */
@Service
@Transactional
public class SiteReviewServiceImplementation implements SiteReviewServiceInterface{

    @Autowired
    SiteReviewRepository srr;
    
    @Override
    public void addNewSiteReview(SiteReviews siteReview) {
        srr.save(siteReview);
    }
    
}
