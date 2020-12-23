package com.web.pet.Active.model;

import java.sql.Date;
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
@Table(name = "Active2")
public class ActBean {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer act_no;
	@Column(name = "act_name", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String act_name;
	private Date starttime;
	private Date endtime;
	@Column(name = "act_content", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String act_content;
	@Column(name = "act_organize", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String act_organize;
	@Column(name = "act_orgman", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String act_orgman;
	private String act_orgphone;
	@Column(name = "act_type", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String act_type;
	private Timestamp NewActNow;	
	@Column(name = "act_where", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String act_where;
	private Integer viableNumber;
	
	@ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.LAZY)
	@JoinColumn(name="u_Id",referencedColumnName = "u_Id")
	private Member member;
	
	@OneToMany(mappedBy = "actBean",fetch = FetchType.LAZY)	
	private Set<JoinActBean> joinActBeans = new LinkedHashSet<>(0);

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ActBean [act_no=");
		builder.append(act_no);
		builder.append(", act_name=");
		builder.append(act_name);
		builder.append(", starttime=");
		builder.append(starttime);
		builder.append(", endtime=");
		builder.append(endtime);
		builder.append(", act_content=");
		builder.append(act_content);
		builder.append(", act_organize=");
		builder.append(act_organize);
		builder.append(", act_orgman=");
		builder.append(act_orgman);
		builder.append(", act_orgphone=");
		builder.append(act_orgphone);
		builder.append(", act_type=");
		builder.append(act_type);
		builder.append(", NewActNow=");
		builder.append(NewActNow);
		builder.append(", viableNumber=");
		builder.append(viableNumber);
		builder.append("]");
		return builder.toString();
	}

	

	







	
}
