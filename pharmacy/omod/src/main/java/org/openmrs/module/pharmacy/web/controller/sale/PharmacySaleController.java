/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.sale;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.math.BigDecimal;
import java.util.List;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Date;
import java.util.Map;
import org.openmrs.module.pharmacy.model.PhaItem;
import org.openmrs.module.pharmacy.model.PhaItemPrice;
import org.openmrs.module.pharmacy.model.PhaSale;
import org.springframework.web.bind.annotation.ResponseBody;
import org.openmrs.User;
import org.openmrs.module.pharmacy.model.PhaSaleCollect;
import org.openmrs.module.pharmacy.model.PhaSaleDetails;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacySaleController {

    //@RequestMapping(method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    @RequestMapping(value = "/module/pharmacy/savePhaSale.htm", method = RequestMethod.POST)
    public ResponseEntity<PhaSale> savesale(
            @RequestParam(value = "jsonList", required = false) String jsonList,
            @RequestBody PhaSale phaSale) throws Exception {

        User user = Context.getAuthenticatedUser();
        PharmacyService ps = Context.getService(PharmacyService.class);

        Double due = phaSale.getDueAmount();
        Double paid = phaSale.getPaid();

        String paidStatus = null;
        Integer duePaid = null;  // full paid=1, due=2, after due full paid=3
        if (due > 0) {
            paidStatus = "DUE";
            duePaid = 2;
        } else {
            paidStatus = "PAID";
            duePaid = 1;
        }

        if (user != null) {
            phaSale.setCreatedDate(new Date());
            phaSale.setCreator(user.getUserId());
            phaSale.setPaidStaus(paidStatus);
            ps.savePhaSale(phaSale);
 
            ObjectMapper mapper = new ObjectMapper();
            List<Map<String, String>> map = mapper.readValue(jsonList, new TypeReference<List<Map<String, String>>>() {
            });

            for (Map<String, String> map1 : map) {
                Object itemName = map1.get("itemName");
                Object avaQty = map1.get("avaQty");
                Object itemId = map1.get("itemId");
                Object itemPriceId = map1.get("itemPriceId"); // item price id
                Object qty = map1.get("qty");
                Object price = map1.get("price");
                Object amount = map1.get("amount");

                PhaItem item = ps.getPhaItemById(Integer.parseInt(itemId.toString()));

                PhaItemPrice phaItemPrice = ps.getPhaItemPriceById(Integer.parseInt(itemPriceId.toString()));

                PhaSaleDetails details = new PhaSaleDetails();
                details.setPhaItem(item);
                details.setQuantity(new Double(qty.toString()));
                details.setDiscountAmount(0.0);
                details.setUnitPrice(new Double(price.toString()));
                details.setTotalAmount(new Double(amount.toString()));
                details.setPhaSale(phaSale);
                details.setItemPrice(phaItemPrice);
                ps.savePhaSaleDet(details);

                PhaItemPrice itemPrice = ps.getPhaItemPriceById(Integer.parseInt(itemPriceId.toString()));
                itemPrice.setQty(itemPrice.getQty().subtract(new BigDecimal(qty.toString())));
            }

            PhaSaleCollect collect = new PhaSaleCollect();
            collect.setPhaSale(phaSale);
            collect.setCreator(user.getUserId());
            collect.setCollectedDate(new Date());
            collect.setStatus(1);  //first time paid or full paid=1, due=2, after due full paid=3
            collect.setDupPaid(duePaid);
            collect.setPaidAmount(paid);
            ps.savePhaSaleColl(collect);

        }

        return new ResponseEntity<PhaSale>(phaSale, HttpStatus.OK);
    }

}
