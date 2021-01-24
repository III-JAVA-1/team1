package com.web.pet.mom.service;

import com.web.pet.mom.model.req.OrderCommentReq;

/**
 * @author i19
 */
public interface PetMomOrderCommentService {

    /**
     * 寫入評論資料
     *
     * @param req
     * @param momId
     * @param orderId
     * @param uId
     */
    void insertComment(OrderCommentReq req, Integer uId, Integer momId, Integer orderId);

    /**
     * uId查詢評論
     * @param uId
     * @return
     */
//    List<OrderCommentReq> searchComment(int uId);

    /**
     * 新增評論
     * @param petMomOrderComment
     * @return
     */
//    int updateOrderComment(PetMomOrderComment petMomOrderComment);

    /**
     * 修改評論
     * @param petMomOrderComment
     * @return
     */
//    int deleteOrderComment(PetMomOrderComment petMomOrderComment);
}
