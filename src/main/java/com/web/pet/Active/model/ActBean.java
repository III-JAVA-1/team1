package com.web.pet.Active.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
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
	
	public void addAttribute(String string, List<ActBean> list) {
		// TODO Auto-generated method stub
		
	}

	

	


}
