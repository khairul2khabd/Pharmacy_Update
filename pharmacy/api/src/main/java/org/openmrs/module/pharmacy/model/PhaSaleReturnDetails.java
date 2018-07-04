/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

/**
 *
 * @author Khairul
 */
public class PhaSaleReturnDetails {

    private Integer returnDetId;
    @JsonBackReference
    private PhaSaleReturn phaSaleReturn;
    private Double quantity;
    private Double unitPrice;
    private Double returnAmount;
    private PhaItem phaItem;
    private PhaItemPrice itemPrice;

    public Integer getReturnDetId() {
        return returnDetId;
    }

    public void setReturnDetId(Integer returnDetId) {
        this.returnDetId = returnDetId;
    }

    public PhaSaleReturn getPhaSaleReturn() {
        return phaSaleReturn;
    }

    public void setPhaSaleReturn(PhaSaleReturn phaSaleReturn) {
        this.phaSaleReturn = phaSaleReturn;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getReturnAmount() {
        return returnAmount;
    }

    public void setReturnAmount(Double returnAmount) {
        this.returnAmount = returnAmount;
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
        return "PhaSaleReturnDetails{" + "returnDetId=" + returnDetId
//                + ", phaSaleReturn=" + phaSaleReturn
                + ", quantity=" + quantity + ", unitPrice=" + unitPrice 
                + ", returnAmount=" + returnAmount 
                + ", phaItem=" + phaItem 
                + ", itemPrice=" + itemPrice + '}';
    }

}
