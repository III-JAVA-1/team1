package com.web.pet.store.dto.table;

import lombok.Data;

// 掛@Data就是自動產好get跟set
@Data
public class ProductCategoryDTO {

    private int id;

    private String name;

}
