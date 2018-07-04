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
package org.openmrs.module.pharmacy.api;

import java.util.List;
import java.util.Date;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.pharmacy.model.PhaItem;
import org.openmrs.module.pharmacy.model.PhaItemCategory;
import org.openmrs.module.pharmacy.model.PhaItemPrice;
import org.openmrs.module.pharmacy.model.PhaPatientSearch;
import org.openmrs.module.pharmacy.model.PhaPurInvoice;
import org.openmrs.module.pharmacy.model.PhaPurInvoiceDetails;
import org.openmrs.module.pharmacy.model.PhaSale;
import org.openmrs.module.pharmacy.model.PhaSaleCollect;
import org.openmrs.module.pharmacy.model.PhaSaleDetails;
import org.openmrs.module.pharmacy.model.PhaSaleReturn;
import org.openmrs.module.pharmacy.model.PhaSaleReturnDetails;
import org.openmrs.module.pharmacy.model.PhaSaleVoided;
import org.openmrs.module.pharmacy.model.PhaSupplier;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface PharmacyService extends OpenmrsService {

    public void saveCategory(PhaItemCategory category) throws APIException;

    public PhaItemCategory getPhaItemCateByIdName(Integer id, String name) throws APIException;

    public List<PhaItemCategory> listPhaItemCateByTypeId(Integer id) throws APIException;

    public void savePhaItem(PhaItem item) throws APIException;

    public List<PhaItem> listPhaItemByCat(Integer catId) throws APIException;

    public PhaItem getPhaItemByName(String name) throws APIException;

    public PhaItem getPhaItemById(Integer id) throws APIException;

    public void savePhaSupplier(PhaSupplier phaSupplier) throws APIException;

    public List<PhaSupplier> listPhaSupplier() throws APIException;

    public PhaSupplier getPhaSupById(Integer id, String name) throws APIException;

    public void savePhaPur(PhaPurInvoice invoice) throws APIException;

    public PhaPurInvoice getPhaPurById(Integer id) throws APIException;

    public void savePhaPurDet(PhaPurInvoiceDetails details) throws APIException;

    public List<PhaPurInvoiceDetails> listPhaPurDet(Integer invId) throws APIException;

    public List<PhaPurInvoice> listPhaPurInvoiceDet() throws APIException;

    public void savePhaItemPrice(PhaItemPrice itemPrice) throws APIException;

    public List<PhaItemPrice> listPhaItemPrice() throws APIException;
    
    public PhaItemPrice getPhaItemPriceById(Integer id)throws APIException;

    public PhaItemPrice getPhaItemPriceByItemId(Integer itemId) throws APIException;

    public List<PhaItemPrice> listPhaItemPriceByInvId(Integer invId) throws APIException;

    public void savePhaSale(PhaSale phaSale) throws APIException;

    public void savePhaSaleVoided(PhaSaleVoided psv) throws APIException;

    public void savePhaSaleColl(PhaSaleCollect collect) throws APIException;

    public void savePhaSaleDet(PhaSaleDetails details) throws APIException;

    public List<PhaPatientSearch> listPhaPatientSearch(Integer status, String search) throws APIException;

    public PhaPatientSearch getPhaPatientSearchByPatientId(Integer patientId) throws APIException;
    
    public PhaSale getPhaSaleById(Integer saleInvoiceId)throws APIException;
    
    public List<PhaSaleDetails> listPhaSaleDetByInvId(Integer saleInvoiceId)throws APIException;
    
    public List<PhaSaleCollect> listPhaSaleCollByInvId(Integer saleInvoiceId)throws APIException;
    
    public List<PhaSaleCollect> listPhaSaleCollByUserId(Integer userId, Date sDate, Date eDate)throws APIException;
    
    public List<PhaSale> listPhaSale()throws APIException;
    
    public PhaSaleDetails getPhaSaleDetById(Integer detId)throws APIException;
    
    public void savePhaSaleRet(PhaSaleReturn phaSaleReturn)throws APIException;
    
    public List<PhaSaleReturn> listPhaSaleReturnBySalInvId(Integer saleInvoiceId)throws APIException;
}
