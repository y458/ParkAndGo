/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.controllers;

import com.example.parkbnb.dtos.LoginUserDto;
import com.example.parkbnb.services.UserServiceInterface;
import com.example.parkbnb.validators.ErrorMessage;
import com.example.parkbnb.validators.LoginValidator;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kmbco
 */
@RestController
public class LoginController {

    @Autowired
    LoginValidator res;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserServiceInterface usi;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.addValidators(res);
    }

    @PostMapping(value = "/ModalLogin")
    public @ResponseBody
    LoginValidator loginViaAjax(@RequestBody @Valid LoginUserDto loginUserDto,
            BindingResult result,
            HttpServletRequest request,
            HttpSession session
    ) {

        //Special class created for JSON response
        if (result.hasErrors()) {

            res.setStatus("FAIL");

            List<FieldError> allErrors = result.getFieldErrors();

            final List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
            for (FieldError objectError : allErrors) {
                errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getCode()));
            }
            res.setErrorMessageList(errorMesages);

        } else {

            session.setAttribute("userSession", usi.getUserByUsername(loginUserDto.getUsername()));
            
            res.setStatus("");

        }

//          else {
//		  //There is no binding errors, fetch user from database if exist.
//		  Optional<Users> theUser = communityService.findUserByEmailOptional(user.getEMAIL());
//		  final List<ErrorMessage> errorMessagelist = new ArrayList<>();
//		  
//		  if(theUser.isPresent()) { 
//			  //User is exist, compare the passwords are equals?
//			  if(passwordEncoder.matches(user.getPASSWORD(), theUser.get().getPASSWORD())) { 
//				  uploadUserAttributesToSession(theUser, request); 
//				  res.setStatus("SUCCESS");
//			  } else { 
//				  res.setStatus("FAIL"); 	
//				  errorMessagelist.add(new ErrorMessage("PASSWORD", "Invalid password!")); 
//			  } 
//		  //In this part user doesn't exist send error to frontend.	  
//		  } else {
//			  res.setStatus("FAIL"); 
//			  errorMessagelist.add(new ErrorMessage("FORM FAIL", "Incorrect Email or Password!"));
//		  } 
//		  //Everything is O.K. and all odds controlled 
//		  //if there any error add it to errorlist  and send it.
//		  res.setErrorMessageList(errorMessagelist);
//	  } 
        
        return res;
    }
    
    
   

}
