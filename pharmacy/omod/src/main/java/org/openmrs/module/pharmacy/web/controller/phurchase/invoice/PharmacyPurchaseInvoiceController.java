/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.phurchase.invoice;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.ArrayList;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.openmrs.module.pharmacy.model.PhaPurInvoiceDetails;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Date;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.openmrs.module.pharmacy.model.PhaItem;
import org.openmrs.module.pharmacy.model.PhaItemPrice;
import org.openmrs.module.pharmacy.model.PhaPurInvoice;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacyPurchaseInvoiceController {

    @RequestMapping(value = "/module/pharmacy/savePurchaseInv.htm", method = RequestMethod.POST)
    public ResponseEntity<PhaPurInvoice> savepurchase(@RequestBody PhaPurInvoice invoice) throws Exception {
        PharmacyService ps = Context.getService(PharmacyService.class);

        try {
            invoice.setCreator(Context.getAuthenticatedUser().getUserId());
            invoice.setCreatedDate(new Date());
            invoice.setStatus(0);
            for (PhaPurInvoiceDetails d : invoice.getDetailses()) {
                PhaItem item = ps.getPhaItemByName(d.getItemName());
                d.setItem(item);
                invoice.addDetails(d);
            }
            ps.savePhaPur(invoice);

            if (invoice.getPhaInvId() != null) {
                for (PhaPurInvoiceDetails d : invoice.getDetailses()) {
                    Double salPrice = d.getSalesPrice();
                    Double _size = d.getSize();
                    Double _unitSale = (salPrice / _size);

                    PhaItemPrice price = new PhaItemPrice();
                    price.setPhaInvId(invoice);
                    price.setItem(d.getItem());
                    price.setBatch(d.getBatch());
                    price.setQty(d.getQty());
                    price.setFree(d.getFree());
                    price.setUnitTp(d.getUnitTP());
                    price.setMrp(d.getMrp());
                    price.setSalesPrice(d.getSalesPrice());
                    price.setEachPrice(_unitSale);
                    price.setExpireDate(d.getExpire());
                    price.setStatus(0);
                    ps.savePhaItemPrice(price);
                }
            }

        } catch (Exception e) {
            System.out.println("Exception ::::::::::::::::::::::::" + e);
        }

        return new ResponseEntity<PhaPurInvoice>(invoice, HttpStatus.OK);
    }

    @RequestMapping(value = "/module/pharmacy/getpurinvoice.htm", method = RequestMethod.GET)
    public @ResponseBody
    PhaPurInvoice getpurinvoice(@RequestParam(value = "purInvId", required = false) Integer purInvId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        PhaPurInvoice invoice = ps.getPhaPurById(purInvId);
        if (invoice != null) {
            Set<PhaPurInvoiceDetails> detailses = new HashSet<PhaPurInvoiceDetails>();
            for (PhaPurInvoiceDetails detail : invoice.getDetailses()) {
                PhaPurInvoiceDetails det = new PhaPurInvoiceDetails();
                det = detail;
                det.setPhaInvId(null);
                detailses.add(det);
            }
            invoice.setDetailses(detailses);
        } else {
            invoice = null;
            return invoice;
        }
        return invoice;
    }

    @RequestMapping(value = "/module/pharmacy/getpurinvoicedetails.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaPurInvoiceDetails> getpurinvoicedetails(@RequestParam(value = "purInvId", required = false) Integer purInvId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaPurInvoiceDetails> detailses = ps.listPhaPurDet(purInvId);
        return detailses;
    }

    @RequestMapping(value = "/module/pharmacy/listpurinvoice.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaPurInvoice> listpurinvoic() {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaPurInvoice> list = ps.listPhaPurInvoiceDet();

        List<PhaPurInvoice> invs = new ArrayList<PhaPurInvoice>();

        for (PhaPurInvoice p : list) {
            PhaPurInvoice pp = new PhaPurInvoice();
            pp = p;
            pp.setDetailses(null);
            invs.add(pp);
        }

        return invs;
    }

}
