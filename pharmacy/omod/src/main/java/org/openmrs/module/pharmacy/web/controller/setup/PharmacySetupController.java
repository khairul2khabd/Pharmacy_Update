/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.setup;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.openmrs.module.pharmacy.model.PhaItem;
import org.openmrs.module.pharmacy.model.PhaItemCategory;
import org.openmrs.module.pharmacy.model.PhaSupplier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Khairul
 */
@Controller("pharmacySetupController")
public class PharmacySetupController {

    @RequestMapping(value = "/module/pharmacy/createCategory.htm", method = RequestMethod.POST)
    public ResponseEntity<PhaItemCategory> category(@RequestBody PhaItemCategory category) throws Exception {
        //System.out.println("*********" + category);
        PharmacyService ps = Context.getService(PharmacyService.class);
        String name = category.getCategory().trim();
        Integer id = category.getCategoryId() == null ? 0 : category.getCategoryId();
        PhaItemCategory pic = ps.getPhaItemCateByIdName(null, name);

        if (category.getCategoryId() == null) {
            if (pic == null) {
                ps.saveCategory(category);
            } else {
                return new ResponseEntity<PhaItemCategory>(category, HttpStatus.CONFLICT);
            }
        } else {
            PhaItemCategory cate1 = ps.getPhaItemCateByIdName(id, null);
            if (pic == null) {
                cate1.setCategory(name);
                ps.saveCategory(cate1);

            } else if (pic != null) {
                if (pic.getCategoryId() == cate1.getCategoryId()) {
                    cate1.setCategory(name);
                    ps.saveCategory(cate1);
                } else {
                    return new ResponseEntity<PhaItemCategory>(category, HttpStatus.CONFLICT);
                }
            }
        }
        return new ResponseEntity<PhaItemCategory>(category, HttpStatus.OK);
    }

    @RequestMapping(value = "/module/pharmacy/listcategory.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaItemCategory> cateList() throws Exception {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaItemCategory> list = ps.listPhaItemCateByTypeId(0);
        return list;
    }

    @RequestMapping(value = "/module/pharmacy/createItem.htm", method = RequestMethod.POST)
    public ResponseEntity<PhaItem> saveItem(@RequestBody PhaItem item) throws Exception {
        String name = item.getItemName().trim();
        Integer id = item.getItemId() == null ? 0 : item.getItemId();
        PharmacyService ps = Context.getService(PharmacyService.class);
        PhaItem pi = ps.getPhaItemByName(name);
        System.out.println("ppppppppp" + item);
        try {
            if (item.getItemId() == null) {
                if (pi == null) {
                    item.setItemName(name);
                    item.setCreatedDate(new Date());
                    item.setCreator(Context.getAuthenticatedUser().getUserId());
                    ps.savePhaItem(item);
                } else {
                    return new ResponseEntity<PhaItem>(item, HttpStatus.CONFLICT);
                }
            } /// for update
            else {
                PhaItem item1 = ps.getPhaItemById(id);

                if (pi == null) {
                    item1.setItemName(name);
                    item1.setShortId(item.getShortId());
                    item1.setItemCategory(item.getItemCategory());
                    item1.setManufacture(item.getManufacture());
                    item1.setGenericName(item.getGenericName().trim());
                    item1.setShelf(item.getShelf());
                    item1.setStockMinLvl(item.getStockMinLvl());
                    item1.setStockMaxLvl(item.getStockMaxLvl());
                    item1.setMedicineFor(item.getMedicineFor());
                    item1.setDescription(item.getDescription());
                    ps.savePhaItem(item1);
                } else if (pi != null) {
                    if (pi.getItemId() == item1.getItemId()) {
                        item1.setItemName(name);
                        item1.setShortId(item.getShortId());
                        item1.setItemCategory(item.getItemCategory());
                        item1.setManufacture(item.getManufacture());
                        item1.setGenericName(item.getGenericName().trim());
                        item1.setShelf(item.getShelf());
                        item1.setStockMinLvl(item.getStockMinLvl());
                        item1.setStockMaxLvl(item.getStockMaxLvl());
                        item1.setMedicineFor(item.getMedicineFor());
                        item1.setDescription(item.getDescription());
                        ps.savePhaItem(item1);
                    } else {
                        return new ResponseEntity<PhaItem>(item, HttpStatus.CONFLICT);
                    }
                } else {
                    return new ResponseEntity<PhaItem>(item, HttpStatus.CONFLICT);
                }
            }
        } catch (Exception e) {
            System.out.println("Exception ::::" + e);
        }

        return new ResponseEntity<PhaItem>(item, HttpStatus.OK);
    }

    @RequestMapping(value = "/module/pharmacy/listitem.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaItem> itemList() throws Exception {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaItem> list = ps.listPhaItemByCat(0);
        return list;
    }

    @RequestMapping(value = "/module/pharmacy/addSupplier.htm", method = RequestMethod.POST)
    public ResponseEntity<PhaSupplier> saveSupplier(@RequestBody PhaSupplier phaSupplier) throws Exception {
        String name = phaSupplier.getSupplierName().trim();
        Integer id = phaSupplier.getSupId() == null ? 0 : phaSupplier.getSupId();
        PharmacyService ps = Context.getService(PharmacyService.class);
        PhaSupplier supplier = ps.getPhaSupById(null, name);
        System.out.println("sssssssssssssssss" + supplier);
        try {
            if (phaSupplier.getSupId() == null) {
                if (supplier == null) {
                    phaSupplier.setSupplierName(name);
                    phaSupplier.setCreatedDate(new Date());
                    phaSupplier.setCreator(Context.getAuthenticatedUser().getUserId());
                    ps.savePhaSupplier(phaSupplier);
                } else {
                    return new ResponseEntity<PhaSupplier>(phaSupplier, HttpStatus.CONFLICT);
                }
            } /// for update
            else {
                PhaSupplier supplier1 = ps.getPhaSupById(id, null);
                if (supplier == null) {
                    supplier1.setSupplierName(phaSupplier.getSupplierName());
                    supplier1.setPhoneNo(phaSupplier.getPhoneNo());
                    supplier1.setAddress(phaSupplier.getAddress());
                    supplier1.setEmail(phaSupplier.getEmail());
                    supplier1.setDesc(phaSupplier.getDesc());
                    ps.savePhaSupplier(supplier1);
                } else if (supplier != null) {
                    if (supplier1.getSupId() == supplier.getSupId()) {
                        supplier1.setSupplierName(phaSupplier.getSupplierName());
                        supplier1.setPhoneNo(phaSupplier.getPhoneNo());
                        supplier1.setAddress(phaSupplier.getAddress());
                        supplier1.setEmail(phaSupplier.getEmail());
                        supplier1.setDesc(phaSupplier.getDesc());
                        ps.savePhaSupplier(supplier1);
                    } else {
                        return new ResponseEntity<PhaSupplier>(phaSupplier, HttpStatus.CONFLICT);
                    }
                } else {
                    return new ResponseEntity<PhaSupplier>(phaSupplier, HttpStatus.CONFLICT);
                }
            }
        } catch (Exception e) {
            System.out.println("Exception ::::::" + e);
        }

        return new ResponseEntity<PhaSupplier>(phaSupplier, HttpStatus.OK);
    }

    @RequestMapping(value = "/module/pharmacy/listsupplier.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaSupplier> supplierList() throws Exception {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaSupplier> list = ps.listPhaSupplier();
        return list;
    }

}
