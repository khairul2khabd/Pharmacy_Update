/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.reports;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.openmrs.User;
import org.openmrs.module.pharmacy.model.PhaSaleCollect;
import org.openmrs.module.pharmacy.web.controller.utils.UserTemp;

/**
 *
 * @author Khairul
 */
@Controller
public class ReportsController {

    @RequestMapping(value = "/module/pharmacy/userList.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<UserTemp> userList() {
        List<User> list = Context.getUserService().getAllUsers();
        List<UserTemp> list1 = new ArrayList<UserTemp>();
        for (User u : list) {
            UserTemp temp = new UserTemp();
            temp.setUserId(u.getUserId());
            temp.setUserName(u.getUsername());
            temp.setGivenName(u.getGivenName());
            //temp.setMiddleName(u.getName());
            //temp.setFamilyName(u.getPersonName().getFamilyName());
            list1.add(temp);
        }
        return list1;
    }

    @RequestMapping(value = "/module/pharmacy/phaSaleCollByUser.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaSaleCollect> usercollbyuser(@RequestParam(value = "userId", required = false) Integer userId,
            @RequestParam(value = "sDate", required = false) String sDate,
            @RequestParam(value = "eDate", required = false) String eDate) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 
        Date date = null;
        Date date1 = null;
        try {
            date = sdf.parse(sDate);
            date1 = sdf.parse(eDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
       
        List<PhaSaleCollect> list = ps.listPhaSaleCollByUserId(userId, date, date1);
        return list;
    }

}
