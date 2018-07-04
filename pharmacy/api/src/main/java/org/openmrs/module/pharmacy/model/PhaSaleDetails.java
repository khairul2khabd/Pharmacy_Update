/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

/**
 *
 * @author Khairul
 */
public class PhaSaleDetails {

    private Integer saleDetId;
    private Double Quantity;
    private Double discountAmount;
    private Double totalAmount;
    private Double unitPrice;
    private PhaSale phaSale;
    private PhaItem phaItem;
    private PhaItemPrice itemPrice;
    private Double afDis;

    public Double getAfDis() {
        return afDis;
    }

    public void setAfDis(Double afDis) {
        this.afDis = afDis;
    }

    public Integer getSaleDetId() {
        return saleDetId;
    }

    public void setSaleDetId(Integer saleDetId) {
        this.saleDetId = saleDetId;
    }

    public Double getQuantity() {
        return Quantity;
    }

    public void setQuantity(Double Quantity) {
        this.Quantity = Quantity;
    }

    public Double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(Double discountAmount) {
        this.discountAmount = discountAmount;
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

    public PhaSale getPhaSale() {
        return phaSale;
    }

    public void setPhaSale(PhaSale phaSale) {
        this.phaSale = phaSale;
    }

    public PhaItem getPhaItem() {
        return phaItem;
    }

    public void setPhaItem(PhaItem phaItem) {
        this.phaItem = phaItem;
    }

    public PhaItemPrice getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(PhaItemPrice itemPrice) {
        this.itemPrice = itemPrice;
    }

    @Override
    public String toString() {
        return "PhaSaleDetails{" + "saleDetId=" + saleDetId 
                + ", Quantity=" + Quantity + ", discountAmount=" + discountAmount 
                + ", totalAmount=" + totalAmount + ", unitPrice=" + unitPrice 
                + ", phaSale=" + phaSale 
                + ", phaItem=" + phaItem 
                + ", afDis=" + afDis 
                + ", itemPrice=" + itemPrice + '}';
    }

}
