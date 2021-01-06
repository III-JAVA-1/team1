package com.web.pet.mom.dao.impl;


import com.web.pet.mom.dao.PetMomOrderCommentDAO;
import com.web.pet.mom.model.PetMomOrderComment;
import lombok.AllArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author i19
 */
@AllArgsConstructor
@Repository
public class PetMomOrderCommentDAOImpl implements PetMomOrderCommentDAO{

    private final SessionFactory sessionFactory;

    @Override
    public void insertOrderComment(PetMomOrderComment petMomOrderComment) { //新增評論
        Session session = sessionFactory.getCurrentSession();
        session.save(petMomOrderComment);
    }


    @Override
    public List<PetMomOrderComment> searchOrderComment(int uId) { //查詢一筆評論

        String hql = "FROM PetMomOrderComment WHERE momId = :uId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setParameter("momId", uId);
        return query.getResultList();

    }

    @Override
    public int updateOrderComment(PetMomOrderComment petMomOrderComment) {//修改評論
        int count = 0;
        Session session = sessionFactory.getCurrentSession();
        session.update(petMomOrderComment);
        count++;
        return count;
    }

    @Override
    public int deleteOrderComment(PetMomOrderComment petMomOrderComment) {//刪除評論
        int count = 0;
        Session session = sessionFactory.getCurrentSession();
        session.delete(petMomOrderComment);
        count++;
        return count;
    }
}
