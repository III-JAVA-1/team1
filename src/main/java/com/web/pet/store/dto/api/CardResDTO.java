package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post /store/getCard的卡片資料輸出格式
 */
@Data
public class CardResDTO {
    private int id;
    private String name;
    private int price;
    private String img;
    private Boolean isFavorite;
    private Boolean isDisplay;
}
