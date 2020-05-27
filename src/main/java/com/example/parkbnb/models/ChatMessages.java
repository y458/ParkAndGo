/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.models;

import java.io.Serializable;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author dimit
 */
@Entity
@Table(name = "chat_messages")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChatMessages.findAll", query = "SELECT c FROM ChatMessages c"),
    @NamedQuery(name = "ChatMessages.findByCmessageId", query = "SELECT c FROM ChatMessages c WHERE c.cmessageId = :cmessageId"),
    @NamedQuery(name = "ChatMessages.findByCmessageMessage", query = "SELECT c FROM ChatMessages c WHERE c.cmessageMessage = :cmessageMessage"),
    @NamedQuery(name = "ChatMessages.findByCmessageDaytime", query = "SELECT c FROM ChatMessages c WHERE c.cmessageDaytime = :cmessageDaytime")})
public class ChatMessages implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cmessage_id")
    private Integer cmessageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "cmessage_message")
    private String cmessageMessage;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cmessage_daytime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date cmessageDaytime;
    @JoinColumn(name = "cmessage_fromuserid", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User cmessageFromuserid;
    @JoinColumn(name = "cmessage_touserid", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User cmessageTouserid;

    public ChatMessages() {
    }

    public ChatMessages(Integer cmessageId) {
        this.cmessageId = cmessageId;
    }

    public ChatMessages(Integer cmessageId, String cmessageMessage, Date cmessageDaytime) {
        this.cmessageId = cmessageId;
        this.cmessageMessage = cmessageMessage;
        this.cmessageDaytime = cmessageDaytime;
    }

    public Integer getCmessageId() {
        return cmessageId;
    }

    public void setCmessageId(Integer cmessageId) {
        this.cmessageId = cmessageId;
    }

    public String getCmessageMessage() {
        return cmessageMessage;
    }

    public void setCmessageMessage(String cmessageMessage) {
        this.cmessageMessage = cmessageMessage;
    }

    public Date getCmessageDaytime() {
        return cmessageDaytime;
    }

    public void setCmessageDaytime(Date cmessageDaytime) {
        this.cmessageDaytime = cmessageDaytime;
    }

    public User getCmessageFromuserid() {
        return cmessageFromuserid;
    }

    public void setCmessageFromuserid(User cmessageFromuserid) {
        this.cmessageFromuserid = cmessageFromuserid;
    }

    public User getCmessageTouserid() {
        return cmessageTouserid;
    }

    public void setCmessageTouserid(User cmessageTouserid) {
        this.cmessageTouserid = cmessageTouserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cmessageId != null ? cmessageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChatMessages)) {
            return false;
        }
        ChatMessages other = (ChatMessages) object;
        if ((this.cmessageId == null && other.cmessageId != null) || (this.cmessageId != null && !this.cmessageId.equals(other.cmessageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.parkbnb.models.ChatMessages[ cmessageId=" + cmessageId + " ]";
    }
    
}
