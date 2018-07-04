/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.utils;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 *
 * @author Khairul
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class DetailsTempModel {

    private Integer detId;
    private Double quantity;
    private Double discount;
    private Double totalAmount;
    private Double unitPrice;
    private Integer itemId;
    private Integer saleInvoiceId;
    private Integer itemPriceId;
    private Double afDis;

    public Integer getDetId() {
        return detId;
    }

    public void setDetId(Integer detId) {
        this.detId = detId;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getSaleInvoiceId() {
        return saleInvoiceId;
    }

    public void setSaleInvoiceId(Integer saleInvoiceId) {
        this.saleInvoiceId = saleInvoiceId;
    }

    public Integer getItemPriceId() {
        return itemPriceId;
    }

    public void setItemPriceId(Integer itemPriceId) {
        this.itemPriceId = itemPriceId;
    }

    public Double getAfDis() {
        return afDis;
    }

    public void setAfDis(Double afDis) {
        this.afDis = afDis;
    }

    @Override
    public String toString() {
        return "DetailsTempModel{" + "detId=" + detId + ", quantity=" + quantity + ", discount=" + discount + ", totalAmount=" + totalAmount + ", unitPrice=" + unitPrice + ", itemId=" + itemId + ", saleInvoiceId=" + saleInvoiceId + ", itemPriceId=" + itemPriceId + ", afDis=" + afDis + '}';
    }
    
}
