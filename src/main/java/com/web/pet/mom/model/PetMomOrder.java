package com.web.pet.mom.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * @author i19
 */
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
@Entity
@ToString
@Table(name = "PetMomOrder")
public class PetMomOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer listId;

    private Timestamp listCreate;

    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String status;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String petName;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String petBreed;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String petGender;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String petAge;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String petType;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String remark;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String country;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String district;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String address;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String connPhone;

    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String chooseStart;
    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String chooseEnd;

    @Column(columnDefinition = "nvarchar(MAX)", nullable = true)
    private String service;

    private Integer total;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "mom_Id", referencedColumnName = "mom_Id")
    private Mom mom;

    @OneToMany(mappedBy = "petMomOrder", cascade = CascadeType.ALL)
    private Set<OrderComment> orderComments = new LinkedHashSet<>(0);

}
