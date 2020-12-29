package com.web.pet.mom.model;

import java.sql.Timestamp;

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

import com.web.pet.member.model.Member;

import lombok.Data;

@Data
@Entity
@Table(name = "RAING")
public class Raing {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer raingId;	
	
	private Timestamp commentNowTime;
	
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String comment;
	
	private Integer star;
	
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "mom_Id")
	private Mom Mom;
}
