package com.web.pet.mom.Exeption;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class MomIsExistedException extends RuntimeException{

    public MomIsExistedException(){
        super("已註冊成為保母");
    }
}


