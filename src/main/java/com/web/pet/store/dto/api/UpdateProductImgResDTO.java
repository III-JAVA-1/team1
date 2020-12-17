package com.web.pet.store.dto.api;

import lombok.Data;

import java.util.List;

/**
 * post /UpdateProductImg的輸出格式
 */
@Data
public class UpdateProductImgResDTO {
    private List<String> imgList;
}
