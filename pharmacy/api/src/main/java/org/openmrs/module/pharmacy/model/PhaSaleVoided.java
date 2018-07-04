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
public class PhaSaleVoided {

    private Integer voidedId;
    private Integer voidedBy;
    private Date voidedDate;
    private String voidedDescription;
    private Integer saleInvoiceId;

    public Integer getVoidedId() {
        return voidedId;
    }

    public void setVoidedId(Integer voidedId) {
        this.voidedId = voidedId;
    }

    public Integer getVoidedBy() {
        return voidedBy;
    }

    public void setVoidedBy(Integer voidedBy) {
        this.voidedBy = voidedBy;
    }

    public Date getVoidedDate() {
        return voidedDate;
    }

    public void setVoidedDate(Date voidedDate) {
        this.voidedDate = voidedDate;
    }

    public String getVoidedDescription() {
        return voidedDescription;
    }

    public void setVoidedDescription(String voidedDescription) {
        this.voidedDescription = voidedDescription;
    }

    public Integer getSaleInvoiceId() {
        return saleInvoiceId;
    }

    public void setSaleInvoiceId(Integer saleInvoiceId) {
        this.saleInvoiceId = saleInvoiceId;
    }

    @Override
    public String toString() {
        return "PhaSaleVoided{" + "voidedId=" + voidedId
                + ", voidedBy=" + voidedBy
                + ", voidedDate=" + voidedDate
                + ", voidedDescription=" + voidedDescription
                + ", saleInvoiceId=" + saleInvoiceId + '}';
    }

}
