package com.web.pet.mom.model;

import com.web.pet.member.model.Member;
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

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "uid", referencedColumnName = "u_id")
	private Member member;

    @OneToMany(mappedBy = "mom", cascade = CascadeType.ALL)
    private Set<PetMomOrder> orders = new LinkedHashSet<>(0);

    @OneToMany(mappedBy = "mom", cascade = CascadeType.ALL)
    private Set<PetMomOrderComment> petMomOrderComments = new LinkedHashSet<>(0);

	@Override
	public String toString() {
		return "Mom [momId=" +
				momId +
				", petContent=" +
				petContent +
				", notices=" +
				notices +
				", title=" +
				title +
				", experience=" +
				experience +
				", proPrice1=" +
				proPrice1 +
				", proPrice2=" +
				proPrice2 +
				", proPrice3=" +
				proPrice3 +
				", bodyType1=" +
				bodyType1 +
				", bodyType2=" +
				bodyType2 +
				", bodyType3=" +
				bodyType3 +
				", bodyType4=" +
				bodyType4 +
				", pic=" +
				pic +
				"]";
	}
    
    
    
}

