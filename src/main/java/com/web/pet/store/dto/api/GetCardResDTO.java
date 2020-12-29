package com.web.pet.store.dto.api;

import lombok.Data;

import java.util.List;

/**
 * post /store/getCard的輸出格式
 */
@Data
public class GetCardResDTO {
    private List<CardResDTO> cardList;
    private Integer totalPages;
}
