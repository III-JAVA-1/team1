package com.web.pet.mom.service.Impl;

import com.web.pet.mom.Exeption.MomIsExistedException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.req.MomData;
import com.web.pet.mom.service.MomService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.rowset.serial.SerialBlob;
import javax.transaction.Transactional;
import java.sql.Blob;
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
    public void insertMom(MultipartFile myPic, Mom mom, Integer uId) {
        if (petMomDAO.getMomByMemberId(uId) == null) {
            mom.setMomId(uId);

            //上傳圖片
            if (myPic != null && !myPic.isEmpty()) {
                try {
                    byte[] b = myPic.getBytes();
                    Blob blob = new SerialBlob(b);
                    mom.setPic(blob);

                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
                }
            }
            petMomDAO.insertMom(mom, uId);
        } else {
            throw new MomIsExistedException();
        }
    }

    @Override
    public List<MomData> getAllMoms(String country, String title) {
        return petMomDAO.getAllMoms(country, title);
    }


    @Override
    public MomData getReservation(Integer momId) {
        return petMomDAO.getReservation(momId);
    }


    @Override
    public Mom showPic(Integer momId) {
        return petMomDAO.showPic(momId);
    }
}
