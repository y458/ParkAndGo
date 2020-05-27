/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.repositories;

import com.example.parkbnb.models.SiteReviews;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author dimit
 */
public interface SiteReviewRepository extends CrudRepository<SiteReviews, Integer>{
    
}
