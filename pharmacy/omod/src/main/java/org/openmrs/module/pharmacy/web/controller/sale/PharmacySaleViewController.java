/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.sale;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.pharmacy.model.PhaSale;
import org.springframework.web.bind.annotation.ResponseBody;
import org.openmrs.module.pharmacy.model.PhaSaleCollect;
import org.openmrs.module.pharmacy.model.PhaSaleDetails;
import org.openmrs.module.pharmacy.model.PhaSaleReturn;
import org.openmrs.module.pharmacy.model.PhaSaleReturnDetails;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacySaleViewController {

    @RequestMapping(value = "/module/pharmacy/listPhaSale.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaSale> recentvoucher() {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaSale> list = ps.listPhaSale();
        return list;
    }

    @RequestMapping(value = "/module/pharmacy/getPhaSaleByInvoiceId.htm", method = RequestMethod.GET)
    public @ResponseBody
    PhaSale saleinvoiceview(@RequestParam(value = "saleInvoiceId", required = false) Integer saleInvoiceId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        PhaSale phaSale = ps.getPhaSaleById(saleInvoiceId);
        return phaSale;
    }

    @RequestMapping(value = "/module/pharmacy/listPhaSaleDetByInvoiceId.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaSaleDetails> listPhaSaleDetailsByInvoiceId(@RequestParam(value = "saleInvoiceId", required = false) Integer saleInvoiceId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaSaleDetails> detailses = ps.listPhaSaleDetByInvId(saleInvoiceId);
        return detailses;
    }

    @RequestMapping(value = "/module/pharmacy/listPhaSaleCollectByInvoiceId.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaSaleCollect> listPhaSaleCollByInvoiceId(@RequestParam(value = "saleInvoiceId", required = false) Integer saleInvoiceId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaSaleCollect> collects = ps.listPhaSaleCollByInvId(saleInvoiceId);
        return collects;
    }

    @RequestMapping(value = "/module/pharmacy/listPhaSaleReturnByInvoiceId.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaSaleReturn> listPhaSaleReturn(@RequestParam(value = "saleInvoiceId", required = false) Integer saleInvoiceId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaSaleReturn> list = ps.listPhaSaleReturnBySalInvId(saleInvoiceId);

        if (!list.isEmpty()) {
            Set<PhaSaleReturnDetails> s = new HashSet<PhaSaleReturnDetails>();

            for (PhaSaleReturn psr : list) {
                for (PhaSaleReturnDetails de : psr.getDetailses()) {
                    PhaSaleReturnDetails details = new PhaSaleReturnDetails();
                    details = de;
                    details.setPhaSaleReturn(null);
                    s.add(details);
                }
                
                psr.setDetailses(s);
            }
        }

        return list;
    }
}
