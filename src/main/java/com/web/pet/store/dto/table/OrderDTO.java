package com.web.pet.store.dto.table;

import lombok.Data;

import java.util.Date;


/**
 * 資料庫order表格欄位格式
 */
@Data
public class OrderDTO {
    private int orderId;
    private Date date;
    private String customerId;
    private int cost;
    private int orderStatus;
    private String address;
    private String remarks;
}
