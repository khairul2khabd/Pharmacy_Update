/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.sale;

import java.math.BigDecimal;
import java.math.BigInteger;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Date;
import org.openmrs.module.pharmacy.model.PhaSale;
import org.openmrs.User;
import org.openmrs.module.pharmacy.model.PhaItem;
import org.openmrs.module.pharmacy.model.PhaItemPrice;
import org.openmrs.module.pharmacy.model.PhaSaleCollect;
import org.openmrs.module.pharmacy.model.PhaSaleDetails;
import org.openmrs.module.pharmacy.model.PhaSaleReturn;
import org.openmrs.module.pharmacy.model.PhaSaleReturnDetails;
import org.openmrs.module.pharmacy.web.controller.utils.DetailsTempModel;
import org.openmrs.module.pharmacy.web.controller.utils.DueCollectModelPharmacy;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacyDueCollectController {

    @RequestMapping(value = "/module/pharmacy/dueCollectPhaBill.htm", method = RequestMethod.POST)
    public ResponseEntity<DueCollectModelPharmacy> saveIndBill(@RequestBody DueCollectModelPharmacy dcm) throws Exception {

        PharmacyService ps = Context.getService(PharmacyService.class);
        User user = Context.getAuthenticatedUser();
        String paidStatus = null;
        Integer status = 0;

        if (dcm.getNetDue() < 1) {
            paidStatus = "PAID";
            status = 2;
        } else {
            status = 2;
            paidStatus = "DUE";
        }
        PhaSaleCollect collect = null;

        if (dcm.getRetAmount() < 1) {
            if (user != null) {
                PhaSale phaSale = ps.getPhaSaleById(dcm.getBillId());
                phaSale.setPaid(phaSale.getPaid() + dcm.getDuePaid());
                phaSale.setDueAmount(dcm.getNetDue());
                phaSale.setPaidStaus(paidStatus);

                collect = new PhaSaleCollect();
                collect.setPaidAmount(dcm.getDuePaid());
                collect.setPhaSale(phaSale);
                collect.setDupPaid(3);
                collect.setCollectedDate(new Date());
                collect.setCreator(user.getUserId());
                collect.setStatus(status);
                ps.savePhaSaleColl(collect);
            } else {
                return new ResponseEntity<DueCollectModelPharmacy>(dcm, HttpStatus.UNAUTHORIZED);
            }
        } else {
            if (user != null) {
                PhaSale phaSale = ps.getPhaSaleById(dcm.getBillId());
                Double dis = phaSale.getDiscountAmount() - (dcm.getRetActual() - dcm.getRetAmount());
                Double tot = phaSale.getTotalAmount() - dcm.getRetActual();
                Double net = tot - dis;

                phaSale.setTotalAmount(tot);
                phaSale.setDiscountAmount(dis);
                phaSale.setNetAmount(net);
                phaSale.setDueAmount(dcm.getNetDue());
                phaSale.setPaidStaus(paidStatus);

//                if(dcm.getDuePaid()>0){
//                    Integer ars[]=[1,2];
//                }
                collect = new PhaSaleCollect();
                collect.setPaidAmount(dcm.getRetAmount());
                collect.setPhaSale(phaSale);
                collect.setDupPaid(5);
                collect.setCollectedDate(new Date());
                collect.setCreator(user.getUserId());
                collect.setStatus(status);
                ps.savePhaSaleColl(collect);

                PhaSaleReturn phaSaleReturn = new PhaSaleReturn();
                phaSaleReturn.setDueAdjust(dcm.getDuePaid());
                phaSaleReturn.setNetAmount(dcm.getRetActual());
                phaSaleReturn.setReturnAmount(dcm.getRetAmount());
                phaSaleReturn.setCreator(user.getUserId());
                phaSaleReturn.setCreatedDate(new Date());
                phaSaleReturn.setPhaSale(phaSale);

                for (DetailsTempModel dtm : dcm.getDtm()) {
                    PhaSaleDetails psd = ps.getPhaSaleDetById(dtm.getDetId());
                    psd.setQuantity(psd.getQuantity() - dtm.getQuantity());
                    psd.setTotalAmount(psd.getTotalAmount() - dtm.getTotalAmount());
                    ps.savePhaSaleDet(psd);

                    PhaItem item = ps.getPhaItemById(dtm.getItemId());
                    PhaItemPrice phaItemPrice = ps.getPhaItemPriceById(dtm.getItemPriceId());
//                    phaItemPrice.setQty(phaItemPrice.getQty().add(new BigDecimal(dtm.getQuantity())));
                    phaItemPrice.setQty(phaItemPrice.getQty() + dtm.getQuantity());

                    PhaSaleReturnDetails details = new PhaSaleReturnDetails();
                    details.setPhaSaleReturn(phaSaleReturn);
                    details.setQuantity(dtm.getQuantity());
                    details.setUnitPrice(dtm.getUnitPrice());
                    details.setReturnAmount(dtm.getAfDis());
                    details.setPhaItem(item);
                    details.setItemPrice(phaItemPrice);
                    phaSaleReturn.addDetails(details);
                }
                ps.savePhaSaleRet(phaSaleReturn);
            } else {
                return new ResponseEntity<DueCollectModelPharmacy>(dcm, HttpStatus.UNAUTHORIZED);
            }
        }

        return new ResponseEntity<DueCollectModelPharmacy>(dcm, HttpStatus.OK);
    }

}
