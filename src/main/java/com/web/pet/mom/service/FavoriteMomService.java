package com.web.pet.mom.service;

import com.web.pet.mom.model.req.FavoriteMomReq;
import com.web.pet.mom.model.res.FavoriteMomRes;

/**
 * @author i19
 */
public interface FavoriteMomService {

    FavoriteMomRes insertOrDeleteFavoriteMom(FavoriteMomReq favorite, Integer uId, Integer momId);

    FavoriteMomRes selFavoriteMom(Integer uId, Integer momId);
}
