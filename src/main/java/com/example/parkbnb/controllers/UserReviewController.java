/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.controllers;

import com.example.parkbnb.models.User;
import com.example.parkbnb.models.UserReview;
import com.example.parkbnb.services.UserReviewServiceInterface;
import com.example.parkbnb.services.UserServiceInterface;
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
public class UserReviewController {
    
    @Autowired
    UserServiceInterface usi;
    
    @Autowired
    UserReviewServiceInterface ursi;
    
    @GetMapping(value="/reviewUser/{userId}")
    public String reviewUserForm(@PathVariable (name="userId") Integer userId,
            ModelMap mm){
        User temp = usi.getUserByID(userId);
        mm.addAttribute("userToReview", temp);
        mm.addAttribute("toUserReviews",ursi.findAllByToUser(temp));
        return "reviewForm";
    }
    
    @PostMapping(value="/reviewUser/addReview/{userId}")
    public String reviewUserForm(@PathVariable (name="userId") Integer userId,
            @RequestParam (name = "stars") Integer stars,
            @RequestParam (name = "comment") String comment,
            HttpSession session){
         User fromUser = (User) session.getAttribute("userSession");
         User toUser = usi.getUserByID(userId);
         UserReview temp = new UserReview();
         
         temp.setUreviewRating(stars);
         temp.setUreviewComment(comment);
         temp.setUreviewFromuserid(fromUser);
         temp.setUreviewTouserid(toUser);
         
         ursi.addNewUserReview(temp);
         
         return "redirect:/showUsersGarages";
         
    }
    
    @GetMapping(value="/myReviews")
    public String myReviews(HttpSession session,
            ModelMap mm){
         User currentUser = (User) session.getAttribute("userSession");
         mm.addAttribute("userReviews", ursi.findAllByToUser(currentUser));
         return "myReviews";
    }
    
    @GetMapping(value="/manageUser/{id}")
    public String manageUser(HttpSession session,
    @PathVariable(name = "id") Integer id,
    ModelMap mm){
        User user = (User) session.getAttribute("userSession");
        if(user.getUserType()==2){
            User userToReview = usi.getUserByID(id);
            mm.addAttribute("userToManage", userToReview);
            mm.addAttribute("userReviews", ursi.findAllByToUser(userToReview));
            return "managePage";
        }
        session.setAttribute("userSession", null);
        return "index";
    } 
    
    @GetMapping(value="/manageUser/addReportPoint/{id}")
    public String addReportPoint(HttpSession session,
    @PathVariable(name = "id") Integer id,
    ModelMap mm){
        User user = (User) session.getAttribute("userSession");
        if(user.getUserType()==2){
            User userToReview = usi.getUserByID(id);
            userToReview.setUserReportpoints(userToReview.getUserReportpoints()+1);
            usi.insertNewUser(userToReview);
            return "redirect:/manageUser/"+userToReview.getUserId();
        }
        session.setAttribute("userSession", null);
        return "index";
    } 
    
    @GetMapping(value="/manageUser/ban/{id}")
    public String banUser(HttpSession session,
    @PathVariable(name = "id") Integer id,
    ModelMap mm){
        User user = (User) session.getAttribute("userSession");
        if(user.getUserType()==2){
            User userToReview = usi.getUserByID(id);
            userToReview.setUserActive((short)3);
            usi.insertNewUser(userToReview);
            
            return "redirect:/manageUser/"+userToReview.getUserId();
        }
        session.setAttribute("userSession", null);
        return "index";
    } 
        
    
}
