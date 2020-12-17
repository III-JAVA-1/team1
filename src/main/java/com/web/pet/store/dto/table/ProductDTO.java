package com.web.pet.store.dto.table;

import lombok.Data;

import java.util.Date;

/**
 * 資料庫order表格欄位格式
 */
@Data
public class ProductDTO {
    private int productId;
    private String productName;
    private String introduction;
    private int categoryId;
    private int animal;
    private Date createDate = new Date();
    private String isDisplay;
    private int price;
}
