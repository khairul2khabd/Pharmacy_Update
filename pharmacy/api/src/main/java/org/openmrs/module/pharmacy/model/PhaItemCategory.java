/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.model;

import java.io.Serializable;

/**
 *
 * @author Khairul
 */
public class PhaItemCategory implements Serializable {

    private Integer categoryId;
    private String category;
    private Integer typeId;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "PhaItemCategory{" + "categoryId=" + categoryId + ", category=" + category + ", typeId=" + typeId + '}';
    }

}
