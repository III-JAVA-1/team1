package com.web.pet.store.dto.table;

import lombok.Data;

import java.util.Date;

/**
 * 資料庫order表格欄位格式
 */
@Data
public class RateDTO {
    private int customerId;
    private int orderItemId;
    private int productId;
    private int rate;
    private String message;
    private Date date;
}
