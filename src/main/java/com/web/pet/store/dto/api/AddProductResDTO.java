package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post /AddProduct/add的輸出格式
 */
@Data
public class AddProductResDTO {
    // 預設失敗
    private boolean success = false;
}
