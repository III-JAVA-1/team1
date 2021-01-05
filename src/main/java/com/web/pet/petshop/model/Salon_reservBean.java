package com.web.pet.petshop.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="Salon_reserv")
public class Salon_reservBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String storename;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String  name;
	private String phone;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String address;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String type;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String item;
	@Column(columnDefinition = "smalldatetime", nullable = true)
	private Timestamp date;
	@Column(columnDefinition = "nvarchar(300)", nullable = true)
	private String other;
	@Column(columnDefinition = "smalldatetime", nullable = true)
	private Timestamp thistime;
	
	
	//多對一，多的一方有外鍵
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_id",referencedColumnName = "u_Id")
	//外鍵:"U_Id"為MemberBean01主鍵
	private Member member;//mappedBy = "memberBean01"是參考這裡的


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Salon_reservBean [id=");
		builder.append(id);
		builder.append(", storename=");
		builder.append(storename);
		builder.append(", name=");
		builder.append(name);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", address=");
		builder.append(address);
		builder.append(", type=");
		builder.append(type);
		builder.append(", item=");
		builder.append(item);
		builder.append(", date=");
		builder.append(date);
		builder.append(", thistime=");
		builder.append(thistime);
		builder.append(", other=");
		builder.append(other);
		builder.append(", thistime=");
		builder.append(thistime);
		builder.append("]");
		return builder.toString();
	}

	
}
