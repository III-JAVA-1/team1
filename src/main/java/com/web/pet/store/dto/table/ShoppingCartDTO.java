package com.web.pet.store.dto.table;

import lombok.Data;

/**
 * 資料庫shopping_cart表格欄位格式
 */
@Data
public class ShoppingCartDTO {
    private int shoppingCartId;
    private int productId;
    private String customerId;
    private int quantity;
}
