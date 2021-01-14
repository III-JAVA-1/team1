package com.web.pet.mom.dao;

import com.web.pet.mom.model.PetMomOrderComment;

import java.util.List;

/**
 * @author i19
 */
public interface PetMomOrderCommentDAO {

    /**
     * 寫入訂單評論
     * @param petMomOrderComment
     */
    void insertOrderComment(PetMomOrderComment petMomOrderComment);

    /**
     * 查詢訂單評論
     * @param uId
     * @return
     */
    PetMomOrderComment searchOrderComment(int uId);

    /**
     * 更新訂單評論
     * @param petMomOrderComment
     * @return
     */
    int updateOrderComment(PetMomOrderComment petMomOrderComment);

    /**
     * 刪除訂單評論
     * @param petMomOrderComment
     * @return
     */
    int deleteOrderComment(PetMomOrderComment petMomOrderComment);
}
