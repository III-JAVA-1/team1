package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

/**
 * @author i19
 */
@DynamicInsert
@DynamicUpdate
@Setter
@Getter
@Entity
@Table(name = "Mom")
public class Mom {
    @Id
    private Integer momId;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String petContent;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String notices;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String title;
    @Column(nullable = false)
    private Integer experience;

    private Integer proPrice1;

    private Integer proPrice2;

    private Integer proPrice3;

    @Column(columnDefinition = "nvarchar(MAX)")
    private String bodyType1;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String bodyType2;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String bodyType3;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String bodyType4;

    private Blob pic;

    @OneToOne
    @JoinColumn(name = "uId", referencedColumnName = "u_Id")
    private Member member;

    @OneToMany(mappedBy = "mom", cascade = CascadeType.ALL)
    private Set<PetMomOrder> orders = new HashSet<>(0);

    @OneToMany(mappedBy = "mom", cascade = CascadeType.ALL)
    private Set<PetMomOrderComment> petMomOrderComments = new HashSet<>(0);

}

