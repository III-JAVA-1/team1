package com.web.pet.mom.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/**
 * @author i19
 */
@Setter
@Getter
@Entity
@Table(name = "favoriteMom")
public class Favorite {
    @Id
    private Integer uId;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="momId")
    private Mom mom;
}


