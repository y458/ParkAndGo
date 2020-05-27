/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.controllers;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.GarageReview;
import com.example.parkbnb.models.User;
import com.example.parkbnb.services.GarageReviewServiceInterface;
import com.example.parkbnb.services.GarageServiceInterface;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dimit
 */
@Controller
public class GarageReviewController {

    @Autowired
    GarageServiceInterface gsi;
    
    @Autowired
    GarageReviewServiceInterface grsi;

    @GetMapping(value = "reviewGarage/{garageId}")
    public String reviewGarage(@PathVariable(name = "garageId") Integer garageId,
            ModelMap mm) {
        mm.addAttribute("garage", gsi.findById(garageId));
        return "reviewGarageForm";
    }

    @PostMapping(value = "reviewGarage/addGarageReview/{garageId}")
    public String addGarageReview(@PathVariable(name = "garageId") Integer garageId,
             @RequestParam (name = "stars") Integer stars,
            @RequestParam (name = "comment") String comment,
            ModelMap mm,
            HttpSession session) {
        Garage garage = gsi.findById(garageId);
        User user = (User) session.getAttribute("userSession");
        GarageReview temp = new GarageReview();
        temp.setGreviewRating(stars);
        temp.setGreviewComment(comment);
        temp.setGreviewUserid(user);
        temp.setGreviewGarageid(garage);
grsi.addGarageReview(temp);
        
        return "redirect:/main";
    }

    @GetMapping(value="showGarageReviews/{garageId}")
    public String showGarageReviews(@PathVariable(name = "garageId") Integer garageId,
            ModelMap mm){
        Garage garage = gsi.findById(garageId);
        mm.addAttribute("garageReviews", grsi.findByGarageId(garage));
        
        return "garageReviews";
    }
    
}
