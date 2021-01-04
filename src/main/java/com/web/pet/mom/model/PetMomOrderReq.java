package com.web.pet.mom.model;

import lombok.*;

import java.sql.Timestamp;

/**
 * @author i19
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PetMomOrderReq {
    private Integer listId;

    private Timestamp listCreate;

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
}


