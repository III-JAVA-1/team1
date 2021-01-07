package com.web.pet.mom.Exeption;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class OrderIsSameMomException extends RuntimeException{
    OrderIsSameMomException(){
        super("自己無法預約自己哦");
    }
}


