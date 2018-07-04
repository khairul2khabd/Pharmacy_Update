/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.pharmacy.web.controller;

import java.util.List;
import org.openmrs.api.context.Context;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.openmrs.module.pharmacy.model.PhaPatientSearch;
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
@Controller
public class PatientInformationController {

    @RequestMapping(value = "/module/pharmacy/listpatientsearch.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaPatientSearch> listpatientsearch() {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaPatientSearch> list = ps.listPhaPatientSearch(null, "null");
        return list;
    }

    @RequestMapping(value = "/module/pharmacy/searchpatienbynameorphone.htm", method = RequestMethod.GET)
    public @ResponseBody
    List<PhaPatientSearch> searchPatient(@RequestParam(value = "search", required = false) String search) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        List<PhaPatientSearch> list = ps.listPhaPatientSearch(1, search);
        return list;
    }

    @RequestMapping(value = "/module/pharmacy/getpatientsearchbyid.htm", method = RequestMethod.GET)
    public @ResponseBody
    PhaPatientSearch getpatientsearchbyid(@RequestParam(value = "patientId", required = false) Integer patientId) {
        PharmacyService ps = Context.getService(PharmacyService.class);
        PhaPatientSearch patientSearch = ps.getPhaPatientSearchByPatientId(patientId);
        return patientSearch;
    }

}
