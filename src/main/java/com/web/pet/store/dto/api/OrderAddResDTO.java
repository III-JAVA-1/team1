package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class OrderAddResDTO {
    private Boolean success = false;
    private String orderId;
}
