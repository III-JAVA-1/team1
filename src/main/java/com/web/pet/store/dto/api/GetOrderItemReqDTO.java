package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class GetOrderItemReqDTO {
    private Integer memberId;
    private Integer orderId;
}
