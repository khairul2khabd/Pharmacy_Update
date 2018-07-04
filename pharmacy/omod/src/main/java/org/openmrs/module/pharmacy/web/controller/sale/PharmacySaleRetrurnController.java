/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.sale;

import java.util.List;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.openmrs.User;
import org.openmrs.module.pharmacy.model.PhaSaleDetails;
import org.openmrs.module.pharmacy.web.controller.utils.DetailsTempModel;
import org.openmrs.module.pharmacy.web.controller.utils.DueCollectModelPharmacy;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacySaleRetrurnController {

    @RequestMapping(value = "/module/pharmacy/saleReturnItem.htm", method = RequestMethod.POST)
    //public ResponseEntity<List<DetailsTempModel>> salereturn(@RequestBody List<DetailsTempModel> dtms) throws Exception {
    public ResponseEntity<DueCollectModelPharmacy> salereturn(@RequestBody DueCollectModelPharmacy dcmp) throws Exception {
        //HttpHeaders headers = new HttpHeaders();
        PharmacyService ps = Context.getService(PharmacyService.class);
        User user = Context.getAuthenticatedUser();
        System.out.println("**** " + dcmp);
        for (DetailsTempModel dtm : dcmp.getDtm()) {
            System.out.println("************** " + dtm);
        }
        DetailsTempModel dtm = null;
        if (user != null) {

        } else {
            return new ResponseEntity<DueCollectModelPharmacy>(dcmp, HttpStatus.UNAUTHORIZED);
        }
        return new ResponseEntity<DueCollectModelPharmacy>(dcmp, HttpStatus.OK);
    }

}
