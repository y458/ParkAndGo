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
import com.example.parkbnb.utils.GarageUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author dimit
 */
@Controller
public class GarageController {

    @Autowired
    HttpServletRequest request;
    @Autowired
    GarageServiceInterface gsi;

    @GetMapping(value = "/addNewGarageForm")
    public String def() {

        return "addNewGarage";
        //return "addGarage";
    }

    @GetMapping(value = "/garageConfirm/{id}")
    public String garageConf(@PathVariable(name = "id") Integer garageId) {
        Garage temp = gsi.findById(garageId);
        temp.setGarageConfirmed(1);
        gsi.addGarage(temp);
        return "redirect:/confirmGarages";
    }

    @GetMapping(value = "/showUsersGarages")
    public String garageConf(ModelMap mm,
            HttpSession session) {
        User sessionUser = (User) session.getAttribute("userSession");
        mm.addAttribute("userGarages", gsi.getUserGarages(sessionUser));
        return "myGarages";
    }
    
     @GetMapping(value = "/showUsersGaragesNew")
    public String garageConfNew(ModelMap mm,
            HttpSession session) {
        User sessionUser = (User) session.getAttribute("userSession");
        mm.addAttribute("userGarages", gsi.getUserGarages(sessionUser));
        return "myGaragesNew";
    }

    @GetMapping(value = "/confirmGarages")
    public String confGarages(ModelMap mm) {
        mm.addAttribute("unconfirmedGarages", gsi.getGaragesByConfirmation(0));

        return "confirmGarages";
    }

    @RequestMapping(value = "addGarage", method = RequestMethod.POST)
    public String fileUpload(@RequestParam("entrancePic") MultipartFile entrancePic,
            @RequestParam("billPhoto") MultipartFile billPhoto,
            @RequestParam("coordinates") String coordinates,
            @RequestParam("address") String address,
            @RequestParam("comment") String comment,
            HttpSession session,
            ModelMap mm)
            throws IOException {

        User sessionUser = (User) session.getAttribute("userSession");

        Garage temp = new Garage();
        temp.setGarageAddress(address);
        GarageUtils garageUtils = new GarageUtils();
        String[] tempCoords = garageUtils.manageLotLat(coordinates);
        temp.setGarageLongtitude(tempCoords[1]);
        temp.setGarageLatitude(tempCoords[0]);
        temp.setGarageOwnercomment(comment);
        temp.setGarageUserid(sessionUser);

        temp = gsi.addGarage(temp);

        String entrancePicName = garageUtils.handleFileName(entrancePic.getOriginalFilename());
        String billPicName = garageUtils.handleFileName(billPhoto.getOriginalFilename());

        String dest = request.getSession().getServletContext().getRealPath("/"); //in project folder -> parkbnb\target\parkbnb-0.0.1-SNAPSHOT\
        File destination = new File(dest + "/garageImages/" + temp.getGarageId());
        destination.mkdirs();

        entrancePic.transferTo(new File(destination, "entrance" + entrancePicName));
        billPhoto.transferTo(new File(destination, "bill" + billPicName));

        temp.setGarageBillimageurl("\\garageImages\\" + temp.getGarageId() + "\\" + "bill" + billPicName);
        temp.setGarageEntranceimageurl("\\garageImages\\" + temp.getGarageId() + "\\" + "entrance" + entrancePicName);

        gsi.addGarage(temp);
       
        
        mm.addAttribute("newGarageEntryMessage", "true");
        
        return "addNewGarage";
//        return new ResponseEntity<>("File Uploaded Successfully.", HttpStatus.OK);
    }

    @RequestMapping(value = "addGarageMultiSpot", method = RequestMethod.POST)
    public ResponseEntity<String> fileUploadMultiSpot(@RequestParam("entrancePic") MultipartFile entrancePic,
            @RequestParam("spotPic") MultipartFile spotPic,
            @RequestParam("billPhoto") MultipartFile billPhoto,
            @RequestParam("coordinates") String coordinates,
            @RequestParam("address") String address,
            @RequestParam("comment") String comment,
            HttpSession session)
            throws IOException {
        User sessionUser = (User) session.getAttribute("userSession");

        Garage temp = new Garage();
        temp.setGarageAddress(address);
        GarageUtils garageUtils = new GarageUtils();
        String[] tempCoords = garageUtils.manageLotLat(coordinates);
        temp.setGarageLongtitude(tempCoords[1]);
        temp.setGarageLatitude(tempCoords[0]);
        temp.setGarageOwnercomment(comment);
        temp.setGarageUserid(sessionUser);

        temp = gsi.addGarage(temp);

        String entrancePicName = garageUtils.handleFileName(entrancePic.getOriginalFilename());
        String billPicName = garageUtils.handleFileName(billPhoto.getOriginalFilename());
        String spotPicName = garageUtils.handleFileName(spotPic.getOriginalFilename());

        String dest = request.getSession().getServletContext().getRealPath("/"); //in project folder -> parkbnb\target\parkbnb-0.0.1-SNAPSHOT\
        File destination = new File(dest + "/garageImages/" + temp.getGarageId());
        destination.mkdirs();

        entrancePic.transferTo(new File(destination, "entrance" + entrancePicName));
        billPhoto.transferTo(new File(destination, "bill" + billPicName));

        temp.setGarageBillimageurl("\\garageImages\\" + temp.getGarageId() + "\\" + "bill" + billPicName);
        temp.setGarageEntranceimageurl("\\garageImages\\" + temp.getGarageId() + "\\" + "entrance" + entrancePicName);
        temp.setGarageEntranceimageurl("\\garageImages\\" + temp.getGarageId() + "\\" + "spot" + entrancePicName);

        gsi.addGarage(temp);
        return new ResponseEntity<>("File Uploaded Successfully.", HttpStatus.OK);
    }

}
