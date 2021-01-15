package com.web.pet.mom.service;

import com.web.pet.mom.model.req.FavoriteMomReq;

/**
 * @author i19
 */
public interface FavoriteMomService {

    void insertFavoriteMom(FavoriteMomReq favorite, Integer uId, Integer momId);
}
