package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * @author i19
 */
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
@Entity
@Table(name = "PetMomOrder")
public class PetMomOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderId;

    @Column(columnDefinition = "smalldatetime",nullable = false)
    private Timestamp orderCreate;

    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String status;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String petName;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String petBreed;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String petGender;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String petAge;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String petType;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String remark;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String country;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String district;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String address;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = false)
    private String connPhone;

    @Column(nullable = false,columnDefinition = "smalldatetime")
    private Timestamp chooseStart;

    @Column(nullable = false ,columnDefinition = "smalldatetime")
    private Timestamp chooseEnd;

    @Column(columnDefinition = "nvarchar(MAX)")
    private String service;

    private Integer total;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "momId", referencedColumnName = "momId")
    private Mom mom;

    @OneToMany(mappedBy = "petMomOrder", cascade = CascadeType.ALL)
    private Set<PetMomOrderComment> petMomOrderComments = new HashSet<>(0);

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "uid", referencedColumnName = "u_id")
    private Member member;

}
