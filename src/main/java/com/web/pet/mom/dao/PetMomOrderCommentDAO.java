package com.web.pet.mom.dao;

import com.web.pet.mom.model.PetMomOrderComment;

/**
 * @author i19
 */
public interface PetMomOrderCommentDAO {

    /**
     * 寫入訂單評論
     *
     * @param petMomOrderComment
     * @param uId
     * @param momId
     * @param orderId
     */
    void insertOrderComment(PetMomOrderComment petMomOrderComment, Integer uId, Integer momId, Integer orderId);

    /**
     * 查詢orderId
     *
     * @param orderId
     * @return
     */
    PetMomOrderComment getCommentByOrderId(int orderId);
    /**
     * 查詢訂單評論
     * @param uId
     * @return
     */
//    List<OrderCommentReq> searchOrderComment(int uId);

    /**
     * 更新訂單評論
     * @param petMomOrderComment
     * @return
     */
//    int updateOrderComment(PetMomOrderComment petMomOrderComment);

    /**
     * 刪除訂單評論
     *
     * @param petMomOrderComment
     * @return
     */
    int deleteOrderComment(PetMomOrderComment petMomOrderComment);
}
