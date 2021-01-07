package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class OrderResDTO {
    private Integer orderId;
    private String name;
    private String productName;
    private String img;
    private Integer cost;
    private String date;
    private Integer orderStatus;
}
