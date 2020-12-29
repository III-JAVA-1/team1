package com.web.pet.store.dto.api;

import lombok.Data;

/**
 * post /AddFavorite/add的輸出格式
 */
@Data
public class AddFavoriteResDTO {
    // 預設失敗
    private Boolean isFavorite = false;
}
