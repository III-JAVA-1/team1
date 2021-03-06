package com.web.pet.mom.service.Impl;

import com.web.pet.mom.Exeption.OrderIsSameMomException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.mom.model.req.PetMomOrderReq;
import com.web.pet.mom.service.PetMomOrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.rowset.serial.SerialBlob;
import javax.transaction.Transactional;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author i19
 */
@AllArgsConstructor
@Service
@Transactional(rollbackOn = Exception.class)
public class PetMomOrderServiceImpl implements PetMomOrderService {


    private final PetMomDAO petMomDAO;

    private final PetMomOrderDAO petMomOrderDAO;

    @Override
    public void insertPetMomOrder(MultipartFile picUser, PetMomOrderReq req, Integer momId, Integer uId) throws ParseException {

        if (!petMomDAO.getMomByMomId(momId).equals(petMomDAO.getMomByMemberId(uId))) {
            PetMomOrder petMomOrder = new PetMomOrder();

            petMomOrder.setOrderCreate(new Timestamp(System.currentTimeMillis()));
            petMomOrder.setStatus("處理中");
            petMomOrder.setPetName(req.getPetName());
            petMomOrder.setPetBreed(req.getPetBreed());
            petMomOrder.setPetGender(req.getPetGender());
            petMomOrder.setPetAge(req.getPetAge());
            petMomOrder.setPetType(req.getPetType());
            petMomOrder.setRemark(req.getRemark());
            petMomOrder.setCountry(req.getCountry());
            petMomOrder.setDistrict(req.getDistrict());
            petMomOrder.setAddress(req.getAddress());
            petMomOrder.setConnPhone(req.getConnPhone());

            if (picUser != null && !picUser.isEmpty()) {
                try {
                    byte[] b = picUser.getBytes();
                    Blob blob = new SerialBlob(b);
                    petMomOrder.setPicUser(blob);

                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
                }
            }

            String chooseStart = req.getChooseStart();
            petMomOrder.setChooseStart(new Timestamp(formatDate(chooseStart).getTime()));

            String chooseEnd = req.getChooseEnd();
            petMomOrder.setChooseEnd(new Timestamp(formatDate(chooseEnd).getTime()));

            String proPrice = req.getProPrice();

            int price = Integer.parseInt(proPrice.split(" ")[1]);
            petMomOrder.setService(proPrice);

            petMomOrder.setTotal(countTotal(price, formatDate(chooseStart), formatDate(chooseEnd)));

            petMomOrderDAO.insertPetMomOrder(petMomOrder, momId, uId);
        } else {
            throw new OrderIsSameMomException();
        }
    }

    private Date formatDate(String date) throws ParseException {
        date = date.replace("T", " ");
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        return formatter.parse(date);
    }

    /**
     * 計算訂單價錢
     *
     * @param price
     * @param timeStart
     * @param timeEnd
     * @return
     */
    private int countTotal(int price, Date timeStart, Date timeEnd) {
        long countTime = timeEnd.getTime() - timeStart.getTime();
        int hour = Math.round(countTime / (1000 * 60 * 60));
        return price * hour;
    }
}

