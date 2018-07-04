/**
 * The contents of this file are subject to the OpenMRS Public License Version
 * 1.0 (the "License"); you may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 *
 * Copyright (C) OpenMRS, LLC. All Rights Reserved.
 */
package org.openmrs.module.pharmacy.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * The main controller.
 */
@Controller
public class PharmacyManageController {

    protected final Log log = LogFactory.getLog(getClass());

    @RequestMapping(value = "/module/pharmacy/main.form", method = RequestMethod.GET)
    public String manage(ModelMap model) {
        model.addAttribute("user", Context.getAuthenticatedUser());
        return "/module/pharmacy/main";
    }

    @RequestMapping(value = "/module/pharmacy/pharmacy.form", method = RequestMethod.GET)
    public String pharmacy(Map<String, Object> map, Model model) {
        User user = Context.getAuthenticatedUser();
        model.addAttribute("user", user);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date d = new Date();
        model.addAttribute("currentDate", sdf.format(d));
        return "module/pharmacy/main/pharmacy";
    }
}
