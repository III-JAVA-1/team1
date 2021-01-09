package com.web.pet.mom.service;

import com.web.pet.mom.model.req.PetMomOrderReq;

import java.text.ParseException;

/**
 * @author i19
 */
public interface PetMomOrderService {

    /**
     * 寫入訂單
     * @param req
     * @param momId
     * @param uId
     * @throws ParseException
     */
    void insertPetMomOrder(PetMomOrderReq req, Integer momId, Integer uId) throws ParseException;
}
