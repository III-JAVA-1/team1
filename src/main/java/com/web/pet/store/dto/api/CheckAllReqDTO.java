package com.web.pet.store.dto.api;

import lombok.Data;

@Data
public class CheckAllReqDTO {
    private String customerId;
    private Boolean isCheck;
}
