package com.web.pet.petshop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
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
@Table(name="Petshop")
public class PetshopBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "name", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String name;
	@Column(name = "address", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String address;
	private String phone;
	@Column(name = "type", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String type;
	@Column(name = "pet", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String pet;
	private String image;
	
	
}
