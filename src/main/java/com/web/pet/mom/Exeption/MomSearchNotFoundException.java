package com.web.pet.mom.Exeption;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class MomSearchNotFoundException extends RuntimeException {
    public MomSearchNotFoundException() {
        super("沒有你要找的保母哦");
    }
}


