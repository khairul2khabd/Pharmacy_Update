/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.util.Date;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author Khairul
 */
public class PhaItemPrice implements Serializable {

    private Integer id;
    private PhaPurInvoice phaInvId;
    private PhaItem item;
    private String batch;
    private BigDecimal qty;
    private BigDecimal free;
    private BigDecimal unitTp;
    private BigDecimal mrp;
    private BigDecimal salesPrice;
    private BigDecimal eachPrice;
    private Date expireDate;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public PhaPurInvoice getPhaInvId() {
        return phaInvId;
    }

    public void setPhaInvId(PhaPurInvoice phaInvId) {
        this.phaInvId = phaInvId;
    }

    public PhaItem getItem() {
        return item;
    }

    public void setItem(PhaItem item) {
        this.item = item;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
    }

    public BigDecimal getFree() {
        return free;
    }

    public void setFree(BigDecimal free) {
        this.free = free;
    }

    public BigDecimal getUnitTp() {
        return unitTp;
    }

    public void setUnitTp(BigDecimal unitTp) {
        this.unitTp = unitTp;
    }

    public BigDecimal getMrp() {
        return mrp;
    }

    public void setMrp(BigDecimal mrp) {
        this.mrp = mrp;
    }

    public BigDecimal getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(BigDecimal salesPrice) {
        this.salesPrice = salesPrice;
    }

    public BigDecimal getEachPrice() {
        return eachPrice;
    }

    public void setEachPrice(BigDecimal eachPrice) {
        this.eachPrice = eachPrice;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PhaItemPrice{" + "id=" + id + ", phaInvId="
                + phaInvId + ", item=" + item
                + ", batch=" + batch + ", qty=" + qty
                + ", free=" + free + ", unitTp=" + unitTp
                + ", mrp=" + mrp
                + ", salesPrice=" + salesPrice
                + ", eachPrice=" + eachPrice
                + ", expireDate=" + expireDate
                + ", status=" + status + '}';
    }

}
