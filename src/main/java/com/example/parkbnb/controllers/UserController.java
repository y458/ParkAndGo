/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.controllers;

import com.example.parkbnb.dtos.NewUserDto;
import com.example.parkbnb.models.User;
import com.example.parkbnb.services.UserReviewServiceInterface;
import com.example.parkbnb.services.UserServiceInterface;
import com.example.parkbnb.utils.MailUtils;
import com.example.parkbnb.validators.ErrorMessage;
import com.example.parkbnb.validators.NewUserDtoValidator;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

/**
 * @author dimit
 */
@Controller
public class UserController {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    UserServiceInterface usi;

    @GetMapping(value = "/")
    public String def() {

        return "index";
    }

    @GetMapping(value = "/loginForm")
    public String loginForm(ModelMap mm) {
        return "login";
    }

    @PostMapping(value = "/login")
    public String login(@RequestParam(name = "username") String username,
            @RequestParam(name = "password") String password,
            HttpSession session) {
        User user = usi.getUserByUsername(username);
        if (user == null || user.getUserActive() == 3) {//useractive==1 active/2 not mail confirmation/ 3 banned
            return "error";
        }
        if (user.getUserActive() == 2) {
            session.setAttribute("user", user);
            return "noValidation";
        }
        if (passwordEncoder.matches(password, user.getUserPassword())) {
            session.setAttribute("user", user);
            return "success";
        }
        return "error";
    }

    @GetMapping(value = "/insertForm")
    public String insertForm(ModelMap mm) {
        NewUserDto temp = new NewUserDto();
        mm.addAttribute("newUser", temp);
        return "addUser";
    }

    @Autowired
    NewUserDtoValidator val;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.addValidators(val);
    }

    @PostMapping(value = "/addUser")
    public @ResponseBody
    NewUserDtoValidator addUser(@RequestBody @Valid NewUserDto temp,
            BindingResult br, HttpServletRequest request) throws MessagingException {
        if (br.hasErrors()) {

            val.setStatus("FAIL");
            List<FieldError> allErrors = br.getFieldErrors();

            final List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
            for (FieldError objectError : allErrors) {
                errorMesages.add(new ErrorMessage(objectError.getField(), objectError.getCode()));
            }
            val.setErrorMessageList(errorMesages);
        } else {
            User tempUser = new User();
            tempUser.setUserName(temp.getUserNameRegisterForm());
            tempUser.setUserSurname(temp.getUserSurname());
            tempUser.setUserUsername(temp.getUserUsername());
            tempUser.setUserEmail(temp.getUserEmail());
            tempUser.setUserPassword(passwordEncoder.encode(temp.getUserPassword1()));
            tempUser.setUserActive((byte) 2);
            tempUser.setUserType((byte) 1);
            tempUser.setUserReportpoints(0);
            tempUser.setUserWalletmoney(BigDecimal.valueOf(0.00));

            MailUtils mailUtils = new MailUtils();
            String generated = mailUtils.generateRandomArray();
            tempUser.setUserGeneratedarray(generated);
            mailUtils.sendConfirmationMail(tempUser.getUserEmail(), generated);

            usi.insertNewUser(tempUser);

            val.setStatus("Success");
            return val;
        }
        val.setStatus("FAIL");
        return val;
    }

    @GetMapping(value = "/confirm/{link}")
    public String confirmMail(@PathVariable(name = "link") String link) {
        User user = usi.getByGeneratedArray(link);
        if (user == null) {
            return "error";
        }
        user.setUserActive((byte) 1);
        user.setUserGeneratedarray(null);
        usi.insertNewUser(user);
        return "/";
    }

    @GetMapping(value = "/resendConfirmation")
    public String resendConfirmation(HttpSession session) throws MessagingException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "error";
        }
        MailUtils mailUtils = new MailUtils();
        String generated = mailUtils.generateRandomArray();
        user.setUserGeneratedarray(generated);
        mailUtils.sendConfirmationMail(user.getUserEmail(), generated);
        usi.insertNewUser(user);
        return "login";
    }

    @GetMapping(value = "/main")
    public String goToMain() {
        return "main";
    }

    @GetMapping(value = "/forTest_delete_after")
    public String forTest_delete_after() {
        return "main";
    }

    @GetMapping(value = "/logoutUser")
    public String logoutUser(HttpSession session) {
        session.setAttribute("userSession", null);
        return "index";
    }

    @PostMapping("/addUserBalance")
    public String addBalance(@RequestParam("money") double money,
            @RequestParam("payee") String payee,
            HttpSession session) {

        if (payee.equals("sb-5li9g1605065@personal.example.com")) {
            User user = (User) session.getAttribute("userSession");
            User temp = usi.getUserByID(user.getUserId());
            temp.setUserWalletmoney(temp.getUserWalletmoney().add(BigDecimal.valueOf(money)));
            usi.insertNewUser(temp);
            session.setAttribute("userSession", temp);
        }

        return "/wallet";
    }

}
