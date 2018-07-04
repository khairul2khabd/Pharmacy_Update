/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.io.Serializable;
import java.util.Date;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.openmrs.User;

/**
 *
 * @author Khairul
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PhaSale implements Serializable {

    private Integer saleInvoiceId;
    private String bankName;
    private String cardNo;
    private String contactInfo;
    private Date createdDate;
    private String customer;
    private Integer customerId;
    private Double discountAmount;
    private Double discountPercentage;
    private Double dueAmount;
    private String mobileNo;
    private Double netAmount;
    private Double paid;
    private String paidStaus;
    private String paymentMethod;
    private Double totalAmount;
    private String transNo;
    private Integer creator;
    private Boolean voided = false;
    private PhaSaleVoided voidedId;

    public Integer getSaleInvoiceId() {
        return saleInvoiceId;
    }

    public void setSaleInvoiceId(Integer saleInvoiceId) {
        this.saleInvoiceId = saleInvoiceId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(Double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Double getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(Double discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Double getDueAmount() {
        return dueAmount;
    }

    public void setDueAmount(Double dueAmount) {
        this.dueAmount = dueAmount;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public Double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(Double netAmount) {
        this.netAmount = netAmount;
    }

    public Double getPaid() {
        return paid;
    }

    public void setPaid(Double paid) {
        this.paid = paid;
    }

    public String getPaidStaus() {
        return paidStaus;
    }

    public void setPaidStaus(String paidStaus) {
        this.paidStaus = paidStaus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getTransNo() {
        return transNo;
    }

    public void setTransNo(String transNo) {
        this.transNo = transNo;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Boolean getVoided() {
        return voided;
    }

    public void setVoided(Boolean voided) {
        this.voided = voided;
    }

    public PhaSaleVoided getVoidedId() {
        return voidedId;
    }

    public void setVoidedId(PhaSaleVoided voidedId) {
        this.voidedId = voidedId;
    }

    @Override
    public String toString() {
        return "PhaSale{" + "saleInvoiceId=" + saleInvoiceId
                + ", bankName=" + bankName + ", cardNo=" + cardNo
                + ", contactInfo=" + contactInfo + ", createdDate=" + createdDate
                + ", customer=" + customer + ", customerId=" + customerId
                + ", discountAmount=" + discountAmount
                + ", discountPercentage=" + discountPercentage
                + ", dueAmount=" + dueAmount + ", mobileNo=" + mobileNo
                + ", netAmount=" + netAmount + ", paid=" + paid
                + ", paidStaus=" + paidStaus + ", paymentMethod=" + paymentMethod
                + ", totalAmount=" + totalAmount + ", transNo=" + transNo
                + ", creator=" + creator + ", voided=" + voided
                + ", voidedId=" + voidedId + '}';
    }

}
