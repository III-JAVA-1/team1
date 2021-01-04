package com.web.pet.mom.service;

import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.PetMomOrder;
import com.web.pet.mom.model.PetMomOrderReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author i19
 */
@Service
@Transactional
public class PetMomOrderService {

    @Autowired
    PetMomOrderDAO petMomOrderDAO;

    public void insertPetMomOrder(PetMomOrderReq req, Integer mom_Id) throws ParseException {
        PetMomOrder petMomOrder = new PetMomOrder();

        petMomOrder.setListCreate(req.getListCreate());
        petMomOrder.setStatus(req.getStatus());
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
        String chooseStart = req.getChooseStart();
        petMomOrder.setChooseStart(chooseStart);
        String chooseEnd = req.getChooseEnd();
        petMomOrder.setChooseEnd(chooseEnd);
        String proPrice = req.getProPrice();
        Integer price = Integer.valueOf(proPrice.split(" ")[1]);
        petMomOrder.setService(proPrice);

        petMomOrder.setTotal(countTotal(price, formatDate(chooseStart), formatDate(chooseEnd)));

        petMomOrderDAO.insertPetMomOrder(petMomOrder, mom_Id);
    }

    private Date formatDate(String date) throws ParseException {
        date = date.replace("T", " ");
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        return formatter.parse(date);
    }

    private int countTotal(int price, Date timeStart, Date timeEnd) {
        long countTime = timeEnd.getTime() - timeStart.getTime();
        int hour = Math.round(countTime / (1000 * 60 * 60));
        return price * hour;
    }

}

