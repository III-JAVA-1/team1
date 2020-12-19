package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class RateResDTO {
    private String name;
    private String date;
    private Integer rateCount;
    private String message;
}
