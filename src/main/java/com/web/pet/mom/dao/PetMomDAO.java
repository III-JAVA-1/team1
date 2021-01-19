package com.web.pet.mom.dao;

import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.req.MomData;
import com.web.pet.mom.model.res.PageableMomDataRes;

/**
 * @author i19
 */
public interface PetMomDAO {

    /**
     * 新增保母
     * @param mom
     * @param uId
     */
    void insertMom(Mom mom, Integer uId);

    /**
     * 取得userId
     * @param userId
     * @return
     */
    Mom getMomByMemberId(int userId );

    /**
     * 取得momId
     * @param momId
     * @return
     */
    Mom getMomByMomId(int momId);

    /**
     * 由標題或城市查詢
     * @param country
     * @param title
     * @param currPage
     * @param pageSize
     * @return
     */
    PageableMomDataRes getAllMoms(String country, String title, Integer currPage, Integer pageSize);


    /**
     * 首頁秀圖片
     * @param momId
     * @return
     */
    Mom showPic(Integer momId);

    /**
     * 查詢訂單
     * @param momId
     * @return
     */
    MomData getReservation(Integer momId);
}
