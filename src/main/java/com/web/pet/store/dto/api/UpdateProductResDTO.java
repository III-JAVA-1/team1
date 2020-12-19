package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post /UpdateProduct/update的輸出格式
 */
@Data
public class UpdateProductResDTO {
    // 預設失敗
    private boolean success = false;
}
