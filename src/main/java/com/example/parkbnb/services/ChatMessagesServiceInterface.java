/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.services;

import com.example.parkbnb.models.ChatMessages;
import com.example.parkbnb.models.User;

/**
 *
 * @author dimit
 */
public interface ChatMessagesServiceInterface {
    public void addMessageFromUser(ChatMessages message);
    
    public ChatMessages[] findUserMessages(User from, User to);
}
