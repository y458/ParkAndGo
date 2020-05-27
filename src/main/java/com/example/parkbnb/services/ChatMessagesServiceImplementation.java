/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.ChatMessages;
import com.example.parkbnb.models.User;
import com.example.parkbnb.repositories.ChatMessagesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author dimit
 */
@Service
@Transactional
public class ChatMessagesServiceImplementation implements ChatMessagesServiceInterface{

    @Autowired
    ChatMessagesRepository cmr;
    
    @Override
    public void addMessageFromUser(ChatMessages message) {
        cmr.save(message);
    }

    @Override
    public ChatMessages[] findUserMessages(User from, User to) {
        return cmr.findByCmessageFromuseridOrCmessageTouserid(from, to);
    }
    
}
