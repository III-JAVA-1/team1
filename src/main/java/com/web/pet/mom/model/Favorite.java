package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
import lombok.Data;

import java.io.Serializable;

/**
 * @author i19
 */
@Data
public class Favorite implements Serializable {
    private Member member;
    private Mom mom;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Favorite favorite = (Favorite) o;

        if (member != null ? !member.equals(favorite.member) : favorite.member != null) {
            return false;
        }
        return mom != null ? mom.equals(favorite.mom) : favorite.mom == null;
    }

    @Override
    public int hashCode() {
        int result = member != null ? member.hashCode() : 0;
        result = 31 * result + (mom != null ? mom.hashCode() : 0);
        return result;
    }
}


