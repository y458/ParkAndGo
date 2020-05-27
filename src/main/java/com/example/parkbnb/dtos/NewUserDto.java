/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.dtos;


/**
 *
 * @author dimit
 */
public class NewUserDto{
    private String userNameRegisterForm;
    private String userSurname;
    private String userUsername;
    private String userEmail;
    private String userPassword1;
    private String userPassword2;

    public NewUserDto() {
    }

   

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }

    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword1() {
        return userPassword1;
    }

    public void setUserPassword1(String userPassword1) {
        this.userPassword1 = userPassword1;
    }

    public String getUserPassword2() {
        return userPassword2;
    }

    public void setUserPassword2(String userPassword2) {
        this.userPassword2 = userPassword2;
    }

    public String getUserNameRegisterForm() {
        return userNameRegisterForm;
    }

    public void setUserNameRegisterForm(String userNameRegisterForm) {
        this.userNameRegisterForm = userNameRegisterForm;
    }
    
}
