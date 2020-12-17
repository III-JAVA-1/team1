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
import lombok.NoArgsConstructor;

@Data
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
	private Timestamp updatedTime;
	@Column(name = "content", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String content;
	private Integer viewing;
	private Integer reply;	
	private Blob pic;
	private Integer isHide = 0;//	預設無違規不隱藏
	
	//	多對一，多的一方有外鍵
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="u_Id",referencedColumnName = "u_Id")
	//	外鍵:"u_Id"為Member主鍵u_Id
	private Member member;//mappedBy = "member"是參考這裡的
	
	//	一篇文章有多則留言，無外鍵
	@OneToMany(mappedBy = "article", fetch = FetchType.EAGER)
	private Set<Comment> comments = new LinkedHashSet<>(0);
	
	//	一篇文章有多個會員收藏，無外鍵
	@OneToMany(mappedBy = "article", fetch = FetchType.EAGER)
	private Set<ArticleLike> articleLikes = new LinkedHashSet<>(0);

	
}
