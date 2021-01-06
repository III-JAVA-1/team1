package com.web.pet.mom.dao.impl;

import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.PetMomOrder;
import lombok.AllArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author i19
 */
@AllArgsConstructor
@Repository
public class PetMomOrderDAOImpl implements PetMomOrderDAO {

    private final SessionFactory sessionFactory;

    /**
     * 寫入預約保母資料
     *
     * @param petMomOrder
     * @param momId
     */
    @Override
    public void insertPetMomOrder(PetMomOrder petMomOrder, Integer momId) {
        Session session = sessionFactory.getCurrentSession();
        petMomOrder.setMom(session.get(Mom.class, momId));
        session.save(petMomOrder);
    }

    @Override
    public PetMomOrder getOrderById(int orderId){
        return sessionFactory.getCurrentSession().get(PetMomOrder.class, orderId);
    }
}

