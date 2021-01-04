package com.web.pet.store.dto.api;

import lombok.Data;

import java.util.List;

@Data
public class SendRateReqDTO {
    private Integer memberId;
    private List<RateDataResDTO> rateDataList;
}
