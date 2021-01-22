package com.web.pet.mom.dao;

import com.web.pet.mom.model.FavoriteMom;
import com.web.pet.mom.model.req.FavoriteMomReq;

/**
 * @author i19
 */
public interface FavoriteMomDAO {

    /**
     * 收藏保母
     * @param favoriteMom
     * @param uId
     * @param momId
     */
    void insertFavoriteMom(FavoriteMom favoriteMom , Integer uId , Integer momId);

//    /**
//     * 取消收藏保母
//     * @param req
//     */
//    void deleteFavoriteMom(FavoriteMomReq req);

    /**
     * 查詢favorite表裡momId
     * @param momId
     * @return
     */
    FavoriteMom getFavoriteMomByMomId(Integer momId);

}


