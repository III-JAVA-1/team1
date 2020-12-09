package Henry.model;

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

import Gusty.model.MemberBean;

@Entity
@Table(name="Salon_reserv2")
public class Salon_reservBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String storename;
	private String  name;
	private String phone;
	private String address;
	private String type;
	private String item;
	@Column(columnDefinition = "smalldatetime", nullable = true)
	private Timestamp date ;
	@Column(columnDefinition = "nvarchar(300)", nullable = true)
	private String other;
	
	
	//多對一，多的一方有外鍵
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_id",referencedColumnName = "U_Id")
	//外鍵:"U_Id"為MemberBean01主鍵
	MemberBean memberBean;//mappedBy = "memberBean01"是參考這裡的
	public Salon_reservBean() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Salon_reservBean(String storename, String name, String phone, String address, String type,
			String item, Timestamp date, String other, MemberBean memberBean) {
		super();
		this.storename = storename;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.type = type;
		this.item = item;
		this.date = date;
		this.other = other;
		this.memberBean = memberBean;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

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
		builder.append(", other=");
		builder.append(other);
		builder.append("]");
		return builder.toString();
	}

	
	
	

	
	
	

}
