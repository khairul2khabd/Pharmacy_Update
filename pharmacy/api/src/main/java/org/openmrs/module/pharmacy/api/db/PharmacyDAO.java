package org.openmrs.module.pharmacy.api.db;

import java.util.Date;
import java.util.List;
import org.openmrs.api.APIException;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.pharmacy.api.PharmacyService;
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

public interface PharmacyDAO {

    public void saveCategory(PhaItemCategory category) throws DAOException;

    public PhaItemCategory getPhaItemCateByIdName(Integer id, String name) throws DAOException;

    public List<PhaItemCategory> listPhaItemCateByTypeId(Integer id) throws DAOException;

    public void savePhaItem(PhaItem item) throws DAOException;

    public List<PhaItem> listPhaItemByCat(Integer catId) throws DAOException;

    public PhaItem getPhaItemByName(String name) throws DAOException;

    public PhaItem getPhaItemById(Integer id) throws DAOException;

    public void savePhaSupplier(PhaSupplier phaSupplier) throws DAOException;

    public List<PhaSupplier> listPhaSupplier() throws DAOException;

    public PhaItemPrice getPhaItemPriceById(Integer id) throws DAOException;

    public PhaSupplier getPhaSupById(Integer id, String name) throws DAOException;

    public void savePhaPur(PhaPurInvoice invoice) throws DAOException;

    public PhaPurInvoice getPhaPurById(Integer id) throws DAOException;

    public void savePhaPurDet(PhaPurInvoiceDetails details) throws DAOException;

    public List<PhaPurInvoiceDetails> listPhaPurDet(Integer invId) throws DAOException;

    public List<PhaPurInvoice> listPhaPurInvoiceDet() throws DAOException;

    public void savePhaItemPrice(PhaItemPrice itemPrice) throws DAOException;

    public List<PhaItemPrice> listPhaItemPrice() throws DAOException;

    public PhaItemPrice getPhaItemPriceByItemId(Integer itemId) throws DAOException;

    public List<PhaItemPrice> listPhaItemPriceByInvId(Integer invId) throws DAOException;

    public void savePhaSale(PhaSale phaSale) throws DAOException;

    public void savePhaSaleVoided(PhaSaleVoided psv) throws DAOException;

    public void savePhaSaleColl(PhaSaleCollect collect) throws DAOException;

    public void savePhaSaleDet(PhaSaleDetails details) throws DAOException;

    public List<PhaPatientSearch> listPhaPatientSearch(Integer status, String search) throws DAOException;

    public PhaPatientSearch getPhaPatientSearchByPatientId(Integer patientId) throws DAOException;
    
    public PhaSale getPhaSaleById(Integer saleInvoiceId)throws DAOException;
    
    public List<PhaSaleDetails> listPhaSaleDetByInvId(Integer saleInvoiceId)throws DAOException;
    
    public List<PhaSaleCollect> listPhaSaleCollByInvId(Integer saleInvoiceId)throws DAOException;
    
    public List<PhaSaleCollect> listPhaSaleCollByUserId(Integer userId, Date sDate, Date eDate)throws DAOException;
    
    public List<PhaSale> listPhaSale()throws DAOException;
    
    public PhaSaleDetails getPhaSaleDetById(Integer detId)throws DAOException;
    
    public void savePhaSaleRet(PhaSaleReturn phaSaleReturn)throws APIException;
    
    public List<PhaSaleReturn> listPhaSaleReturnBySalInvId(Integer saleInvoiceId)throws DAOException;
}
