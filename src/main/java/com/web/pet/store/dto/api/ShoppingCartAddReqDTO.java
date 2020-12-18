package com.web.pet.store.dto.api;

import com.web.pet.store.dto.table.ShoppingCartDTO;
import lombok.Data;

/**
 * post /shoppingCart/add的傳入格式
 */
@Data
public class ShoppingCartAddReqDTO {
    private int productId;
    private int quantity;
    private String customerId;

    /**
     * 轉換成DB shoppingCart資料表的格式
     * @return DB shoppingCart資料表的格式
     */
    public ShoppingCartDTO toShoppingCartDTO() {
        ShoppingCartDTO shoppingCartDTO = new  ShoppingCartDTO();
        shoppingCartDTO.setProductId(productId);
        shoppingCartDTO.setQuantity(quantity);
        shoppingCartDTO.setCustomerId(customerId);

        return shoppingCartDTO;
    }
}
