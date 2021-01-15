package com.web.pet.mom.Exeption;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class CommentIsSameOrderException extends RuntimeException{
    public CommentIsSameOrderException(){
        super("同一筆訂單不能評論兩次哦");
    }
}


