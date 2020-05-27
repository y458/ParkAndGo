/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.controllers;

import com.example.parkbnb.models.Garage;
import com.example.parkbnb.models.Rental;
import com.example.parkbnb.models.User;
import com.example.parkbnb.services.GarageServiceInterface;
import com.example.parkbnb.services.RentalServiceInterface;
import com.example.parkbnb.services.UserServiceInterface;
import com.example.parkbnb.utils.RentalUtils;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author dimit
 */
@Controller
public class RentalController {
    
    @Autowired
    GarageServiceInterface gsi;
    @Autowired
    RentalServiceInterface rsi;
    @Autowired
    UserServiceInterface usi;
    
    
    @GetMapping(value = "/addDates/{id}")
    public String addAvailableDates(@PathVariable(name = "id") Integer garageId,
            @RequestParam(name = "datetimes") String datetimes,
            @RequestParam(name = "pph") String pph) {
        Garage tempGarage = gsi.findById(garageId);
        double price = Double.parseDouble(pph);
        String[] dates = datetimes.split("-");
        LocalDateTime start = LocalDateTime.parse(dates[0].trim(), DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        LocalDateTime end = LocalDateTime.parse(dates[1].trim(), DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        
        Rental[] garageRentals = rsi.getGarageRentals(tempGarage);
        boolean isAlloweToAdd = true;
        
        for (Rental r : garageRentals) {
            LocalDateTime oldRentalStart = LocalDateTime.ofInstant(r.getRentalStart().toInstant(), ZoneId.systemDefault());
            LocalDateTime oldRentalEnd = LocalDateTime.ofInstant(r.getRentalEnd().toInstant(), ZoneId.systemDefault());
            
            if (start.isAfter(oldRentalStart) && start.isBefore(oldRentalEnd) || (end.isAfter(oldRentalStart) && end.isBefore(oldRentalEnd))||start.equals(oldRentalStart)||(end.equals(oldRentalEnd))) {
                //TODO return error
                isAlloweToAdd = false;
            }
        }
        
        if (isAlloweToAdd) {
            Rental tempRental = new Rental();
            tempRental.setRentalStart(Date.from(start.atZone(ZoneId.systemDefault()).toInstant()));
            tempRental.setRentalEnd(Date.from(end.atZone(ZoneId.systemDefault()).toInstant()));
            tempRental.setRentalPaydone((short) 0);
            BigDecimal bd = new BigDecimal(price);
            tempRental.setRentalPriceperhour(bd);
            tempRental.setRentalGarageid(tempGarage);
            rsi.addNewRental(tempRental);
        }
        return "redirect:/showUsersGaragesNew";
    }
    
    @ResponseBody
    @PostMapping(value = "/garageRentals/{garagaId}")
    public Rental[] getGarageRentals(@PathVariable(name = "garagaId") Integer garageId) {
        Garage temp = gsi.findById(garageId);
        return rsi.getGarageRentals(temp);
    }
    
    @ResponseBody
    @GetMapping(value = "/getAvailableGarages")
    public ArrayList<Rental> getAvailableGarages() {
        return rsi.getAvailable();
    }
    
    @ResponseBody
    @PostMapping(value = "/getRental/{rentalId}")
    public Rental getRental(@PathVariable(name = "rentalId") Integer rentalId) {
        return rsi.getRentalById(rentalId);
    }
    
    @GetMapping(value = "/removeRental/{rentalid}")
    public String removeRental(@PathVariable(name = "rentalid") Integer rentalid,
            HttpSession session) {
         User user = (User) session.getAttribute("userSession");

         Rental existingRental = rsi.getRentalById(rentalid);
        
         if(existingRental.getRentalUserid()==null){
             rsi.removeRental(existingRental);
             return "redirect:/showUsersGaragesNew";
         }
         
        User tempu = usi.getUserByID(user.getUserId());
        tempu.setUserWalletmoney(tempu.getUserWalletmoney().subtract(existingRental.getRentalTotalpayed()));
        usi.insertNewUser(tempu);
        
        User temp = usi.getUserByID(existingRental.getRentalUserid().getUserId());
        temp.setUserWalletmoney(temp.getUserWalletmoney().add(existingRental.getRentalTotalpayed()));
        usi.insertNewUser(temp);
        session.setAttribute("userSession", temp);
        
        rsi.removeRental(existingRental);
        return "redirect:/showUsersGaragesNew";
    }
    
    @PostMapping("/book/{rentalId}")
    public String bookRental(@PathVariable(name = "rentalId") Integer rentalId,
            @RequestParam(name = "dates") String dates,
            @RequestParam(name = "totalPrice") double totalPrice,
            HttpSession session) {
        RentalUtils rentalUtils = new RentalUtils();
        LocalDateTime[] formatedDates = rentalUtils.handleRentalDates(dates);
        Rental existingRental = rsi.getRentalById(rentalId);
        User user = (User) session.getAttribute("userSession");
        if(user.getUserWalletmoney().subtract(BigDecimal.valueOf(totalPrice)).compareTo(BigDecimal.ZERO)<0){
            return "redirect:/";
        }
        LocalDateTime oldRentalStart = LocalDateTime.ofInstant(existingRental.getRentalStart().toInstant(), ZoneId.systemDefault());
        LocalDateTime oldRentalEnd = LocalDateTime.ofInstant(existingRental.getRentalEnd().toInstant(), ZoneId.systemDefault());
        
        User tempu = usi.getUserByID(user.getUserId());
        tempu.setUserWalletmoney(tempu.getUserWalletmoney().subtract(BigDecimal.valueOf(totalPrice)));
        usi.insertNewUser(tempu);
        session.setAttribute("userSession", tempu);
        
        User temp = usi.getUserByID(existingRental.getRentalGarageid().getGarageUserid().getUserId());
        temp.setUserWalletmoney(temp.getUserWalletmoney().add(BigDecimal.valueOf(totalPrice)));
        usi.insertNewUser(temp);
        
        if (oldRentalStart.equals(formatedDates[0]) && oldRentalEnd.equals(formatedDates[1])) {
            existingRental.setRentalUserid(user);
            existingRental.setRentalTotalpayed(BigDecimal.valueOf(totalPrice));
            rsi.addNewRental(existingRental);
        } else if (oldRentalStart.equals(formatedDates[0])) {
            
            Rental newRent = new Rental();
            newRent.setRentalGarageid(existingRental.getRentalGarageid());
            newRent.setRentalPaydone((short) 1);
            newRent.setRentalPriceperhour(existingRental.getRentalPriceperhour());
            newRent.setRentalUserid(user);
            newRent.setRentalStart(existingRental.getRentalStart());
            newRent.setRentalEnd(Date.from(formatedDates[1].atZone(ZoneId.systemDefault()).toInstant()));
            newRent.setRentalTotalpayed(BigDecimal.valueOf(totalPrice));
            
            existingRental.setRentalStart(Date.from(formatedDates[1].atZone(ZoneId.systemDefault()).toInstant()));
            
            rsi.addNewRental(newRent);
            rsi.addNewRental(existingRental);
        } else if (oldRentalEnd.equals(formatedDates[1])) {
            Rental newRent = new Rental();
            newRent.setRentalGarageid(existingRental.getRentalGarageid());
            newRent.setRentalPaydone((short) 1);
            newRent.setRentalPriceperhour(existingRental.getRentalPriceperhour());
            newRent.setRentalUserid(user);
            newRent.setRentalStart(Date.from(formatedDates[0].atZone(ZoneId.systemDefault()).toInstant()));
            newRent.setRentalEnd(existingRental.getRentalEnd());
            newRent.setRentalTotalpayed(BigDecimal.valueOf(totalPrice));
            
            existingRental.setRentalEnd(Date.from(formatedDates[0].atZone(ZoneId.systemDefault()).toInstant()));
            
            rsi.addNewRental(newRent);
            rsi.addNewRental(existingRental);
        } else {
            Rental newPreRent = new Rental();
            Rental newPostRent = new Rental();
            
            newPreRent.setRentalGarageid(existingRental.getRentalGarageid());
            newPreRent.setRentalPaydone((short) 0);
            newPreRent.setRentalPriceperhour(existingRental.getRentalPriceperhour());
            newPreRent.setRentalStart(existingRental.getRentalStart());
            newPreRent.setRentalEnd(Date.from(formatedDates[0].atZone(ZoneId.systemDefault()).toInstant()));
            
            newPostRent.setRentalGarageid(existingRental.getRentalGarageid());
            newPostRent.setRentalPaydone((short) 0);
            newPostRent.setRentalPriceperhour(existingRental.getRentalPriceperhour());
            newPostRent.setRentalStart(Date.from(formatedDates[1].atZone(ZoneId.systemDefault()).toInstant()));
            newPostRent.setRentalEnd(existingRental.getRentalEnd());
            
            existingRental.setRentalStart(Date.from(formatedDates[0].atZone(ZoneId.systemDefault()).toInstant()));
            existingRental.setRentalEnd(Date.from(formatedDates[1].atZone(ZoneId.systemDefault()).toInstant()));
            existingRental.setRentalPaydone((short) 1);
            existingRental.setRentalUserid(user);
            existingRental.setRentalTotalpayed(BigDecimal.valueOf(totalPrice));
            
            rsi.addNewRental(newPreRent);
            rsi.addNewRental(newPostRent);
            rsi.addNewRental(existingRental);
            
        }
        
        return "redirect:/main";
    }
    
    
    @GetMapping(value="rentalHistory")
    public String myRentalHistory(HttpSession session,
            ModelMap mm){
         User user = (User) session.getAttribute("userSession");
         mm.addAttribute("userRentals", rsi.findByRentalUser(user));
        return "myRentalHistory";
    }
    
  @GetMapping(value="/wallet")
    public String goToWallet(){
        return "wallet";
    } 
}
