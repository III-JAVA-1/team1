package com.web.pet.mom.dao.impl;

import com.web.pet.member.model.Member;
import com.web.pet.mom.dao.FavoriteMomDAO;
import com.web.pet.mom.model.FavoriteMom;
import com.web.pet.mom.model.Mom;
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
    public void insertFavoriteMom(FavoriteMom favoriteMom, Integer uId, Integer momId) {
        Session session = sessionFactory.getCurrentSession();
        if (getFavoriteMomByMomId(momId) != null) {
            String sqlDelete= "  DELETE FROM favoriteMom \n" +
                    "  WHERE uId = "+ uId + "\n" +
                    "  AND momId = " + momId;
            session.createNativeQuery(sqlDelete).executeUpdate();
        }else{
            favoriteMom.setMember(session.get(Member.class, uId));
            favoriteMom.setMom(session.get(Mom.class, momId));
            session.save(favoriteMom);
        }

    }

    @Override
    public FavoriteMom getFavoriteMomByMomId(Integer momId) {
        FavoriteMom favoriteMom = sessionFactory.getCurrentSession().get(FavoriteMom.class, momId);
        return favoriteMom;
    }

}


