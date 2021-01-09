package com.web.pet.mom.dao;

import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.MomData;

import java.util.List;

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
    Mom getMomByMemberId(int userId);

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
     * @return
     */
    List<MomData> getAllMomData(String country, String title);


    List<Mom> getAllMoms(String country, String title);


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
    List<Mom> getReservation(Integer momId);
}
