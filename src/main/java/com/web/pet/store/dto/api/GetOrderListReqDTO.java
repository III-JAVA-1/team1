package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class GetOrderListReqDTO {
    private String orderId;
    private Integer orderStatus;
    private String startDate;
    private String endDate;
}
