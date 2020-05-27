/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author dimit
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findByUserId", query = "SELECT u FROM User u WHERE u.userId = :userId"),
    @NamedQuery(name = "User.findByUserActive", query = "SELECT u FROM User u WHERE u.userActive = :userActive"),
    @NamedQuery(name = "User.findByUserType", query = "SELECT u FROM User u WHERE u.userType = :userType"),
    @NamedQuery(name = "User.findByUserName", query = "SELECT u FROM User u WHERE u.userName = :userName"),
    @NamedQuery(name = "User.findByUserSurname", query = "SELECT u FROM User u WHERE u.userSurname = :userSurname"),
    @NamedQuery(name = "User.findByUserPaypal", query = "SELECT u FROM User u WHERE u.userPaypal = :userPaypal"),
    @NamedQuery(name = "User.findByUserReportpoints", query = "SELECT u FROM User u WHERE u.userReportpoints = :userReportpoints"),
    @NamedQuery(name = "User.findByUserEmail", query = "SELECT u FROM User u WHERE u.userEmail = :userEmail"),
    @NamedQuery(name = "User.findByUserUsername", query = "SELECT u FROM User u WHERE u.userUsername = :userUsername"),
    @NamedQuery(name = "User.findByUserPassword", query = "SELECT u FROM User u WHERE u.userPassword = :userPassword"),
    @NamedQuery(name = "User.findByUserGeneratedarray", query = "SELECT u FROM User u WHERE u.userGeneratedarray = :userGeneratedarray"),
    @NamedQuery(name = "User.findByUserWalletmoney", query = "SELECT u FROM User u WHERE u.userWalletmoney = :userWalletmoney")})
public class User implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "user_active")
    private short userActive;
    @Basic(optional = false)
    @NotNull()
    @Column(name = "user_type")
    private short userType;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "user_name")
    private String userName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "user_surname")
    private String userSurname;
    @Size(max = 45)
    @Column(name = "user_paypal")
    private String userPaypal;
    @Lob()
    @Column(name = "user_billphoto")
    private byte[] userBillphoto;
    @Basic(optional = false)
    @NotNull()
    @Column(name = "user_reportpoints")
    private int userReportpoints;
    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 45)
    @Column(name = "user_email")
    private String userEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "user_username")
    private String userUsername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "user_password")
    private String userPassword;
    @Size(max = 45)
    @Column(name = "user_generatedarray")
    private String userGeneratedarray;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_id")
    private Integer userId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "user_walletmoney")
    private BigDecimal userWalletmoney;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "greviewUserid")
    private Collection<GarageReview> garageReviewCollection;
    @OneToMany(mappedBy = "sreviewUserid")
    private Collection<SiteReviews> siteReviewsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ureviewFromuserid")
    private Collection<UserReview> userReviewCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ureviewTouserid")
    private Collection<UserReview> userReviewCollection1;
    @OneToMany(mappedBy = "garageUserid")
    private Collection<Garage> garageCollection;
    @OneToMany(mappedBy = "cmessageFromuserid")
    private Collection<ChatMessages> chatMessagesCollection;
    @OneToMany(mappedBy = "cmessageTouserid")
    private Collection<ChatMessages> chatMessagesCollection1;
    @OneToMany(mappedBy = "rentalUserid")
    @JsonBackReference
    private Collection<Rental> rentalCollection;

    public User() {
    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(Integer userId, short userActive, short userType, String userName, String userSurname, int userReportpoints, String userEmail, String userUsername, String userPassword) {
        this.userId = userId;
        this.userActive = userActive;
        this.userType = userType;
        this.userName = userName;
        this.userSurname = userSurname;
        this.userReportpoints = userReportpoints;
        this.userEmail = userEmail;
        this.userUsername = userUsername;
        this.userPassword = userPassword;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public short getUserActive() {
        return userActive;
    }

    public void setUserActive(short userActive) {
        this.userActive = userActive;
    }

    public short getUserType() {
        return userType;
    }

    public void setUserType(short userType) {
        this.userType = userType;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }

    public String getUserPaypal() {
        return userPaypal;
    }

    public void setUserPaypal(String userPaypal) {
        this.userPaypal = userPaypal;
    }

    public byte[] getUserBillphoto() {
        return userBillphoto;
    }

    public void setUserBillphoto(byte[] userBillphoto) {
        this.userBillphoto = userBillphoto;
    }

    public int getUserReportpoints() {
        return userReportpoints;
    }

    public void setUserReportpoints(int userReportpoints) {
        this.userReportpoints = userReportpoints;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserGeneratedarray() {
        return userGeneratedarray;
    }

    public void setUserGeneratedarray(String userGeneratedarray) {
        this.userGeneratedarray = userGeneratedarray;
    }

    public BigDecimal getUserWalletmoney() {
        return userWalletmoney;
    }

    public void setUserWalletmoney(BigDecimal userWalletmoney) {
        this.userWalletmoney = userWalletmoney;
    }

    @XmlTransient
    public Collection<GarageReview> getGarageReviewCollection() {
        return garageReviewCollection;
    }

    public void setGarageReviewCollection(Collection<GarageReview> garageReviewCollection) {
        this.garageReviewCollection = garageReviewCollection;
    }

    @XmlTransient
    public Collection<SiteReviews> getSiteReviewsCollection() {
        return siteReviewsCollection;
    }

    public void setSiteReviewsCollection(Collection<SiteReviews> siteReviewsCollection) {
        this.siteReviewsCollection = siteReviewsCollection;
    }

    @XmlTransient
    public Collection<UserReview> getUserReviewCollection() {
        return userReviewCollection;
    }

    public void setUserReviewCollection(Collection<UserReview> userReviewCollection) {
        this.userReviewCollection = userReviewCollection;
    }

    @XmlTransient
    public Collection<UserReview> getUserReviewCollection1() {
        return userReviewCollection1;
    }

    public void setUserReviewCollection1(Collection<UserReview> userReviewCollection1) {
        this.userReviewCollection1 = userReviewCollection1;
    }

    @XmlTransient
    public Collection<Garage> getGarageCollection() {
        return garageCollection;
    }

    public void setGarageCollection(Collection<Garage> garageCollection) {
        this.garageCollection = garageCollection;
    }

    @XmlTransient
    public Collection<ChatMessages> getChatMessagesCollection() {
        return chatMessagesCollection;
    }

    public void setChatMessagesCollection(Collection<ChatMessages> chatMessagesCollection) {
        this.chatMessagesCollection = chatMessagesCollection;
    }

    @XmlTransient
    public Collection<ChatMessages> getChatMessagesCollection1() {
        return chatMessagesCollection1;
    }

    public void setChatMessagesCollection1(Collection<ChatMessages> chatMessagesCollection1) {
        this.chatMessagesCollection1 = chatMessagesCollection1;
    }

    @XmlTransient
    public Collection<Rental> getRentalCollection() {
        return rentalCollection;
    }

    public void setRentalCollection(Collection<Rental> rentalCollection) {
        this.rentalCollection = rentalCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.User[ userId=" + userId + " ]";
    }

}
