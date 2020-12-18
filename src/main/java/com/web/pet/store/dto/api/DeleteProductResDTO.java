package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post /DeleteProductRes的輸出格式
 */
@Data
public class DeleteProductResDTO {
    // 預設失敗
    private boolean success = false;
}
