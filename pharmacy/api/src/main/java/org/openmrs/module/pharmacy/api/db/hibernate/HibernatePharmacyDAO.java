package org.openmrs.module.pharmacy.api.db.hibernate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import java.math.BigDecimal;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.openmrs.api.APIException;
import org.openmrs.api.db.DAOException;
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
import org.springframework.transaction.annotation.Transactional;

public class HibernatePharmacyDAO implements PharmacyDAO {
    
    protected final Log log = LogFactory.getLog(this.getClass());
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Override
    public void saveCategory(PhaItemCategory category) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(category);
    }
    
    @Override
    public PhaItemCategory getPhaItemCateByIdName(Integer id, String name) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItemCategory.class);
        if (id != null) {
            criteria.add(Restrictions.eq("categoryId", id));
        }
        if (name != null) {
            criteria.add(Restrictions.eq("category", name));
        }
        return (PhaItemCategory) criteria.uniqueResult();
    }
    
    @Override
    public List<PhaItemCategory> listPhaItemCateByTypeId(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItemCategory.class);
        if (id != 0) {
            criteria.add(Restrictions.eq("typeId", id));
        }
        return criteria.list();
    }
    
    @Override
    public void savePhaItem(PhaItem item) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(item);
    }
    
    @Override
    public List<PhaItem> listPhaItemByCat(Integer catId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItem.class);
        if (catId != 0) {
            criteria.add(Restrictions.eq("categoryId", catId));
        }
        return criteria.list();
    }
    
    @Override
    public PhaItem getPhaItemByName(String name) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItem.class);
        criteria.add(Restrictions.eq("itemName", name));
        return (PhaItem) criteria.uniqueResult();
    }
    
    @Override
    public PhaItem getPhaItemById(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItem.class);
        criteria.add(Restrictions.eq("itemId", id));
        return (PhaItem) criteria.uniqueResult();
    }
    
    @Override
    public void savePhaSupplier(PhaSupplier phaSupplier) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(phaSupplier);
    }
    
    @Override
    public List<PhaSupplier> listPhaSupplier() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSupplier.class);
        return criteria.list();
    }
    
    @Override
    public PhaSupplier getPhaSupById(Integer id, String name) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSupplier.class);
        if (id != null) {
            criteria.add(Restrictions.eq("supId", id));
        }
        if (name != null) {
            criteria.add(Restrictions.eq("supplierName", name));
        }
        return (PhaSupplier) criteria.uniqueResult();
    }
    
    @Transactional
    @Override
    public void savePhaPur(PhaPurInvoice invoice) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(invoice);
    }
    
    @Override
    public PhaPurInvoice getPhaPurById(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaPurInvoice.class);
        criteria.add(Restrictions.eq("phaInvId", id));
        return (PhaPurInvoice) criteria.uniqueResult();
        
    }
    
    @Override
    public void savePhaPurDet(PhaPurInvoiceDetails details) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(details);
    }
    
    @Override
    public List<PhaPurInvoiceDetails> listPhaPurDet(Integer invId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaPurInvoiceDetails.class);
        criteria.add(Restrictions.eq("phaInvId.phaInvId", invId));
        return criteria.list();
        
    }
    
    @Override
    public List<PhaPurInvoice> listPhaPurInvoiceDet() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaPurInvoice.class);
        return criteria.list();
    }
    
    @Override
    public void savePhaItemPrice(PhaItemPrice itemPrice) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(itemPrice);
    }
    
    @Override
    public List<PhaItemPrice> listPhaItemPrice() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItemPrice.class);
        criteria.add(Restrictions.gt("qty", new BigDecimal(0)));
        return criteria.list();
    }
    
    @Override
    public PhaItemPrice getPhaItemPriceById(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItemPrice.class);
        criteria.add(Restrictions.eq("id", id));
        return (PhaItemPrice) criteria.uniqueResult();
    }
    
    @Override
    public PhaItemPrice getPhaItemPriceByItemId(Integer itemId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItemPrice.class);
        criteria.add(Restrictions.eq("item.itemId", itemId));
        return (PhaItemPrice) criteria.uniqueResult();
    }
    
    @Override
    public List<PhaItemPrice> listPhaItemPriceByInvId(Integer invId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaItemPrice.class);
        criteria.add(Restrictions.eq("phaInvId.phaInvId", invId));
        return criteria.list();
    }
    
    @Override
    public void savePhaSale(PhaSale phaSale) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(phaSale);
    }
    
    @Override
    public void savePhaSaleVoided(PhaSaleVoided psv) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(psv);
    }
    
    @Override
    public void savePhaSaleColl(PhaSaleCollect collect) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(collect);
    }
    
    @Override
    public void savePhaSaleDet(PhaSaleDetails details) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(details);
    }
    
    @Override
    public List<PhaPatientSearch> listPhaPatientSearch(Integer status, String search) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaPatientSearch.class);
        if (status != null) {
            criteria.add(Restrictions.disjunction()
                    .add(Restrictions.like("identifier", "%" + search + "%"))
                    .add(Restrictions.like("phoneNo", "%" + search + "%"))
                    .add(Restrictions.like("givenName", "%" + search + "%"))
                    .add(Restrictions.like("familyName", "%" + search + "%"))
            );
        }
        return criteria.list();
    }
    
    @Override
    public PhaPatientSearch getPhaPatientSearchByPatientId(Integer patientId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaPatientSearch.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        return (PhaPatientSearch) criteria.uniqueResult();
    }
    
    @Override
    public PhaSale getPhaSaleById(Integer saleInvoiceId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSale.class);
        criteria.add(Restrictions.eq("saleInvoiceId", saleInvoiceId));
        return (PhaSale) criteria.uniqueResult();
    }
    
    @Override
    public List<PhaSaleDetails> listPhaSaleDetByInvId(Integer saleInvoiceId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSaleDetails.class);
        criteria.add(Restrictions.eq("phaSale.saleInvoiceId", saleInvoiceId));
        return criteria.list();
    }
    
    @Override
    public List<PhaSaleCollect> listPhaSaleCollByInvId(Integer saleInvoiceId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSaleCollect.class);
        criteria.add(Restrictions.eq("phaSale.saleInvoiceId", saleInvoiceId));
        return criteria.list();
    }
    
    @Override
    public List<PhaSaleCollect> listPhaSaleCollByUserId(Integer userId, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        
        hql = "from  PhaSaleCollect d where d.collectedDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND d.creator ='" + userId + "'  AND d.phaSale.voided=false";
        // order by d.billId

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<PhaSaleCollect> list = q.list();
        return list;
    }
    
    @Override
    public List<PhaSale> listPhaSale() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSale.class);
        criteria.add(Restrictions.eq("voided", Boolean.FALSE));
        return criteria.list();
    }
    
    @Override
    public PhaSaleDetails getPhaSaleDetById(Integer detId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PhaSaleDetails.class);
        criteria.add(Restrictions.eq("saleDetId", detId));
        return (PhaSaleDetails) criteria.uniqueResult();
    }
    
    @Override
    public void savePhaSaleRet(PhaSaleReturn phaSaleReturn) throws APIException {
        sessionFactory.getCurrentSession().saveOrUpdate(phaSaleReturn);
    }

    @Override
    public List<PhaSaleReturn> listPhaSaleReturnBySalInvId(Integer saleInvoiceId) throws DAOException {
        Criteria criteria=sessionFactory.getCurrentSession().createCriteria(PhaSaleReturn.class);
        criteria.add(Restrictions.eq("phaSale.saleInvoiceId", saleInvoiceId));
        return criteria.list();
    }
 
    
}
