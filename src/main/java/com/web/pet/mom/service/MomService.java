package com.web.pet.mom.service;

import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.res.MomDataRes;
import com.web.pet.mom.model.res.PageableMomDataRes;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author i19
 */
public interface MomService {

    /**
     * 寫入保母資料
     *
     * @param myPic
     * @param mom
     * @param uId
     */
    void insertMom(MultipartFile myPic, Mom mom, Integer uId);


    /**
     * 取得首頁資料
     *
     * @param country
     * @param title
     * @param currPage
     * @param pageSize
     * @return
     */
    PageableMomDataRes getAllMoms(String country, String title, Integer currPage, Integer pageSize);


    /**
     * 取得預約資料
     *
     * @param momId
     * @return
     */
    MomDataRes getReservation(Integer momId);

    /**
     * 取得保母評論
     * @param momId
     * @return
    //     */
//    List<MomData> getCommentData(Integer momId);

    /**
     * 顯示圖片
     *
     * @param momId
     * @return
     */
    Mom showPic(Integer momId);
}
