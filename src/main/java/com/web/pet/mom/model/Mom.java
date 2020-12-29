package com.web.pet.mom.model;

import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.web.pet.member.model.Member;

import lombok.Data;


@Data
@Entity
@Table(name="MOM")
public class Mom{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer momId;	
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
	
	@OneToOne(mappedBy = "mom",cascade = CascadeType.ALL)
	private PetMomOrder petMomOrder;
	
	@OneToOne(mappedBy = "mom",cascade = CascadeType.ALL)
	private Raing raing;

	
	
}

