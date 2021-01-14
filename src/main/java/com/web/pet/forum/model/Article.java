package com.web.pet.forum.model;


import java.sql.Blob;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import com.web.pet.member.model.Member;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "Article")
public class Article {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer posterUid;
	@Column(name = "forumId", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String forumId;
	@Column(name = "header", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String header;
	@Column(name = "updatedTime", nullable = false)
	private Timestamp updatedTime;
	@Column(name = "content", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String content;
	@Column(name = "viewing", nullable = false)
	private Integer viewing = 0;
	@Column(name = "reply", nullable = false)
	private Integer reply = 0;	
	//private Blob pic;
	@Column(name = "isHide",nullable = false)
	private Integer isHide = 0;//	預設無違規不隱藏
	
	//	多對一，多的一方有外鍵
	@ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
	@JoinColumn(name="u_Id",referencedColumnName = "u_Id")
	//	外鍵:"u_Id"為Member主鍵u_Id
	private Member member;//mappedBy = "member"是參考這裡的
	
	//	一篇文章有多則留言，無外鍵
	@OneToMany(mappedBy = "article", fetch = FetchType.LAZY)
	private Set<Comment> comments = new LinkedHashSet<>(0);
	
	//	一篇文章有多個會員收藏，無外鍵
	@OneToMany(mappedBy = "article", fetch = FetchType.LAZY)
	private Set<ArticleFavorite> articleFavorites = new LinkedHashSet<>(0);

		
}
