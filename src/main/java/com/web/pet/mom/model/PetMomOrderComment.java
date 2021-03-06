package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author i19
 */

@DynamicInsert
@DynamicUpdate
@Setter
@Getter
@Entity
@Table(name = "PetMomOrderComment")
public class PetMomOrderComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer commentId;

    @Column(nullable = false, columnDefinition = "smalldatetime")
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

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "uId", referencedColumnName = "u_Id")
    private Member member;
}
