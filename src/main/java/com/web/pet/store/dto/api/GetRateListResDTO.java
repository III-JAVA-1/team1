package com.web.pet.store.dto.api;

import lombok.Data;

import java.util.List;

@Data
public class GetRateListResDTO {
    private List<RateResDTO> rateList;
    private String avgRate;
}
