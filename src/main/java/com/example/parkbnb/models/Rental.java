/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author dimit
 */
@Entity
@Table(name = "rental")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rental.findAll", query = "SELECT r FROM Rental r"),
    @NamedQuery(name = "Rental.findByRentalId", query = "SELECT r FROM Rental r WHERE r.rentalId = :rentalId"),
    @NamedQuery(name = "Rental.findByRentalStart", query = "SELECT r FROM Rental r WHERE r.rentalStart = :rentalStart"),
    @NamedQuery(name = "Rental.findByRentalEnd", query = "SELECT r FROM Rental r WHERE r.rentalEnd = :rentalEnd"),
    @NamedQuery(name = "Rental.findByRentalPaydone", query = "SELECT r FROM Rental r WHERE r.rentalPaydone = :rentalPaydone"),
    @NamedQuery(name = "Rental.findByRentalPriceperhour", query = "SELECT r FROM Rental r WHERE r.rentalPriceperhour = :rentalPriceperhour"),
    @NamedQuery(name = "Rental.findByRentalTotalpayed", query = "SELECT r FROM Rental r WHERE r.rentalTotalpayed = :rentalTotalpayed")})
public class Rental implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "rental_id")
    private Integer rentalId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rental_start")
    @Temporal(TemporalType.TIMESTAMP)
    private Date rentalStart;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rental_end")
    @Temporal(TemporalType.TIMESTAMP)
    private Date rentalEnd;
    @Column(name = "rental_paydone")
    private Short rentalPaydone;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "rental_priceperhour")
    private BigDecimal rentalPriceperhour;
    @Column(name = "rental_totalpayed")
    private BigDecimal rentalTotalpayed;
    @JoinColumn(name = "rental_garageid", referencedColumnName = "garage_id")
    @ManyToOne(optional = false)
    @JsonManagedReference
    private Garage rentalGarageid;
    @JoinColumn(name = "rental_userid", referencedColumnName = "user_id")
    @ManyToOne
    @JsonManagedReference
    private User rentalUserid;

    public Rental() {
    }

    public Rental(Integer rentalId) {
        this.rentalId = rentalId;
    }

    public Rental(Integer rentalId, Date rentalStart, Date rentalEnd, BigDecimal rentalPriceperhour) {
        this.rentalId = rentalId;
        this.rentalStart = rentalStart;
        this.rentalEnd = rentalEnd;
        this.rentalPriceperhour = rentalPriceperhour;
    }

    public Integer getRentalId() {
        return rentalId;
    }

    public void setRentalId(Integer rentalId) {
        this.rentalId = rentalId;
    }

    public Date getRentalStart() {
        return rentalStart;
    }

    public void setRentalStart(Date rentalStart) {
        this.rentalStart = rentalStart;
    }

    public Date getRentalEnd() {
        return rentalEnd;
    }

    public void setRentalEnd(Date rentalEnd) {
        this.rentalEnd = rentalEnd;
    }

    public Short getRentalPaydone() {
        return rentalPaydone;
    }

    public void setRentalPaydone(Short rentalPaydone) {
        this.rentalPaydone = rentalPaydone;
    }

    public BigDecimal getRentalPriceperhour() {
        return rentalPriceperhour;
    }

    public void setRentalPriceperhour(BigDecimal rentalPriceperhour) {
        this.rentalPriceperhour = rentalPriceperhour;
    }

    public BigDecimal getRentalTotalpayed() {
        return rentalTotalpayed;
    }

    public void setRentalTotalpayed(BigDecimal rentalTotalpayed) {
        this.rentalTotalpayed = rentalTotalpayed;
    }

    public Garage getRentalGarageid() {
        return rentalGarageid;
    }

    public void setRentalGarageid(Garage rentalGarageid) {
        this.rentalGarageid = rentalGarageid;
    }

    public User getRentalUserid() {
        return rentalUserid;
    }

    public void setRentalUserid(User rentalUserid) {
        this.rentalUserid = rentalUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rentalId != null ? rentalId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rental)) {
            return false;
        }
        Rental other = (Rental) object;
        if ((this.rentalId == null && other.rentalId != null) || (this.rentalId != null && !this.rentalId.equals(other.rentalId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.Rental[ rentalId=" + rentalId + " ]";
    }
    
}
