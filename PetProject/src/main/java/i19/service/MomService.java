package i19.service;

import i19.dao.PetMomDAO;
import i19.model.MomBean;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtils;

/**
 * @author i19
 */
public class MomService {
    SessionFactory factory = HibernateUtils.getSessionFactory();
    PetMomDAO dao = new PetMomDAO();

    public int save(MomBean mb){
        int result=0;
        Session session = factory.getCurrentSession();
        Transaction tran = null;
        try {
            tran=session.beginTransaction();
            result=dao.save(mb);

            tran.commit();

        } catch (Exception e) {
            // TODO: handle exception
            if(tran!=null) {
                tran.rollback();
            }
            e.printStackTrace();
        }
        return result;

    }
}
