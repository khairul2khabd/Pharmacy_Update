/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.util.Date;
import org.openmrs.User;

/**
 *
 * @author Khairul
 */
public class PhaSaleCollect {

    private Integer saleCollectId;
    private Date collectedDate;
    private Integer dupPaid;
    private Double paidAmount;
    private Integer status;
    private Integer creator;
    private PhaSale phaSale;

    public Integer getSaleCollectId() {
        return saleCollectId;
    }

    public void setSaleCollectId(Integer saleCollectId) {
        this.saleCollectId = saleCollectId;
    }

    public Date getCollectedDate() {
        return collectedDate;
    }

    public void setCollectedDate(Date collectedDate) {
        this.collectedDate = collectedDate;
    }

    public Integer getDupPaid() {
        return dupPaid;
    }

    public void setDupPaid(Integer dupPaid) {
        this.dupPaid = dupPaid;
    }

    public Double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(Double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public PhaSale getPhaSale() {
        return phaSale;
    }

    public void setPhaSale(PhaSale phaSale) {
        this.phaSale = phaSale;
    }

    @Override
    public String toString() {
        return "PhaSaleCollect{" + "saleCollectId=" + saleCollectId + ", collectedDate=" + collectedDate + ", dupPaid=" + dupPaid + ", paidAmount=" + paidAmount + ", status=" + status + ", creator=" + creator + ", phaSale=" + phaSale + '}';
    }

}
