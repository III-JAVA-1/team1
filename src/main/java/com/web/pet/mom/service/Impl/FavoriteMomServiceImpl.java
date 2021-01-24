package com.web.pet.mom.service.Impl;

import com.web.pet.mom.Exeption.FavoriteSameMomException;
import com.web.pet.mom.dao.FavoriteMomDAO;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.FavoriteMom;
import com.web.pet.mom.model.req.FavoriteMomReq;
import com.web.pet.mom.model.res.FavoriteMomRes;
import com.web.pet.mom.service.FavoriteMomService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * @author i19
 */
@AllArgsConstructor
@Service
@Transactional(rollbackOn = Exception.class)
public class FavoriteMomServiceImpl implements FavoriteMomService {

    private final FavoriteMomDAO favoriteMomDAO;

    private final PetMomDAO petMomDAO;

    @Override
    public FavoriteMomRes insertOrDeleteFavoriteMom(FavoriteMomReq req, Integer uId, Integer momId) {

        if (!petMomDAO.getMomByMomId(momId).equals(petMomDAO.getMomByMemberId(uId))) {

            return favoriteMomDAO.insertOrDeleteFavoriteMom(new FavoriteMom(), uId, momId);
        } else {
            throw new FavoriteSameMomException();
        }
    }

    @Override
    public FavoriteMomRes selFavoriteMom(Integer uId, Integer momId) {
        return favoriteMomDAO.selFavoriteMom(uId, momId);
    }
}


