package com.web.pet.mom.model.req;

import lombok.Data;

import javax.persistence.Column;
import java.sql.Timestamp;

@Data
/**
 * @author i19
 */
public class OrderCommentReq {

    private Integer userId;

    private Integer orderId;

    private String comment;

}


