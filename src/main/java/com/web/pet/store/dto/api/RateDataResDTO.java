package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class RateDataResDTO {
    private Integer orderItemId;
    private Integer productId;
    private String productName;
    private String img;
    private Integer rate;
    private String message;
}
