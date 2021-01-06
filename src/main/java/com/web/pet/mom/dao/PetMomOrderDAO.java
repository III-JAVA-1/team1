package com.web.pet.mom.dao;

import com.web.pet.mom.model.PetMomOrder;

/**
 * @author i19
 */
public interface PetMomOrderDAO {

    /**
     * 新增訂單
     * @param petMomOrder
     * @param momId
     */
    void insertPetMomOrder(PetMomOrder petMomOrder, Integer momId);

    /**
     * 查詢orderId
     * @param orderId
     * @return
     */
    PetMomOrder getOrderById(int orderId);
}
