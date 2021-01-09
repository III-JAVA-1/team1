package com.web.pet.mom.service.Impl;

import com.web.pet.mom.Exeption.MomIsExistedException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.MomData;
import com.web.pet.mom.service.MomService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author i19
 */
@AllArgsConstructor
@Service
@Transactional(rollbackOn = Exception.class)
public class MomServiceImpl implements MomService {

    private final PetMomDAO petMomDAO;

    @Override
    public void insertMom(Mom mom, Integer uId) {
        mom.setMomId(uId);
        if (petMomDAO.getMomByMomId(uId) == null) {
            petMomDAO.insertMom(mom, uId);
        } else {
            throw new MomIsExistedException();
        }
    }

    @Override
    public List<MomData> getAllMomData(String country, String title) {
        return petMomDAO.getAllMomData(country, title);
    }

    @Override
    public List<Mom> getAllMoms(String country, String title) {
        return petMomDAO.getAllMoms(country, title);
    }


    @Override
    public List<Mom> getReservation(Integer momId) {
        return petMomDAO.getReservation(momId);
    }


    @Override
    public Mom showPic(Integer momId) {
        return petMomDAO.showPic(momId);
    }
}
