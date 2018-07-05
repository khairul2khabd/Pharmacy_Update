/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.phurchase.invoice;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
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
        return list;
    }

}

//    @RequestMapping(value = "/module/pharmacy/savePurchaseInv.htm", method = RequestMethod.POST)
//    public ResponseEntity<PhaPurInvoice> savepurchase(
//            @RequestParam(value = "jsonList", required = false) String jsonList,
//            @RequestBody PhaPurInvoice invoice) throws Exception {
//        PharmacyService ps = Context.getService(PharmacyService.class);
//        invoice.setCreator(Context.getAuthenticatedUser().getUserId());
//        invoice.setCreatedDate(new Date());
//        invoice.setStatus(0);
//        ps.savePhaPur(invoice);
//
//        ObjectMapper mapper = new ObjectMapper();
//
//        List<Map<String, String>> map = mapper.readValue(jsonList, new TypeReference<List<Map<String, String>>>() {
//        });
//
//        for (Map<String, String> map1 : map) {
//            Object itemName = map1.get("itemName");
//            Object itemId = map1.get("itemId");
//            Object batch = map1.get("batch");
//            Object expire = map1.get("expire");
//            Object pack = map1.get("pack");
//            Object size = map1.get("size");
//            Object qty = map1.get("qty");
//            Object netQty = map1.get("netQty");
//            Object free = map1.get("free");
//            Object unitTP = map1.get("unitTP");
//            Object totalAmount = map1.get("totalAmount");
//            Object mrp = map1.get("mrp");
//            Object salesPrice = map1.get("salesPrice");
//            Object vat = map1.get("vat");
//            Object vatAmount = map1.get("vatAmount");
//            Object discount = map1.get("dicount");
//            Object discountAmount = map1.get("discountAmount");
//            Object netAmount = map1.get("netAmount");
//
//            Double net = new Double(netAmount.toString());
//            Double quantity = new Double(qty.toString());
//
//            PhaItem item = ps.getPhaItemByName(itemName.toString().trim());
//
//            PhaPurInvoiceDetails details = new PhaPurInvoiceDetails();
//            details.setPhaInvId(invoice);
//            details.setItemName(itemName.toString().trim());
//            details.setItem(item);
//            details.setBatch(batch.toString());
//            details.setPack(new Double(pack.toString()));
//            details.setSize(new Double(size.toString()));
//            details.setQty(quantity);
//            details.setUnitTP(new Double(unitTP.toString()));
//            details.setTotalAmount(new Double(totalAmount.toString()));
//            details.setVat(new Double(vat.toString()));
//            details.setVatAmount(new Double(vatAmount.toString()));
//            details.setDiscount(new Double(discount.toString()));
//            details.setDiscountAmount(new Double(discountAmount.toString()));
//            details.setNetAmount(net);
//            ps.savePhaPurDet(details);
//
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//            Date expDate = null;
//            if (expire != null && expire != "") {
//                String m = expire.toString().substring(0, expire.toString().indexOf("T") - 0);
//                expDate = sdf.parse(m);
//            }
//
//            BigDecimal salPrice = new BigDecimal(salesPrice.toString());
//            BigDecimal _size = new BigDecimal(size.toString());
//            BigDecimal _unitSale = salPrice.divide(_size);
//
//            //PhaItemPrice itemPrice = ps.getPhaItemPriceByItemId(item.getItemId());
//            PhaItemPrice price = new PhaItemPrice();
//            price.setPhaInvId(invoice);
//            price.setItem(item);
//            price.setBatch(batch.toString());
//            price.setQty(new BigDecimal(netQty.toString()));
//            price.setFree(new BigDecimal(free.toString()));
//            price.setUnitTp(new BigDecimal(unitTP.toString()));
//            price.setMrp(new BigDecimal(mrp.toString()));
//            price.setSalesPrice(new BigDecimal(salesPrice.toString()));
//            price.setEachPrice(_unitSale);
//            price.setExpireDate(expDate);
//            price.setStatus(0);
//            ps.savePhaItemPrice(price);
//        }
//        return new ResponseEntity<PhaPurInvoice>(invoice, HttpStatus.OK);
//    }
