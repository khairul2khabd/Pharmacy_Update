/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

/**
 *
 * @author Khairul
 */
public class PhaPurInvoice implements Serializable {

    private Integer phaInvId;
    private String supplierName;
    private String invoiceNo;
    private Date invoiceDate;
    private BigDecimal tradePrice;
    private BigDecimal discount;
    private BigDecimal vat;
    private BigDecimal othDiscount;
    private BigDecimal invoiceAmount; // Net amount
    private Integer creator;
    private Date createdDate;
    private String purcStatus;
    private Integer status;

    public PhaPurInvoice() {

    }

    public PhaPurInvoice(Integer phaInvId, String supplierName, String invoiceNo, Date invoiceDate, BigDecimal tradePrice, BigDecimal discount, BigDecimal vat, BigDecimal othDiscount, BigDecimal invoiceAmount, Integer creator, String purcStatus, Integer status) {
        this.phaInvId = phaInvId;
        this.supplierName = supplierName;
        this.invoiceNo = invoiceNo;
        this.invoiceDate = invoiceDate;
        this.tradePrice = tradePrice;
        this.discount = discount;
        this.vat = vat;
        this.othDiscount = othDiscount;
        this.invoiceAmount = invoiceAmount;
        this.creator = creator;
        this.purcStatus = purcStatus;
        this.status = status;
    }

    public Integer getPhaInvId() {
        return phaInvId;
    }

    public void setPhaInvId(Integer phaInvId) {
        this.phaInvId = phaInvId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public BigDecimal getTradePrice() {
        return tradePrice;
    }

    public void setTradePrice(BigDecimal tradePrice) {
        this.tradePrice = tradePrice;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getVat() {
        return vat;
    }

    public void setVat(BigDecimal vat) {
        this.vat = vat;
    }

    public BigDecimal getOthDiscount() {
        return othDiscount;
    }

    public void setOthDiscount(BigDecimal othDiscount) {
        this.othDiscount = othDiscount;
    }

    public BigDecimal getInvoiceAmount() {
        return invoiceAmount;
    }

    public void setInvoiceAmount(BigDecimal invoiceAmount) {
        this.invoiceAmount = invoiceAmount;
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

    public String getPurcStatus() {
        return purcStatus;
    }

    public void setPurcStatus(String purcStatus) {
        this.purcStatus = purcStatus;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "PhaPurInvoice{" + "phaInvId=" + phaInvId + ", supplierName=" + supplierName + ", invoiceNo=" + invoiceNo + ", invoiceDate=" + invoiceDate + ", tradePrice=" + tradePrice + ", discount=" + discount + ", vat=" + vat + ", othDiscount=" + othDiscount + ", invoiceAmount=" + invoiceAmount + ", creator=" + creator + ", createdDate=" + createdDate + ", purcStatus=" + purcStatus + ", status=" + status + '}';
    }
}
