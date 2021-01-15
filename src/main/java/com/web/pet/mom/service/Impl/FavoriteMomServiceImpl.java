package com.web.pet.mom.service.Impl;

import com.web.pet.mom.Exeption.FavoriteSameMomException;
import com.web.pet.mom.dao.FavoriteMomDAO;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.FavoriteMom;
import com.web.pet.mom.model.req.FavoriteMomReq;
import com.web.pet.mom.service.FavoriteMomService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author i19
 */
@AllArgsConstructor
@Service
public class FavoriteMomServiceImpl implements FavoriteMomService {

    private final FavoriteMomDAO favoriteMomDAO;

    private final PetMomDAO petMomDAO;

    @Override
    public void insertFavoriteMom(FavoriteMomReq req, Integer uId, Integer momId) {

        if (!petMomDAO.getMomByMomId(momId).equals(petMomDAO.getMomByMemberId(uId))) {
            FavoriteMom favoriteMom = new FavoriteMom();

            favoriteMomDAO.insertFavoriteMom(favoriteMom , uId , momId);
        }else {
            throw new FavoriteSameMomException();
        }
    }
}


