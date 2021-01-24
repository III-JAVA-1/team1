package com.web.pet.mom.dao;

import com.web.pet.mom.model.FavoriteMom;
import com.web.pet.mom.model.res.FavoriteMomRes;

/**
 * @author i19
 */
public interface FavoriteMomDAO {

    /**
     * 收藏保母
     *
     * @param favoriteMom
     * @param uId
     * @param momId
     */
    FavoriteMomRes insertOrDeleteFavoriteMom(FavoriteMom favoriteMom, Integer uId, Integer momId);

    FavoriteMomRes selFavoriteMom(Integer uId, Integer momId);
//    /**
//     * 取消收藏保母
//     * @param req
//     */
//    void deleteFavoriteMom(FavoriteMomReq req);

    /**
     * 查詢favorite表裡momId
     *
     * @param momId
     * @return
     */
    Object getFavoriteMomByMomId(Integer momId, Integer uId);
}


