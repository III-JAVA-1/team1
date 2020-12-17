package com.web.pet.store.dto.api;

import lombok.Data;

@Data
// 後台跟前台要溝通的格式
public class ShoppingCardResDTO {
    private Integer shoppingCartId;
    private Integer productId;
    private Integer quantity;
    private String productName;
    private Integer price;
    private String img;
    private Boolean isCheck;
}
