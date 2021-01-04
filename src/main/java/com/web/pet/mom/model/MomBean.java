package com.web.pet.mom.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.web.pet.member.model.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="MOM")
public class MomBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer momId;	
	@Column(columnDefinition = "nvarchar(MAX)")
	private String petContent;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String experience;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String notices;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String title;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String pic;	
	private Integer proPrice1;
	private Integer proPrice2;
	private Integer proPrice3;
	private Integer proPrice4;
	
	@Column(columnDefinition = "nvarchar(MAX)")
	private String bodyType1;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String bodyType2;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String bodyType3;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String bodyType4;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String bodyType5;
	
	
	@OneToOne(mappedBy = "mom",cascade = CascadeType.ALL)
	private Member member;
	
	
}

