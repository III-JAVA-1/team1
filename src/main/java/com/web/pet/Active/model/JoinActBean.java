package com.web.pet.Active.model;

import java.sql.Date;
import java.util.HashSet;
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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "JoinAct")
public class JoinActBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer jid;
	
//	private Integer act_no;
//	private Integer u_id;
	
	@Column(name = "act_name", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String act_name;
	
	@Column(name = "name", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String name;
	
	@Column(name = "email", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String email;
	
	@Column(name = "country", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String country;
	
	@Column(name = "district", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String district;
	
	@Column(name = "address", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String address;

	@Column(name = "extra", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String extra;
	
	@Column(name = "pettype", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String pettype;
	
	private Integer petnum;
	
	@Column(name = "join_actnow", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String join_actnow;

//	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
//	@JoinColumn(name="u_Id",referencedColumnName = "u_id")
//	private Set<Member> members = new LinkedHashSet<>();
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="u_Id")
	private Member member ;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="act_no")
	private ActBean actBean;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JoinActBean [jid=");
		builder.append(jid);
		builder.append(", act_name=");
		builder.append(act_name);
		builder.append(", name=");
		builder.append(name);
		builder.append(", email=");
		builder.append(email);
		builder.append(", country=");
		builder.append(country);
		builder.append(", district=");
		builder.append(district);
		builder.append(", address=");
		builder.append(address);
		builder.append(", extra=");
		builder.append(extra);
		builder.append(", pettype=");
		builder.append(pettype);
		builder.append(", petnum=");
		builder.append(petnum);
		builder.append(", join_actnow=");
		builder.append(join_actnow);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
	
	

}
