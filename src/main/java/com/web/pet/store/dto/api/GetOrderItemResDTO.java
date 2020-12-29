package com.web.pet.store.dto.api;

import lombok.Data;

import java.util.List;

@Data
public class GetOrderItemResDTO {
    private List<RateDataResDTO> rateDataList;
}
