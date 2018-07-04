/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Khairul
 */
public class PhaSaleReturn {

    private Integer returnId;
    private PhaSale phaSale;
    private Double returnAmount;
    private Double netAmount;
    private Double dueAdjust;
    private Integer creator;
    private Date createdDate;

    private Set<PhaSaleReturnDetails> detailses;

    public void addDetails(PhaSaleReturnDetails details) {
        if (detailses == null) {
            detailses = new HashSet<PhaSaleReturnDetails>();
        }
        detailses.add(details);
    }

    public Set<PhaSaleReturnDetails> getDetailses() {
        return detailses;
    }

    public void setDetailses(Set<PhaSaleReturnDetails> detailses) {
        this.detailses = detailses;
    }

    public Integer getReturnId() {
        return returnId;
    }

    public void setReturnId(Integer returnId) {
        this.returnId = returnId;
    }

    public PhaSale getPhaSale() {
        return phaSale;
    }

    public void setPhaSale(PhaSale phaSale) {
        this.phaSale = phaSale;
    }

    public Double getReturnAmount() {
        return returnAmount;
    }

    public void setReturnAmount(Double returnAmount) {
        this.returnAmount = returnAmount;
    }

    public Double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(Double netAmount) {
        this.netAmount = netAmount;
    }

    public Double getDueAdjust() {
        return dueAdjust;
    }

    public void setDueAdjust(Double dueAdjust) {
        this.dueAdjust = dueAdjust;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "PhaSaleReturn{" + "returnId=" + returnId
                + ", phaSale=" + phaSale + ", returnAmount=" + returnAmount 
                + ", netAmount=" + netAmount + ", dueAdjust=" + dueAdjust 
                + ", creator=" + creator + ", createdDate=" + createdDate + '}';
    }

}
