/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.validators;

import com.example.parkbnb.dtos.LoginUserDto;
import com.example.parkbnb.models.User;
import com.example.parkbnb.services.UserServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author kmbco
 */

@Component
public class LoginValidator implements Validator  {
    
    
    @Autowired
    PasswordEncoder bcrypt;
    
    @Autowired
    UserServiceInterface userInter;
    
     private String status;
     private List<ErrorMessage> errorMessageList;

    public LoginValidator() {
    }

    public LoginValidator(String status, List<ErrorMessage> errorMessageList) {
        this.status = status;
        this.errorMessageList = errorMessageList;
    }

        
        
    @Override
    public boolean supports(Class<?> clazz) {
        
    return LoginUserDto.class.equals(clazz);
    }

    @Override
    public void validate(Object o, Errors errors) {
    
        LoginUserDto loginUserDto =(LoginUserDto) o;
        
        if (loginUserDto.getUsername().equals("") || loginUserDto.getUsername()==null){
             errors.rejectValue("username", "Username is not typed");
             
        }
        
         //check if password is not typed
        if (loginUserDto.getPassword().equals("") || loginUserDto.getPassword()==null ){
             errors.rejectValue("password", "Password is not typed");
        }
        
        
        
        //check if username not exists in database
        User userFromDb = userInter.getUserByUsername(loginUserDto.getUsername());
              if   (userFromDb==null && !(loginUserDto.getUsername().equals(""))){
                  errors.rejectValue("username", "Username doesn't exist");
              }else if (userFromDb!=null && !(loginUserDto.getUsername().equals("")) && !(loginUserDto.getPassword().equals(""))) {
                       
                 if (!(bcrypt.matches(loginUserDto.getPassword(), userFromDb.getUserPassword()))){
                     errors.rejectValue("password", "Wrong Password!");
                 }
        
    
    }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<ErrorMessage> getErrorMessageList() {
        return errorMessageList;
    }

    public void setErrorMessageList(List<ErrorMessage> errorMessageList) {
        this.errorMessageList = errorMessageList;
    }
    
}
