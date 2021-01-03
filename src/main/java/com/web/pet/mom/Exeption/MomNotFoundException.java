package com.web.pet.mom.Exeption;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class MomNotFoundException extends RuntimeException{

    public MomNotFoundException(){
        super("已註冊成為保母");
    }
}


