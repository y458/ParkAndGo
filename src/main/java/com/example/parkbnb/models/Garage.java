/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "garage")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Garage.findAll", query = "SELECT g FROM Garage g"),
    @NamedQuery(name = "Garage.findByGarageId", query = "SELECT g FROM Garage g WHERE g.garageId = :garageId"),
    @NamedQuery(name = "Garage.findByGarageAddress", query = "SELECT g FROM Garage g WHERE g.garageAddress = :garageAddress"),
    @NamedQuery(name = "Garage.findByGarageLongtitude", query = "SELECT g FROM Garage g WHERE g.garageLongtitude = :garageLongtitude"),
    @NamedQuery(name = "Garage.findByGarageLatitude", query = "SELECT g FROM Garage g WHERE g.garageLatitude = :garageLatitude"),
    @NamedQuery(name = "Garage.findByGarageOwnercomment", query = "SELECT g FROM Garage g WHERE g.garageOwnercomment = :garageOwnercomment"),
    @NamedQuery(name = "Garage.findByGarageConfirmed", query = "SELECT g FROM Garage g WHERE g.garageConfirmed = :garageConfirmed"),
    @NamedQuery(name = "Garage.findByGarageBillimageurl", query = "SELECT g FROM Garage g WHERE g.garageBillimageurl = :garageBillimageurl"),
    @NamedQuery(name = "Garage.findByGarageSpotimageurl", query = "SELECT g FROM Garage g WHERE g.garageSpotimageurl = :garageSpotimageurl"),
    @NamedQuery(name = "Garage.findByGarageEntranceimageurl", query = "SELECT g FROM Garage g WHERE g.garageEntranceimageurl = :garageEntranceimageurl")})
public class Garage implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "garage_address")
    private String garageAddress;
    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 45)
    @Column(name = "garage_longtitude")
    private String garageLongtitude;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "garage_latitude")
    private String garageLatitude;
    @Size(max = 200)
    @Column(name = "garage_ownercomment")
    private String garageOwnercomment;
    @Basic(optional = false)
    @NotNull
    @Column(name = "garage_confirmed")
    private int garageConfirmed;
    @Size(max = 200)
    @Column(name = "garage_billimageurl")
    private String garageBillimageurl;
    @Size(max = 200)
    @Column(name = "garage_spotimageurl")
    private String garageSpotimageurl;
    @Size(max = 200)
    @Column(name = "garage_entranceimageurl")
    private String garageEntranceimageurl;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "garage_id")
    private Integer garageId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "greviewGarageid")
    private Collection<GarageReview> garageReviewCollection;
    @JoinColumn(name = "garage_userid", referencedColumnName = "user_id")
    @ManyToOne
    @JsonBackReference
    private User garageUserid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rentalGarageid")
    @JsonBackReference
    private Collection<Rental> rentalCollection;

    public Garage() {
    }

    public Garage(Integer garageId) {
        this.garageId = garageId;
    }

    public Garage(Integer garageId, String garageAddress, String garageLongtitude, String garageLatitude, int garageConfirmed) {
        this.garageId = garageId;
        this.garageAddress = garageAddress;
        this.garageLongtitude = garageLongtitude;
        this.garageLatitude = garageLatitude;
        this.garageConfirmed = garageConfirmed;
    }

    public Integer getGarageId() {
        return garageId;
    }

    public void setGarageId(Integer garageId) {
        this.garageId = garageId;
    }

    public String getGarageAddress() {
        return garageAddress;
    }

    public void setGarageAddress(String garageAddress) {
        this.garageAddress = garageAddress;
    }

    public String getGarageLongtitude() {
        return garageLongtitude;
    }

    public void setGarageLongtitude(String garageLongtitude) {
        this.garageLongtitude = garageLongtitude;
    }

    public String getGarageLatitude() {
        return garageLatitude;
    }

    public void setGarageLatitude(String garageLatitude) {
        this.garageLatitude = garageLatitude;
    }

    public String getGarageOwnercomment() {
        return garageOwnercomment;
    }

    public void setGarageOwnercomment(String garageOwnercomment) {
        this.garageOwnercomment = garageOwnercomment;
    }

    public int getGarageConfirmed() {
        return garageConfirmed;
    }

    public void setGarageConfirmed(int garageConfirmed) {
        this.garageConfirmed = garageConfirmed;
    }

    public String getGarageBillimageurl() {
        return garageBillimageurl;
    }

    public void setGarageBillimageurl(String garageBillimageurl) {
        this.garageBillimageurl = garageBillimageurl;
    }

    public String getGarageSpotimageurl() {
        return garageSpotimageurl;
    }

    public void setGarageSpotimageurl(String garageSpotimageurl) {
        this.garageSpotimageurl = garageSpotimageurl;
    }

    public String getGarageEntranceimageurl() {
        return garageEntranceimageurl;
    }

    public void setGarageEntranceimageurl(String garageEntranceimageurl) {
        this.garageEntranceimageurl = garageEntranceimageurl;
    }

    @XmlTransient
    public Collection<GarageReview> getGarageReviewCollection() {
        return garageReviewCollection;
    }

    public void setGarageReviewCollection(Collection<GarageReview> garageReviewCollection) {
        this.garageReviewCollection = garageReviewCollection;
    }

    public User getGarageUserid() {
        return garageUserid;
    }

    public void setGarageUserid(User garageUserid) {
        this.garageUserid = garageUserid;
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
        hash += (garageId != null ? garageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Garage)) {
            return false;
        }
        Garage other = (Garage) object;
        if ((this.garageId == null && other.garageId != null) || (this.garageId != null && !this.garageId.equals(other.garageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.Garage[ garageId=" + garageId + " ]";
    }

}
