package com.web.pet.member.model;

import com.web.pet.Active.model.ActBean;
import com.web.pet.Active.model.JoinActBean;
import com.web.pet.forum.model.Article;
import com.web.pet.forum.model.ArticleFavorite;
import com.web.pet.forum.model.Comment;
import com.web.pet.mom.model.Mom;
import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;


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
    @Column(nullable = true)
    private String password;
    @Column(nullable = true)
    private String phone;
    @Column(nullable = true)
    private String email;
    @Column(nullable = true)
    private Date birth;
    @Column(nullable = true)
    private String sname;
    @Column(nullable = true)
    private Integer authority;
    @Column(nullable = true)
    private String zip;
    @Column(name = "country", columnDefinition = "nvarchar(MAX)", nullable = true)
    private String country;
    @Column(name = "district", columnDefinition = "nvarchar(MAX)", nullable = true)
    private String district;
    @Column(name = "address", columnDefinition = "nvarchar(MAX)", nullable = true)
    private String address;
    @Column(nullable = true)
    private Blob img;

    @OneToOne(mappedBy = "member",fetch = FetchType.LAZY)
    private Mom mom;

    @OneToMany(mappedBy = "member",fetch = FetchType.LAZY)
    private Set<ActBean> actBean = new LinkedHashSet<>(0);

    @OneToMany(mappedBy = "member",fetch = FetchType.LAZY)
    private Set<JoinActBean> joinActBeans = new LinkedHashSet<>(0);

    //============================================================
    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<Article> articles = new LinkedHashSet<>(0);

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<Comment> comments = new LinkedHashSet<>(0);

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<ArticleFavorite> articleFavorites = new LinkedHashSet<>(0);
    //=============================================================


}
	