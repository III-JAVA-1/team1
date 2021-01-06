package com.web.pet.mom.service;

import com.web.pet.mom.model.Mom;

import java.util.List;

/**
 * @author i19
 */
public interface MomService {

    /**
     * 寫入保母資料
     * @param mom
     * @param uId
     */
    void insertMom(Mom mom, Integer uId);


    /**
     * 取得首頁資料
     * @param country
     * @param title
     * @return
     */
    List<Mom> getAllMoms(String country, String title);


    /**
     * 取得預約資料
     * @param momId
     * @return
     */
    List<Mom> getReservation(Integer momId);

    /**
     * 顯示圖片
     * @param momId
     * @return
     */
    Mom showPic(Integer momId);
}
