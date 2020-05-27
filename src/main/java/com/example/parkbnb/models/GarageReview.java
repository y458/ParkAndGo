/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author dimit
 */
@Entity
@Table(name = "garage_review")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GarageReview.findAll", query = "SELECT g FROM GarageReview g"),
    @NamedQuery(name = "GarageReview.findByGreviewId", query = "SELECT g FROM GarageReview g WHERE g.greviewId = :greviewId"),
    @NamedQuery(name = "GarageReview.findByGreviewRating", query = "SELECT g FROM GarageReview g WHERE g.greviewRating = :greviewRating"),
    @NamedQuery(name = "GarageReview.findByGreviewComment", query = "SELECT g FROM GarageReview g WHERE g.greviewComment = :greviewComment")})
public class GarageReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "greview_id")
    private Integer greviewId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "greview_rating")
    private int greviewRating;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "greview_comment")
    private String greviewComment;
    @JoinColumn(name = "greview_garageid", referencedColumnName = "garage_id")
    @ManyToOne(optional = false)
    @JsonBackReference
    private Garage greviewGarageid;
    @JoinColumn(name = "greview_userid", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    @JsonBackReference
    private User greviewUserid;

    public GarageReview() {
    }

    public GarageReview(Integer greviewId) {
        this.greviewId = greviewId;
    }

    public GarageReview(Integer greviewId, int greviewRating, String greviewComment) {
        this.greviewId = greviewId;
        this.greviewRating = greviewRating;
        this.greviewComment = greviewComment;
    }

    public Integer getGreviewId() {
        return greviewId;
    }

    public void setGreviewId(Integer greviewId) {
        this.greviewId = greviewId;
    }

    public int getGreviewRating() {
        return greviewRating;
    }

    public void setGreviewRating(int greviewRating) {
        this.greviewRating = greviewRating;
    }

    public String getGreviewComment() {
        return greviewComment;
    }

    public void setGreviewComment(String greviewComment) {
        this.greviewComment = greviewComment;
    }

    public Garage getGreviewGarageid() {
        return greviewGarageid;
    }

    public void setGreviewGarageid(Garage greviewGarageid) {
        this.greviewGarageid = greviewGarageid;
    }

    public User getGreviewUserid() {
        return greviewUserid;
    }

    public void setGreviewUserid(User greviewUserid) {
        this.greviewUserid = greviewUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (greviewId != null ? greviewId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GarageReview)) {
            return false;
        }
        GarageReview other = (GarageReview) object;
        if ((this.greviewId == null && other.greviewId != null) || (this.greviewId != null && !this.greviewId.equals(other.greviewId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.GarageReview[ greviewId=" + greviewId + " ]";
    }
    
}
