package com.web.pet.store.dto.table;

import lombok.Data;

import java.util.Date;


/**
 * 資料庫order表格欄位格式
 */
@Data
public class OrderDTO {
    private Integer orderId;
    private Date date;
    private String customerId;
    private Integer cost;
    private Integer orderStatus;
    private String address;
    private String remarks;
    private Integer ecpNo;
}
