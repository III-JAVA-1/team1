package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author i19
 */
@Setter
@Getter
@Entity
@Table(name = "favoriteMom")
@IdClass(Favorite.class)
public class FavoriteMom {
    @Id
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "momId")
    private Mom mom;

    @Id
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "uId", referencedColumnName = "u_Id")
    private Member member;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        FavoriteMom that = (FavoriteMom) o;

        if (mom != null ? !mom.equals(that.mom) : that.mom != null) {
            return false;
        }
        return member != null ? member.equals(that.member) : that.member == null;
    }

    @Override
    public int hashCode() {
        int result = mom != null ? mom.hashCode() : 0;
        result = 31 * result + (member != null ? member.hashCode() : 0);
        return result;
    }

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
}


