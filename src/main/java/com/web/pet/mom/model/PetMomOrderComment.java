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

@DynamicInsert
@DynamicUpdate
@Data
@Entity
@Table(name = "PetMomOrderComment")
public class PetMomOrderComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer commentId;

    @Column(nullable = false)
    private Timestamp commentNowTime;

    @Column(columnDefinition = "nvarchar(MAX)")
    private String comment;

    @Column(nullable = false)
    private Integer star;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "momId", referencedColumnName = "momId")
    private Mom mom;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "orderId", referencedColumnName = "orderId")
    private PetMomOrder petMomOrder;
}
