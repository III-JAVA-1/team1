package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * @author i19
 */
@DynamicInsert
@DynamicUpdate
@Setter
@Getter
@Entity
@Table(name = "MOM")
public class Mom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer momId;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String petContent;
    @Column(columnDefinition = "nvarchar(MAX)")
    private String notices;
    @Column(columnDefinition = "nvarchar(MAX)" ,nullable = false)
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
    private Set<PetMomOrder> orders = new LinkedHashSet<>(0);

    @OneToMany(mappedBy = "mom", cascade = CascadeType.ALL)
    private Set<PetMomOrderComment> petMomOrderComments = new LinkedHashSet<>(0);

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mom [momId=");
		builder.append(momId);
		builder.append(", petContent=");
		builder.append(petContent);
		builder.append(", notices=");
		builder.append(notices);
		builder.append(", title=");
		builder.append(title);
		builder.append(", experience=");
		builder.append(experience);
		builder.append(", proPrice1=");
		builder.append(proPrice1);
		builder.append(", proPrice2=");
		builder.append(proPrice2);
		builder.append(", proPrice3=");
		builder.append(proPrice3);
		builder.append(", bodyType1=");
		builder.append(bodyType1);
		builder.append(", bodyType2=");
		builder.append(bodyType2);
		builder.append(", bodyType3=");
		builder.append(bodyType3);
		builder.append(", bodyType4=");
		builder.append(bodyType4);
		builder.append(", pic=");
		builder.append(pic);
		builder.append("]");
		return builder.toString();
	}
    
    
    
}

