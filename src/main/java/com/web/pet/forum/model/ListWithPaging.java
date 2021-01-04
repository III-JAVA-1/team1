package com.web.pet.forum.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

//為了傳遞List集合與totalPages到Ajax
@Getter
@Setter
public class ListWithPaging {
	
	private List<Object> articleList;
	private Integer totalPages;
    private Integer totalCounts;
}
