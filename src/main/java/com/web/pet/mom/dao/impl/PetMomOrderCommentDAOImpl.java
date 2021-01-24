package com.web.pet.mom.dao.impl;


import com.web.pet.member.model.Member;
import com.web.pet.mom.dao.PetMomOrderCommentDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.mom.model.PetMomOrderComment;
import lombok.AllArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 * @author i19
 */
@AllArgsConstructor
@Repository
public class PetMomOrderCommentDAOImpl implements PetMomOrderCommentDAO {

    private final SessionFactory sessionFactory;

    @Override
    public void insertOrderComment(PetMomOrderComment petMomOrderComment, Integer uId, Integer momId, Integer orderId) { //新增評論

        Session session = sessionFactory.getCurrentSession();
        petMomOrderComment.setMom(session.get(Mom.class, momId));
        petMomOrderComment.setMember(session.get(Member.class, uId));
        petMomOrderComment.setPetMomOrder(session.get(PetMomOrder.class, orderId));
        session.save(petMomOrderComment);
    }

    @Override
    public PetMomOrderComment getCommentByOrderId(int orderId) {
        return sessionFactory.getCurrentSession().get(PetMomOrderComment.class, orderId);
    }


//    @Override
//    public List<OrderCommentReq> searchOrderComment(int uId) { //查詢評論
//
//        String hql = "FROM PetMomOrderComment WHERE momId = :uId";
//        Query query = sessionFactory.getCurrentSession().createQuery(hql).setParameter("momId", uId);
//        return query.getResultList();
//
//    }
//
//    @Override
//    public int updateOrderComment(PetMomOrderComment petMomOrderComment) {//修改評論
//        int count = 0;
//        Session session = sessionFactory.getCurrentSession();
//        session.update(petMomOrderComment);
//        count++;
//        return count;
//    }

    @Override
    public int deleteOrderComment(PetMomOrderComment petMomOrderComment) {//刪除評論
        int count = 0;
        Session session = sessionFactory.getCurrentSession();
        session.delete(petMomOrderComment);
        count++;
        return count;
    }
}
