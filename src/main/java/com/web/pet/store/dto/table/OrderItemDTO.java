package com.web.pet.store.dto.table;

import lombok.Data;


/**
 * 資料庫orderItem表格欄位格式
 */
@Data
public class OrderItemDTO {
    private int orderItemId;
    private int orderId;
    private int productId;
    private int quantity;
}
