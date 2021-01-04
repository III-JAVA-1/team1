package com.web.pet.mom.service;

import com.web.pet.mom.Exeption.MomIsExistedException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author i19
 */
@Service
@Transactional
public class MomService {

    private final PetMomDAO petMomDAO;

    @Autowired
    public MomService(PetMomDAO petMomDAO) {
        this.petMomDAO = petMomDAO;
    }

    /**
     * 寫入保母資料
     *
     * @param mom
     * @param u_Id
     */
    public void insertMom(Mom mom, Integer u_Id) {
        if (petMomDAO.getMomByMemberId(u_Id) == null) {
            petMomDAO.insertMom(mom, u_Id);
        } else {
            throw new MomIsExistedException();
        }
    }


    /**
     * 取得首頁資料
     *
     * @param country
     * @param title
     * @return
     */
    public List<Mom> getAllMoms(String country, String title) {
        return petMomDAO.getAllMoms(country, title);
    }

    /**
     * 取得預約資料
     *
     * @param mom_Id
     * @return
     */
    public List<Mom> getReservation(Integer mom_Id) {
        return petMomDAO.getReservation(mom_Id);
    }

    /**
     * 顯示圖片
     *
     * @param mom_Id
     * @return
     */
    public Mom showPic(Integer mom_Id) {
        return petMomDAO.showPic(mom_Id);
    }
}
