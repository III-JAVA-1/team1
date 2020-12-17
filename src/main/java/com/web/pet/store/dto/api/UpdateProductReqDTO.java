package com.web.pet.store.dto.api;

import com.web.pet.store.dto.table.ProductDTO;
import lombok.Data;

import java.util.List;

/** post /AddProduct/add的傳入格式 */
@Data
public class UpdateProductReqDTO {
    private int id;
    private String name;
    private String introduction;
    private int categoryId;
    private int animal;
    private int price;
    private String isDisplay;
    private List<String> imgList;

    /**
     * 轉換成DB product資料表的格式
     *
     * @return DB product資料表的格式
     */
    public ProductDTO toProductDTO() {
        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductId(id);
        productDTO.setProductName(name);
        productDTO.setIntroduction(introduction);
        productDTO.setCategoryId(categoryId);
        productDTO.setAnimal(animal);
        productDTO.setPrice(price);
        productDTO.setIsDisplay(isDisplay);

        return productDTO;
    }
}
