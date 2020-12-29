package com.web.pet.store.dto.table;

import lombok.Data;


/**
 * 資料庫Favorite表格欄位格式
 */
@Data
public class FavoriteDTO {
    private String customerId;
    private int productId;
}
