package com.web.pet.store.dto.api;

import com.web.pet.store.dto.table.FavoriteDTO;
import lombok.Data;

/**
 * post /AddProduct/add的傳入格式
 */
@Data
public class AddFavoriteReqDTO {

    private String customerId;
    private Integer productId;

    /**
     * 轉換成DB Favorite資料表的格式
     * @return DB Favorite資料表的格式
     */
    public FavoriteDTO toFavoriteDTO() {
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setCustomerId(customerId);
        favoriteDTO.setProductId(productId);

        return favoriteDTO;
    }
}
