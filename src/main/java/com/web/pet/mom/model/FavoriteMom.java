package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
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
public class FavoriteMom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer favoriteId;
    
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "momId")
    private Mom mom;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "uId", referencedColumnName = "u_Id")
    private Member member;


}


