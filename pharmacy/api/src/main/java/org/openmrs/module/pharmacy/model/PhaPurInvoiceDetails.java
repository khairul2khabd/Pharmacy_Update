/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 *
 * @author Khairul
 */
@JsonIgnoreProperties(ignoreUnknown = true)
// implements Serializable
public class PhaPurInvoiceDetails {

    private Integer detId;
    @JsonBackReference
    private PhaPurInvoice phaInvId;
    private String itemName;
    private String batch;
    private Double pack;
    private Double size;
    private Double qty;
    private Double netQty;
    private Double unitTP;
    private Double totalAmount;
    private Double vat;
    private Double vatAmount;
    private Double dicount;
    private Double discountAmount;
    private Double netAmount;
    private PhaItem item;
    private Double free;
    private Double mrp;
    private Double salesPrice;
    private Date expire;

    public Integer getDetId() {
        return detId;
    }

    public void setDetId(Integer detId) {
        this.detId = detId;
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

    public Double getPack() {
        return pack;
    }

    public void setPack(Double pack) {
        this.pack = pack;
    }

    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }

    public Double getQty() {
        return qty;
    }

    public void setQty(Double qty) {
        this.qty = qty;
    }

    public Double getNetQty() {
        return netQty;
    }

    public void setNetQty(Double netQty) {
        this.netQty = netQty;
    }

    public Double getUnitTP() {
        return unitTP;
    }

    public void setUnitTP(Double unitTP) {
        this.unitTP = unitTP;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getVat() {
        return vat;
    }

    public void setVat(Double vat) {
        this.vat = vat;
    }

    public Double getVatAmount() {
        return vatAmount;
    }

    public void setVatAmount(Double vatAmount) {
        this.vatAmount = vatAmount;
    }

    public Double getDicount() {
        return dicount;
    }

    public void setDicount(Double dicount) {
        this.dicount = dicount;
    }

    public Double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(Double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public Double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(Double netAmount) {
        this.netAmount = netAmount;
    }

    public PhaItem getItem() {
        return item;
    }

    public void setItem(PhaItem item) {
        this.item = item;
    }

    public Double getFree() {
        return free;
    }

    public void setFree(Double free) {
        this.free = free;
    }

    public Double getMrp() {
        return mrp;
    }

    public void setMrp(Double mrp) {
        this.mrp = mrp;
    }

    public Double getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(Double salesPrice) {
        this.salesPrice = salesPrice;
    }

    public Date getExpire() {
        return expire;
    }

    public void setExpire(Date expire) {
        this.expire = expire;
    }

    @Override
    public String toString() {
        return "PhaPurInvoiceDetails{" + "detId=" + detId
                //                + ", phaInvId=" + phaInvId
                + ", itemName=" + itemName
                + ", item=" + item
                + ", batch=" + batch + ", pack=" + pack
                + ", size=" + size + ", qty=" + qty
                + ", unitTP=" + unitTP + ", totalAmount=" + totalAmount
                + ", vat=" + vat + ", vatAmount=" + vatAmount
                + ", dicount=" + dicount + ", discountAmount=" + discountAmount
                + ", netAmount=" + netAmount + '}';
    }

}
