package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class GetRateListReqDTO {
    private String productId;
    private Integer rateCount;
}
