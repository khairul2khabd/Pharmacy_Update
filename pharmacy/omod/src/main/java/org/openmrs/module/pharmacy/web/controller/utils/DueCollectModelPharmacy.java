/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.utils;

import java.util.List;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 *
 * @author Khairul
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class DueCollectModelPharmacy {

    private Integer billId;
    private Double duePaid;
    private Double netDue;
    private Double retAmount;
    private Double retActual;
    private List<DetailsTempModel> dtm;

    public List<DetailsTempModel> getDtm() {
        return dtm;
    }

    public void setDtm(List<DetailsTempModel> dtm) {
        this.dtm = dtm;
    }

    
    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public Double getDuePaid() {
        return duePaid;
    }

    public void setDuePaid(Double duePaid) {
        this.duePaid = duePaid;
    }

    public Double getNetDue() {
        return netDue;
    }

    public void setNetDue(Double netDue) {
        this.netDue = netDue;
    }

    public Double getRetAmount() {
        return retAmount;
    }

    public void setRetAmount(Double retAmount) {
        this.retAmount = retAmount;
    }

    public Double getRetActual() {
        return retActual;
    }

    public void setRetActual(Double retActual) {
        this.retActual = retActual;
    }

    @Override
    public String toString() {
        return "DueCollectModelPharmacy{" + "billId=" + billId + ", duePaid=" + duePaid
                + ", netDue=" + netDue
                + ", retAmount=" + retAmount
                + ", retActual=" + retActual
                + ", dtm=" + dtm
                + '}';
    }

}
