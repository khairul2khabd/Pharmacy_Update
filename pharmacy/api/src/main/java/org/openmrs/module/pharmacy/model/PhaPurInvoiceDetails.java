/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.io.Serializable;
import java.math.BigDecimal;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 *
 * @author Khairul
 */
@JsonIgnoreProperties(ignoreUnknown = true)
// implements Serializable
public class PhaPurInvoiceDetails {

    private Integer id;
    private PhaPurInvoice phaInvId;
    private String itemName;
    private String batch;
    private BigDecimal pack;
    private BigDecimal size;
    private BigDecimal qty;
    private BigDecimal unitTP;
    private BigDecimal totalAmount;
    private BigDecimal vat;
    private BigDecimal vatAmount;
    private BigDecimal discount;
    private BigDecimal discountAmount;
    private BigDecimal netAmount;
    private PhaItem item;

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

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public BigDecimal getPack() {
        return pack;
    }

    public void setPack(BigDecimal pack) {
        this.pack = pack;
    }

    public BigDecimal getSize() {
        return size;
    }

    public void setSize(BigDecimal size) {
        this.size = size;
    }

    public BigDecimal getQty() {
        return qty;
    }

    public void setQty(BigDecimal qty) {
        this.qty = qty;
    }

    public BigDecimal getUnitTP() {
        return unitTP;
    }

    public void setUnitTP(BigDecimal unitTP) {
        this.unitTP = unitTP;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getVat() {
        return vat;
    }

    public void setVat(BigDecimal vat) {
        this.vat = vat;
    }

    public BigDecimal getVatAmount() {
        return vatAmount;
    }

    public void setVatAmount(BigDecimal vatAmount) {
        this.vatAmount = vatAmount;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(BigDecimal discountAmount) {
        this.discountAmount = discountAmount;
    }

    public BigDecimal getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(BigDecimal netAmount) {
        this.netAmount = netAmount;
    }

    public PhaItem getItem() {
        return item;
    }

    public void setItem(PhaItem item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "PhaPurInvoiceDetails{" + "Id=" + id
                + ", phaInvId=" + phaInvId
                + ", itemName=" + itemName
                + ", item=" + item
                + ", batch=" + batch + ", pack=" + pack
                + ", size=" + size + ", qty=" + qty
                + ", unitTP=" + unitTP + ", totalAmount=" + totalAmount
                + ", vat=" + vat + ", vatAmount=" + vatAmount
                + ", discount=" + discount + ", discountAmount=" + discountAmount
                + ", netAmount=" + netAmount + '}';
    }

}
