package org.openmrs.module.pharmacy.api.impl;

import java.util.Date;
import java.util.List;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.APIException;
import org.openmrs.module.pharmacy.api.PharmacyService;
import org.openmrs.module.pharmacy.api.db.PharmacyDAO;
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

public class PharmacyServiceImpl extends BaseOpenmrsService implements PharmacyService {

    protected final Log log = LogFactory.getLog(this.getClass());

    private PharmacyDAO dao;

    public void setDao(PharmacyDAO dao) {
        this.dao = dao;
    }

    public PharmacyDAO getDao() {
        return dao;
    }

    @Override
    public void saveCategory(PhaItemCategory category) throws APIException {
        dao.saveCategory(category);
    }

    @Override
    public PhaItemCategory getPhaItemCateByIdName(Integer id, String name) throws APIException {
        return dao.getPhaItemCateByIdName(id, name);
    }

    @Override
    public List<PhaItemCategory> listPhaItemCateByTypeId(Integer id) throws APIException {
        return dao.listPhaItemCateByTypeId(id);
    }

    @Override
    public void savePhaItem(PhaItem item) throws APIException {
        dao.savePhaItem(item);
    }

    @Override
    public List<PhaItem> listPhaItemByCat(Integer catId) throws APIException {
        return dao.listPhaItemByCat(catId);
    }

    @Override
    public PhaItem getPhaItemByName(String name) throws APIException {
        return dao.getPhaItemByName(name);
    }

    @Override
    public PhaItem getPhaItemById(Integer id) throws APIException {
        return dao.getPhaItemById(id);
    }

    @Override
    public void savePhaSupplier(PhaSupplier phaSupplier) throws APIException {
        dao.savePhaSupplier(phaSupplier);
    }

    @Override
    public List<PhaSupplier> listPhaSupplier() throws APIException {
        return dao.listPhaSupplier();
    }

    @Override
    public PhaSupplier getPhaSupById(Integer id, String name) throws APIException {
        return dao.getPhaSupById(id, name);
    }

    @Override
    public void savePhaPur(PhaPurInvoice invoice) throws APIException {
        dao.savePhaPur(invoice);
    }

    @Override
    public PhaPurInvoice getPhaPurById(Integer id) throws APIException {
        return dao.getPhaPurById(id);
    }

    @Override
    public void savePhaPurDet(PhaPurInvoiceDetails details) throws APIException {
        dao.savePhaPurDet(details);
    }

    @Override
    public List<PhaPurInvoiceDetails> listPhaPurDet(Integer invId) throws APIException {
        return dao.listPhaPurDet(invId);
    }

    @Override
    public List<PhaPurInvoice> listPhaPurInvoiceDet() throws APIException {
        return dao.listPhaPurInvoiceDet();
    }

    @Override
    public void savePhaItemPrice(PhaItemPrice itemPrice) throws APIException {
        dao.savePhaItemPrice(itemPrice);
    }

    @Override
    public List<PhaItemPrice> listPhaItemPrice() throws APIException {
        return dao.listPhaItemPrice();
    }

    @Override
    public PhaItemPrice getPhaItemPriceById(Integer id) throws APIException {
        return dao.getPhaItemPriceById(id);
    }

    @Override
    public PhaItemPrice getPhaItemPriceByItemId(Integer itemId) throws APIException {
        return dao.getPhaItemPriceByItemId(itemId);
    }

    @Override
    public List<PhaItemPrice> listPhaItemPriceByInvId(Integer invId) throws APIException {
        return dao.listPhaItemPriceByInvId(invId);
    }

    @Override
    public void savePhaSale(PhaSale phaSale) throws APIException {
        dao.savePhaSale(phaSale);
    }

    @Override
    public void savePhaSaleVoided(PhaSaleVoided psv) throws APIException {
        dao.savePhaSaleVoided(psv);
    }

    @Override
    public void savePhaSaleColl(PhaSaleCollect collect) throws APIException {
        dao.savePhaSaleColl(collect);
    }

    @Override
    public void savePhaSaleDet(PhaSaleDetails details) throws APIException {
        dao.savePhaSaleDet(details);
    }

    @Override
    public List<PhaPatientSearch> listPhaPatientSearch(Integer status, String search) throws APIException {
        return dao.listPhaPatientSearch(status, search);
    }

    @Override
    public PhaPatientSearch getPhaPatientSearchByPatientId(Integer patientId) throws APIException {
        return dao.getPhaPatientSearchByPatientId(patientId);
    }

    @Override
    public PhaSale getPhaSaleById(Integer saleInvoiceId) throws APIException {
        return dao.getPhaSaleById(saleInvoiceId);
    }

    @Override
    public List<PhaSaleDetails> listPhaSaleDetByInvId(Integer saleInvoiceId) throws APIException {
        return dao.listPhaSaleDetByInvId(saleInvoiceId);
    }

    @Override
    public List<PhaSaleCollect> listPhaSaleCollByInvId(Integer saleInvoiceId) throws APIException {
        return dao.listPhaSaleCollByInvId(saleInvoiceId);
    }

    @Override
    public List<PhaSaleCollect> listPhaSaleCollByUserId(Integer userId, Date sDate, Date eDate) throws APIException {
        return dao.listPhaSaleCollByUserId(userId, sDate, eDate);
    }

    @Override
    public List<PhaSale> listPhaSale() throws APIException {
        return dao.listPhaSale();
    }

    @Override
    public PhaSaleDetails getPhaSaleDetById(Integer detId) throws APIException {
        return dao.getPhaSaleDetById(detId);
    }

    @Override
    public void savePhaSaleRet(PhaSaleReturn phaSaleReturn) throws APIException {
        dao.savePhaSaleRet(phaSaleReturn);
    }
 
    @Override
    public List<PhaSaleReturn> listPhaSaleReturnBySalInvId(Integer saleInvoiceId) throws APIException {
        return dao.listPhaSaleReturnBySalInvId(saleInvoiceId);
    }

}
