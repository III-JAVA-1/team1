package com.web.pet.mom.dao.impl;

import com.web.pet.member.model.Member;
import com.web.pet.mom.dao.FavoriteMomDAO;
import com.web.pet.mom.model.FavoriteMom;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.res.FavoriteMomRes;
import lombok.AllArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 * @author i19
 */
@AllArgsConstructor
@Repository
public class FavoriteMomDAOImpl implements FavoriteMomDAO {

    private final SessionFactory sessionFactory;

    @Override
    public FavoriteMomRes insertOrDeleteFavoriteMom(FavoriteMom favoriteMom, Integer uId, Integer momId) {
        Session session = sessionFactory.getCurrentSession();
        if (getFavoriteMomByMomId(momId, uId) != null) {
            String sqlDelete = "DELETE FROM favoriteMom \n" +
                    "  WHERE uId = " + uId + "\n" +
                    "  AND momId = " + momId;
            session.createNativeQuery(sqlDelete).executeUpdate();

            return new FavoriteMomRes(false);
        } else {
            favoriteMom.setMember(session.get(Member.class, uId));
            favoriteMom.setMom(session.get(Mom.class, momId));
            session.save(favoriteMom);

            return new FavoriteMomRes(true);
        }
    }

    @Override
    public FavoriteMomRes selFavoriteMom(Integer uId, Integer momId) {
        String sql = "SELECT momId \n" +
                "FROM favoriteMom\n" +
                "WHERE momId =" + momId +
                "AND uId = " + uId;
        Object o = sessionFactory.getCurrentSession().createNativeQuery(sql).uniqueResult();
        if (o != null) {
            return new FavoriteMomRes(false);
        } else {
            return new FavoriteMomRes(true);
        }
    }

    @Override
    public Object getFavoriteMomByMomId(Integer momId, Integer uId) {
        String sql = "SELECT momId \n" +
                "FROM favoriteMom\n" +
                "WHERE momId =" + momId +
                "AND uId = " + uId;
        return sessionFactory.getCurrentSession().createNativeQuery(sql).uniqueResult();
    }
}


