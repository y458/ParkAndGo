/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.repositories;

import com.example.parkbnb.models.ChatMessages;
import com.example.parkbnb.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dimit
 */
@Repository
public interface ChatMessagesRepository extends CrudRepository<ChatMessages,Integer>{
    
    ChatMessages[] findByCmessageFromuseridOrCmessageTouserid(User cmessageFromuserid, User cmessageTouserid);
}
