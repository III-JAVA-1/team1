package com.web.pet.member.model;


import java.sql.Blob;
import java.sql.Date;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.ArticleLike;
import com.web.pet.forum.model.Comment;
import com.web.pet.mom.model.Mom;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name="Member")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer u_Id;
	@Column(name = "name", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String name;
	@Column(name = "gender", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String gender;
	private String password;
	private String id;
	private String phone;
	private String email;
	private Date birth;
	@Column(name = "sname", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String sname;
	private String zip;
	@Column(name = "country", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String country;
	@Column(name = "district", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String district;
	@Column(name = "address", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String address;
	private Blob img;

	@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "momId",referencedColumnName = "momId")
	private Mom mom;
	
	//============================================================
	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
	private Set<Article> articles = new LinkedHashSet<>(0);
	
	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
	private Set<Comment> comments = new LinkedHashSet<>(0);
	
	@OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
	private Set<ArticleLike> articleLikes = new LinkedHashSet<>(0);
	//=============================================================

}
	