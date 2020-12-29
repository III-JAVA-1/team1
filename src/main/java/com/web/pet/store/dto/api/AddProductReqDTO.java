package com.web.pet.store.dto.api;

import com.web.pet.store.dto.table.ProductDTO;
import lombok.Data;

import java.util.List;

/**
 * post /AddProduct/add的傳入格式
 */
@Data
public class AddProductReqDTO {
    private String name;
    private String introduction;
    private Integer categoryId;
    private Integer animal;
    private Integer price;
    private String isDisplay;
    private List<String> imgList;
    private Integer stock;

    /**
     * 轉換成DB product資料表的格式
     * @return DB product資料表的格式
     */
    public ProductDTO toProductDTO() {
        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductName(name);
        productDTO.setIntroduction(introduction);
        productDTO.setCategoryId(categoryId);
        productDTO.setAnimal(animal);
        productDTO.setPrice(price);
        productDTO.setIsDisplay(isDisplay);
        productDTO.setStock(stock);

        return productDTO;
    }
}
