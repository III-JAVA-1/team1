package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class EditOrderStatusReqDTO {
    private Integer orderId;
    private Integer status;
}
