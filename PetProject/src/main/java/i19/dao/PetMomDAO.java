package i19.dao;

import i19.model.MomBean;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtils;

/**
 * @author i19
 */
public class PetMomDAO {
    SessionFactory factory = HibernateUtils.getSessionFactory();

    public int save(MomBean mb ,int userId) {
        int count=0;
        Session session = factory.getCurrentSession();
        session.save(mb);
        session.save(userId);
        count++;
        return count;
    }
}
