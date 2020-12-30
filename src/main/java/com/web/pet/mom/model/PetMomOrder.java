package com.web.pet.mom.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.pet.member.model.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
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
@Table(name = "PetMomOrder")
public class PetMomOrder {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer listId;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String listCreate;
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
	
	private Timestamp chooseStart;
	private Timestamp chooseEnd;
	
	private Integer service;	
	
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "mom_Id",referencedColumnName = "mom_Id")
	private Mom mom;

}
