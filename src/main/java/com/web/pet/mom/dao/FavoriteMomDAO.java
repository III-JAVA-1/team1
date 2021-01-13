package com.web.pet.mom.dao;

/**
 * @author i19
 */
public interface FavoriteMomDAO {

    /**
     * 收藏保母
     * @param momId
     * @param uId
     */
    void insertFavoriteMom(int momId , int uId );

    /**
     * 取消收藏保母
     * @param momId
     * @param uId
     */
    void deleteFavoriteMom(int momId , int uId);

}


