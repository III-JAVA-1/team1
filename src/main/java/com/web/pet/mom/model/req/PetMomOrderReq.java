package com.web.pet.mom.model.req;

import lombok.Data;

import java.sql.Timestamp;

@Data
/**
 * @author i19
 */
public class PetMomOrderReq {
    private Integer orderId;

    private Timestamp orderCreate;

    private String status;
    private String petName;
    private String petBreed;
    private String petGender;
    private String petAge;
    private String petType;
    private String remark;
    private String country;

    private String district;

    private String address;

    private String connPhone;

    private String chooseStart;

    private String chooseEnd;

    private String proPrice;

    private String total;

    private Integer momId;

    private Integer uId;
}


