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
import java.util.Map;
import org.openmrs.module.pharmacy.model.PhaItem;
import org.openmrs.module.pharmacy.model.PhaItemPrice;
import org.openmrs.module.pharmacy.model.PhaPurInvoice;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Khairul
 */
@Controller
public class PharmacyPurchaseInvoiceController {

    @RequestMapping(value = "/module/pharmacy/savePurchaseInv.htm", method = RequestMethod.POST)
    public ResponseEntity<PhaPurInvoice> savepurchase(
            @RequestParam(value = "jsonList", required = false) String jsonList,
            @RequestBody PhaPurInvoice invoice) throws Exception {
        PharmacyService ps = Context.getService(PharmacyService.class);
        invoice.setCreator(Context.getAuthenticatedUser().getUserId());
        invoice.setCreatedDate(new Date());
        invoice.setStatus(0);
        ps.savePhaPur(invoice);

        ObjectMapper mapper = new ObjectMapper();

        List<Map<String, String>> map = mapper.readValue(jsonList, new TypeReference<List<Map<String, String>>>() {
        });

        for (Map<String, String> map1 : map) {
            Object itemName = map1.get("itemName");
            Object itemId = map1.get("itemId");
            Object batch = map1.get("batch");
            Object expire = map1.get("expire");
            Object pack = map1.get("pack");
            Object size = map1.get("size");
            Object qty = map1.get("qty");
            Object netQty = map1.get("netQty");
            Object free = map1.get("free");
            Object unitTP = map1.get("unitTP");
            Object totalAmount = map1.get("totalAmount");
            Object mrp = map1.get("mrp");
            Object salesPrice = map1.get("salesPrice");
            Object vat = map1.get("vat");
            Object vatAmount = map1.get("vatAmount");
            Object discount = map1.get("dicount");
            Object discountAmount = map1.get("discountAmount");
            Object netAmount = map1.get("netAmount");

            BigDecimal net = new BigDecimal(netAmount.toString());
            BigDecimal quantity = new BigDecimal(qty.toString());

            PhaItem item = ps.getPhaItemByName(itemName.toString().trim());

            PhaPurInvoiceDetails details = new PhaPurInvoiceDetails();
            details.setPhaInvId(invoice);
            details.setItemName(itemName.toString().trim());
            details.setItem(item);
            details.setBatch(batch.toString());
            details.setPack(new BigDecimal(pack.toString()));
            details.setSize(new BigDecimal(size.toString()));
            details.setQty(quantity);
            details.setUnitTP(new BigDecimal(unitTP.toString()));
            details.setTotalAmount(new BigDecimal(totalAmount.toString()));
            details.setVat(new BigDecimal(vat.toString()));
            details.setVatAmount(new BigDecimal(vatAmount.toString()));
            details.setDiscount(new BigDecimal(discount.toString()));
            details.setDiscountAmount(new BigDecimal(discountAmount.toString()));
            details.setNetAmount(net);
            ps.savePhaPurDet(details);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Date expDate = null;
            if (expire != null && expire != "") {
                String m = expire.toString().substring(0, expire.toString().indexOf("T") - 0);
                expDate = sdf.parse(m);
            }

            BigDecimal salPrice = new BigDecimal(salesPrice.toString());
            BigDecimal _size = new BigDecimal(size.toString());
            BigDecimal _unitSale = salPrice.divide(_size);

            //PhaItemPrice itemPrice = ps.getPhaItemPriceByItemId(item.getItemId());
            PhaItemPrice price = new PhaItemPrice();
            price.setPhaInvId(invoice);
            price.setItem(item);
            price.setBatch(batch.toString());
            price.setQty(new BigDecimal(netQty.toString()));
            price.setFree(new BigDecimal(free.toString()));
            price.setUnitTp(new BigDecimal(unitTP.toString()));
            price.setMrp(new BigDecimal(mrp.toString()));
            price.setSalesPrice(new BigDecimal(salesPrice.toString()));
            price.setEachPrice(_unitSale);
            price.setExpireDate(expDate);
            price.setStatus(0);
            ps.savePhaItemPrice(price);
        }
        return new ResponseEntity<PhaPurInvoice>(invoice, HttpStatus.OK);
    }

    @RequestMapping(value = "/module/pharmacy/getpurinvoice.htm", method = RequestMethod.GET)
    public @ResponseBody
    PhaPurInvoice getpurinvoice(@RequestParam(value = "purInvId", required = false) Integer purInvId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        PhaPurInvoice invoice = ps.getPhaPurById(purInvId);
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
