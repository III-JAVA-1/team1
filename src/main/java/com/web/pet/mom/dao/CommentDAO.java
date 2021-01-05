package com.web.pet.mom.dao;


import com.web.pet.mom.model.OrderComment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * @author i19
 */
@Repository
public class CommentDAO {

    @Autowired
    SessionFactory sessionFactory;

    public void insertRaingDao(OrderComment raing) { //新增評論
        Session session = sessionFactory.getCurrentSession();
        session.save(raing);
    }


    public List<OrderComment> ajaxSearchRaing(int uId) { //查詢一筆評論
        List<OrderComment> list = new ArrayList<>();
        String hql = "FROM OrderComment WHERE mom_Id = :uId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setParameter("momId", uId);
        list = query.getResultList();
        return list;
    }

    public int updateRaing(OrderComment orderComment) {//修改評論
        int count = 0;
        Session session = sessionFactory.getCurrentSession();
        session.update(orderComment);
        count++;
        return count;
    }

    public int deleteRaing(OrderComment orderComment) {//刪除評論
        int count = 0;
        Session session = sessionFactory.getCurrentSession();
        session.delete(orderComment);
        count++;
        return count;
    }


}
