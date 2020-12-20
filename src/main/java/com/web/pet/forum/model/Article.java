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
	private Timestamp updatedTime;
	@Column(name = "content", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String content;
	private Integer viewing;
	private Integer reply;	
	private Blob pic;	
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Article [posterUid=");
		builder.append(posterUid);
		builder.append(", forumId=");
		builder.append(forumId);
		builder.append(", header=");
		builder.append(header);
		builder.append(", updatedTime=");
		builder.append(updatedTime);
		builder.append(", content=");
		builder.append(content);
		builder.append(", viewing=");
		builder.append(viewing);
		builder.append(", reply=");
		builder.append(reply);
		builder.append(", pic=");
		builder.append(pic);
		builder.append(", isHide=");
		builder.append(isHide);
//		builder.append(", member=");
//		builder.append(member);
//		builder.append(", comments=");
//		builder.append(comments);
//		builder.append(", articleLikes=");
//		builder.append(articleLikes);
		builder.append("]");
		return builder.toString();
	}

	
}
