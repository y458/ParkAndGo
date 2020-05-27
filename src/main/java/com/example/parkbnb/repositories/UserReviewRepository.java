/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.repositories;

import com.example.parkbnb.models.User;
import com.example.parkbnb.models.UserReview;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dimit
 */
@Repository
public interface UserReviewRepository extends CrudRepository<UserReview,Integer>{
    UserReview[] findByUreviewTouserid(User ureviewTouserid);
}
