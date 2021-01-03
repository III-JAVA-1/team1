package com.web.pet.mom.model;

import lombok.Data;

import javax.persistence.Column;
import java.sql.Timestamp;

@Data
/**
 * @author i19
 */
public class OrderCommentReq {

    private Integer userId;

    private Integer listId;

    private String comment;

}


