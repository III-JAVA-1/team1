package com.web.pet.mom.model;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.pet.member.model.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
@Entity
@Table(name="MOM")
public class Mom{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mom_Id;	
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String petContent;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String notices;	
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String title;
	
	private Integer experience;
	private Integer proPrice1;
	private Integer proPrice2;
	private Integer proPrice3;
	
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType1;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType2;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType3;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType4;
	
	private Blob pic;	
	
	@OneToOne	
	@JoinColumn(name="u_Id",referencedColumnName = "u_Id")	
	private Member member;
	
	@OneToMany(mappedBy = "mom",cascade = CascadeType.ALL)
	private Set<PetMomOrder> orders = new LinkedHashSet<>(0);
	
//	@OneToMany(mappedBy = "mom",cascade = CascadeType.ALL)
//	private Set<Raing> raings = new LinkedHashSet<>(0);
	

	
	
}

