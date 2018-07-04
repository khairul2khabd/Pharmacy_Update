/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.state;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Khairul
 */
@Controller("pharmacyStateController")
public class StateControllerPharmacy {

    @RequestMapping(value = "/module/pharmacy/setpharmacy.htm", method = RequestMethod.GET)
    public String setup() {
        return "module/pharmacy/_pharmacy/_setupPharmacy";
    }
    
    @RequestMapping(value = "/module/pharmacy/secHome.htm", method = RequestMethod.GET)
    public String secHome() {
        return "module/pharmacy/main/secondaryHome";
    }

    @RequestMapping(value = "/module/pharmacy/itemcreate.htm", method = RequestMethod.GET)
    public String itemcreate() {
        return "module/pharmacy/_pharmacy/_itemcreate";
    }

    @RequestMapping(value = "/module/pharmacy/category.htm", method = RequestMethod.GET)
    public String category() {
        return "module/pharmacy/_pharmacy/_category";
    }

    @RequestMapping(value = "/module/pharmacy/godrec.htm", method = RequestMethod.GET)
    public String goodRec() {
        return "module/pharmacy/_pharmacy/grn/_goodsreceive";
    }
    
    @RequestMapping(value = "/module/pharmacy/suppadd.htm", method = RequestMethod.GET)
    public String suppllierAdd() {
        return "module/pharmacy/_pharmacy/_supplieradd";
    }
    
    @RequestMapping(value = "/module/pharmacy/purinvoiceview.htm", method = RequestMethod.GET)
    public String purchaseinvoiceview() {
        return "module/pharmacy/_pharmacy/grn/_purinvoiceview";
    }
    
    @RequestMapping(value = "/module/pharmacy/priceupdateview.htm", method = RequestMethod.GET)
    public String priceupdateview() {
        return "module/pharmacy/_pharmacy/priceupdate/_priceUpdate";
    }
    
    @RequestMapping(value = "/module/pharmacy/newbill.htm", method = RequestMethod.GET)
    public String newbill() {
        return "module/pharmacy/_pharmacy/newbill/newbill";
    }
    
    @RequestMapping(value = "/module/pharmacy/viewbill.htm", method = RequestMethod.GET)
    public String viewbill() {
        return "module/pharmacy/_pharmacy/newbill/_viewbill";
    }
    
    @RequestMapping(value = "/module/pharmacy/reports.htm", method = RequestMethod.GET)
    public String reports() {
        return "module/pharmacy/reports/_reports";
    }
    
    @RequestMapping(value = "/module/pharmacy/ueserstatement.htm", method = RequestMethod.GET)
    public String userwisestat() {
        return "module/pharmacy/reports/userWiseStatement";
    }
    
    @RequestMapping(value = "/module/pharmacy/duecollect.htm", method = RequestMethod.GET)
    public String duecollect() {
        return "module/pharmacy/_pharmacy/newbill/_duecollect";
    }

}
