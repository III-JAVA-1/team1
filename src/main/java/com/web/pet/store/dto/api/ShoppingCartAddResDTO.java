package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post /shoppingCart/add的輸出格式
 */
@Data
public class ShoppingCartAddResDTO {
    // 預設失敗
    private boolean success = false;
}
