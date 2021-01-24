package com.web.pet.mom.Exeption;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @author i19
 */
@ResponseStatus(HttpStatus.BAD_REQUEST)
public class CommentIsSameMomException extends RuntimeException {
    public CommentIsSameMomException() {
        super("自己不能評價自己");
    }
}


