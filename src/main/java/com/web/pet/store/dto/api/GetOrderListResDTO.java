package com.web.pet.store.dto.api;

import lombok.Data;

import java.util.List;

@Data
public class GetOrderListResDTO {
    private List<OrderResDTO> orderList;
}
