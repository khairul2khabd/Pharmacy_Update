/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.phurchase.invoice;

import java.util.List;
import java.util.ArrayList;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.pharmacy.model.PhaItemPrice;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacyItemPriceController {

    @RequestMapping(value = "/module/pharmacy/getListPhaItemPrice.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaItemPrice> getListPhaItemPrice() {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaItemPrice> itemPriceList = ps.listPhaItemPrice();
        List<PhaItemPrice> list = new ArrayList<PhaItemPrice>();
        for (PhaItemPrice p : itemPriceList) {
            PhaItemPrice itm = new PhaItemPrice();
            itm = p;
            itm.setPhaInvId(null);
            list.add(itm);
        }
        return list;
    }

    @RequestMapping(value = "/module/pharmacy/getListPhaItemPriceByInvId.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaItemPrice> getListPhaItemPriceByInvId(@RequestParam(value = "purInvId", required = false) Integer purInvId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaItemPrice> itemPriceList = ps.listPhaItemPriceByInvId(purInvId);
        List<PhaItemPrice> list = new ArrayList<PhaItemPrice>();
        for (PhaItemPrice p : itemPriceList) {
            PhaItemPrice itm = new PhaItemPrice();
            itm = p;
            itm.setPhaInvId(null);
            list.add(itm);
        }
        return list;
    }

}
