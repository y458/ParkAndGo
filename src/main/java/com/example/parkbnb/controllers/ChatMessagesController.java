/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.controllers;

import com.example.parkbnb.models.ChatMessages;
import com.example.parkbnb.models.User;
import com.example.parkbnb.services.ChatMessagesServiceInterface;
import com.example.parkbnb.services.UserServiceInterface;
import java.util.Arrays;
import java.util.Collections;
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
public class ChatMessagesController {
    
    @Autowired
    UserServiceInterface usi;
    
    @Autowired
    ChatMessagesServiceInterface cmsi;
    
    @GetMapping(value="/customerService")
    public String custServiceForm(ModelMap mm,
            HttpSession session){
        User user = (User) session.getAttribute("userSession");
        mm.addAttribute("admins", usi.findByUserType((short)2));
        
        
        return "customerService";
    }
    
    @PostMapping(value="/custSendMessage")
    public String customerSendMessage(@RequestParam (name="message") String message,
            HttpSession session){
        User user = (User) session.getAttribute("userSession");
        ChatMessages temp = new ChatMessages();
        
        temp.setCmessageMessage(message);
        temp.setCmessageDaytime(new Date());
        temp.setCmessageFromuserid(user);
        
        cmsi.addMessageFromUser(temp);
        
        return "redirect:/customerService";
    }
    
    @PostMapping(value="/adminSendMessage/{userId}")
    public String adminSendMessage(@PathVariable (name="userId") Integer userId,
            @RequestParam (name="message") String message,
            HttpSession session){
        ChatMessages temp = new ChatMessages();
        
        temp.setCmessageMessage(message);
        temp.setCmessageDaytime(new Date());
        temp.setCmessageTouserid(usi.getUserByID(userId));
        
        cmsi.addMessageFromUser(temp);
        
        return "redirect:/confirmGarages";
    }
    
    @ResponseBody
    @PostMapping(value = "/getMessages")
    public ChatMessages[] getRental(HttpSession session) {
        User user = (User) session.getAttribute("userSession");
        if(user.getUserType()==2){
            user = null;
        }
        ChatMessages[] messageList=cmsi.findUserMessages(user, user);
        Collections.reverse(Arrays.asList(messageList));
        return messageList;
    }
}
