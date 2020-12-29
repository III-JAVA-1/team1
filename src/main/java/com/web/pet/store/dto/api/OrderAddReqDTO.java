package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class OrderAddReqDTO {
    private String id;
    private String address;
    private String remarks;
    private Integer payType;
}
