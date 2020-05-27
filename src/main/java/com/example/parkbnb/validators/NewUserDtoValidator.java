/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.validators;

import com.example.parkbnb.dtos.NewUserDto;
import com.example.parkbnb.services.UserServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author dimit
 */
@Component
public class NewUserDtoValidator implements Validator {

    @Autowired
    UserServiceInterface usi;
    
    @Autowired
    PasswordEncoder bcrypt;
    
     private String status;
     private List<ErrorMessage> errorMessageList;
    
    @Override
    public boolean supports(Class<?> clazz) {
        return NewUserDto.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        NewUserDto user = (NewUserDto) target;

        String userNameRegisterForm = user.getUserNameRegisterForm();
        String userSurname = user.getUserSurname();
        String userUsername = user.getUserUsername();
        String userEmail = user.getUserEmail();
        String userPassword1 = user.getUserPassword1();
        String userPassword2 = user.getUserPassword2();

//        userName validation
//        for (Character i : userName.toCharArray()) {
//            if (!Character.isLetter(i)) {
//                
//                errors.rejectValue("userName", "name.not.all.chars");
//                break;
//            }
//        }
        
         if (userNameRegisterForm== null || userNameRegisterForm.equals("")){
            
            errors.rejectValue("userNameRegisterForm", "Please type your First Name");
            
        }

        if (userNameRegisterForm.length() > 40 || userNameRegisterForm.length() < 3) {
            errors.rejectValue("userNameRegisterForm", "Name must be between 3 and 40 characters");
        }

//        userSurname validation
        for (Character i : userSurname.toCharArray()) {
            if (!Character.isLetter(i)) {
                errors.rejectValue("userSurname", "Surname must be all characters");
                break;
            }
        }

        if (userSurname.length() > 40 || userSurname.length() < 3) {
            errors.rejectValue("userSurname", "Surname must be between 3 and 40 characters");
        }

//        userUsername validation
        if (userUsername.length() > 40 || userUsername.length() < 3) {
            errors.rejectValue("userUsername", "Username must be between 3 and 40 characters");
        }
        
        if(usi.checkIfUsernameExists(userUsername)){
             errors.rejectValue("userUsername", "This username already exists");
        }

        for (Character i : userUsername.toCharArray()) {
            if (!Character.isLetter(i) && !Character.isDigit(i) ) {
                errors.rejectValue("userUsername", "Username must consist of characters or numbers");
                break;
            }
        }
        
//        userSurname validation
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(userEmail);
        if (!m.matches()) {
            errors.rejectValue("userEmail", "Mail is not valid format");
        }

//        userPasswords validation
        if (userPassword1.length() > 40 || userPassword1.length() < 5) {
            errors.rejectValue("userPassword1", "Password must be between 5 and 40 characters");
        }
        
        if(!userPassword1.equals(userPassword2)){
            errors.rejectValue("userPassword2", "The passwords don`t match");
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
