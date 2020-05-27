/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.models;

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
@Table(name = "site_reviews")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SiteReviews.findAll", query = "SELECT s FROM SiteReviews s"),
    @NamedQuery(name = "SiteReviews.findBySreviewId", query = "SELECT s FROM SiteReviews s WHERE s.sreviewId = :sreviewId"),
    @NamedQuery(name = "SiteReviews.findBySreviewRating", query = "SELECT s FROM SiteReviews s WHERE s.sreviewRating = :sreviewRating"),
    @NamedQuery(name = "SiteReviews.findBySreviewComment", query = "SELECT s FROM SiteReviews s WHERE s.sreviewComment = :sreviewComment")})
public class SiteReviews implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sreview_id")
    private Integer sreviewId;
    @Basic(optional = false)
    @Column(name = "sreview_rating")
    private int sreviewRating;
    @Size(max = 250)
    @Column(name = "sreview_comment")
    private String sreviewComment;
    @JoinColumn(name = "sreview_userid", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User sreviewUserid;

    public SiteReviews() {
    }

    public SiteReviews(Integer sreviewId) {
        this.sreviewId = sreviewId;
    }

    public SiteReviews(Integer sreviewId, int sreviewRating) {
        this.sreviewId = sreviewId;
        this.sreviewRating = sreviewRating;
    }

    public Integer getSreviewId() {
        return sreviewId;
    }

    public void setSreviewId(Integer sreviewId) {
        this.sreviewId = sreviewId;
    }

    public int getSreviewRating() {
        return sreviewRating;
    }

    public void setSreviewRating(int sreviewRating) {
        this.sreviewRating = sreviewRating;
    }

    public String getSreviewComment() {
        return sreviewComment;
    }

    public void setSreviewComment(String sreviewComment) {
        this.sreviewComment = sreviewComment;
    }

    public User getSreviewUserid() {
        return sreviewUserid;
    }

    public void setSreviewUserid(User sreviewUserid) {
        this.sreviewUserid = sreviewUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sreviewId != null ? sreviewId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SiteReviews)) {
            return false;
        }
        SiteReviews other = (SiteReviews) object;
        if ((this.sreviewId == null && other.sreviewId != null) || (this.sreviewId != null && !this.sreviewId.equals(other.sreviewId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.SiteReviews[ sreviewId=" + sreviewId + " ]";
    }
    
}
