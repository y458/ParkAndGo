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
@Table(name = "user_review")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserReview.findAll", query = "SELECT u FROM UserReview u"),
    @NamedQuery(name = "UserReview.findByUreviewId", query = "SELECT u FROM UserReview u WHERE u.ureviewId = :ureviewId"),
    @NamedQuery(name = "UserReview.findByUreviewRating", query = "SELECT u FROM UserReview u WHERE u.ureviewRating = :ureviewRating"),
    @NamedQuery(name = "UserReview.findByUreviewComment", query = "SELECT u FROM UserReview u WHERE u.ureviewComment = :ureviewComment")})
public class UserReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ureview_id")
    private Integer ureviewId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ureview_rating")
    private int ureviewRating;
    @Size(max = 45)
    @Column(name = "ureview_comment")
    private String ureviewComment;
    @JoinColumn(name = "ureview_fromuserid", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    @JsonBackReference
    private User ureviewFromuserid;
    @JoinColumn(name = "ureview_touserid", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    @JsonBackReference
    private User ureviewTouserid;

    public UserReview() {
    }

    public UserReview(Integer ureviewId) {
        this.ureviewId = ureviewId;
    }

    public UserReview(Integer ureviewId, int ureviewRating) {
        this.ureviewId = ureviewId;
        this.ureviewRating = ureviewRating;
    }

    public Integer getUreviewId() {
        return ureviewId;
    }

    public void setUreviewId(Integer ureviewId) {
        this.ureviewId = ureviewId;
    }

    public int getUreviewRating() {
        return ureviewRating;
    }

    public void setUreviewRating(int ureviewRating) {
        this.ureviewRating = ureviewRating;
    }

    public String getUreviewComment() {
        return ureviewComment;
    }

    public void setUreviewComment(String ureviewComment) {
        this.ureviewComment = ureviewComment;
    }

    public User getUreviewFromuserid() {
        return ureviewFromuserid;
    }

    public void setUreviewFromuserid(User ureviewFromuserid) {
        this.ureviewFromuserid = ureviewFromuserid;
    }

    public User getUreviewTouserid() {
        return ureviewTouserid;
    }

    public void setUreviewTouserid(User ureviewTouserid) {
        this.ureviewTouserid = ureviewTouserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ureviewId != null ? ureviewId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserReview)) {
            return false;
        }
        UserReview other = (UserReview) object;
        if ((this.ureviewId == null && other.ureviewId != null) || (this.ureviewId != null && !this.ureviewId.equals(other.ureviewId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.UserReview[ ureviewId=" + ureviewId + " ]";
    }
    
}
