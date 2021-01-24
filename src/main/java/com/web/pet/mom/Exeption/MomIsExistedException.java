package com.web.pet.mom.Exeption;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * BAD_REQUEST 是400
 *
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class MomIsExistedException extends RuntimeException {

    public MomIsExistedException() {
        super("你已經註冊為保母啦");
    }
}


