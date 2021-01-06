package com.web.pet.mom.service;

import com.web.pet.mom.model.PetMomOrderComment;
import com.web.pet.mom.model.req.OrderCommentReq;

import java.util.List;

/**
 * @author i19
 */
public interface PetMomOrderCommentService {

    /**
     * 寫入評論資料
     * @param req
     */
    void insertComment(OrderCommentReq req);

    /**
     * uId查詢評論
     * @param uId
     * @return
     */
    List<PetMomOrderComment> searchComment(int uId);

    /**
     * 新增評論
     * @param petMomOrderComment
     * @return
     */
    int updateOrderComment(PetMomOrderComment petMomOrderComment);

    /**
     * 修改評論
     * @param petMomOrderComment
     * @return
     */
    int deleteOrderComment(PetMomOrderComment petMomOrderComment);
}
