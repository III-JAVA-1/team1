package com.web.pet.mom.model.res;

import lombok.Data;

/**
 * @author i19
 */
@Data
public class FavoriteMomRes {

    boolean isFavorite;

    public FavoriteMomRes(boolean isFavorite) {
        this.isFavorite = isFavorite;
    }
}


