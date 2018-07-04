/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller.state;

import javax.servlet.http.HttpServletRequest;
import org.openmrs.api.context.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Khairul
 */
@Controller("CheckSessionController")
public class CheckSession {

    @RequestMapping(value = "/module/pharmacy/checkSession.htm", method = RequestMethod.GET)
    public @ResponseBody
    Integer s(HttpServletRequest request, Model model) {
        Integer session = null;
        if (Context.getAuthenticatedUser() != null && Context.getAuthenticatedUser().getId() != null) {
            session = 1;
        } else {
            session = 0;
        }
        return session;
    }
}
