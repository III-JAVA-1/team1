package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post store/getCard的傳入格式
 */
@Data
public class GetCardReqDTO {
    private Integer category;
    private Integer animal;
    private Integer sort = 0; //排序
    private String name;
    private String memberId;
    private Integer pages;
}
