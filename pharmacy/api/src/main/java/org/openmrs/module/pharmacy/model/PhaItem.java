/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.util.Date;
import java.io.Serializable;

/**
 *
 * @author Khairul
 */
public class PhaItem implements Serializable {

    private Integer itemId;
    private String itemName;
    private String shortId;
    private String itemCategory;
    private String manufacture;
    private String shelf;
    private String genericName;
    private Integer stockMinLvl;
    private Integer stockMaxLvl;
    private Integer categoryId;
    private String medicineFor;
    private String description;
    private Date createdDate;
    private Integer creator;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getShortId() {
        return shortId;
    }

    public void setShortId(String shortId) {
        this.shortId = shortId;
    }

    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    public String getManufacture() {
        return manufacture;
    }

    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }

    public String getShelf() {
        return shelf;
    }

    public void setShelf(String shelf) {
        this.shelf = shelf;
    }

    public String getGenericName() {
        return genericName;
    }

    public void setGenericName(String genericName) {
        this.genericName = genericName;
    }

    public Integer getStockMinLvl() {
        return stockMinLvl;
    }

    public void setStockMinLvl(Integer stockMinLvl) {
        this.stockMinLvl = stockMinLvl;
    }

    public Integer getStockMaxLvl() {
        return stockMaxLvl;
    }

    public void setStockMaxLvl(Integer stockMaxLvl) {
        this.stockMaxLvl = stockMaxLvl;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getMedicineFor() {
        return medicineFor;
    }

    public void setMedicineFor(String medicineFor) {
        this.medicineFor = medicineFor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    @Override
    public String toString() {
        return "PhaItem{" + "itemId=" + itemId + ", itemName=" + itemName + ", shortId=" + shortId + ", itemCategory=" + itemCategory + ", manufacture=" + manufacture + ", shelf=" + shelf + ", genericName=" + genericName + ", stockMinLvl=" + stockMinLvl + ", stockMaxLvl=" + stockMaxLvl + ", categoryId=" + categoryId + ", medicineFor=" + medicineFor + ", description=" + description + ", createdDate=" + createdDate + ", creator=" + creator + '}';
    }

}
