package com.web.pet.forum.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;


/**
 *  Class Name: ListWithPaging.java
 *  Description: 為了傳遞List集合與totalPages到Ajax
 *  @author ching  DateTime 2021/1/14 下午 01:26:04 
 *  @company 
 *  @email public192021@gmail.com
 *  @version 1.0
 */
@Getter
@Setter
public class ListWithPaging {
	
	private List<Object> articleList;
	private Integer totalPages;
    private Integer totalCounts;  
}
