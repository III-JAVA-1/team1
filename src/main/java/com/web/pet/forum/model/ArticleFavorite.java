package com.web.pet.forum.model;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
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
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "ArticleFavorite")
public class ArticleFavorite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer favoriteId;
	
//	多對一，多的一方有外鍵
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="u_Id",referencedColumnName = "u_Id")
	//	外鍵:"u_Id"為Member主鍵u_Id
	private Member member;//mappedBy = "member"是參考這裡的

	
//	一個收藏對一篇文章，有外鍵
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="posterUid",referencedColumnName = "posterUid")
	private Article article;
	
	
}
