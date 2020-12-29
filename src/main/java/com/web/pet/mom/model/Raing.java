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

import com.web.pet.forum.model.ArticleFavorite;
import com.web.pet.forum.model.Comment;
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
	@JoinColumn(name = "mom_Id", referencedColumnName = "mom_Id")
	private Mom mom;
}
