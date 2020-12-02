package Gusty.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Member01")
public class MemberBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer U_Id;
	@Column(name = "Name", columnDefinition = "nvarchar(MAX)", nullable = true)
	String Name;
	@Column(name = "Gender", columnDefinition = "nvarchar(MAX)", nullable = true)
	String Gender;
	String Password;
	String ID;
	String Phone;
	String Email;
	Date Birth;
	@Column(name = "Sname", columnDefinition = "nvarchar(MAX)", nullable = true)
	String Sname;
	String Zip;
	@Column(name = "Country", columnDefinition = "nvarchar(MAX)", nullable = true)
	String Country;
	@Column(name = "District", columnDefinition = "nvarchar(MAX)", nullable = true)
	String District;
	@Column(name = "Address", columnDefinition = "nvarchar(MAX)", nullable = true)
	String Address;
	@Column(name = "Img", columnDefinition = "nvarchar(MAX)", nullable = true)
	String Img;

	public Integer getU_Id() {
		return U_Id;
	}
	public void setU_Id(Integer u_Id) {
		U_Id = u_Id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Date getBirth() {
		return Birth;
	}
	public void setBirth(Date birth) {
		Birth = birth;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getZip() {
		return Zip;
	}
	public void setZip(String zip) {
		Zip = zip;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	
	public MemberBean() {
		super();
	}
	
	public MemberBean(Integer u_Id, String name, String gender, String password, String iD, String phone, String email,
			Date birth, String sname, String zip, String country, String district, String address, String img) {
		super();
		U_Id = u_Id;
		Name = name;
		Gender = gender;
		Password = password;
		ID = iD;
		Phone = phone;
		Email = email;
		Birth = birth;
		Sname = sname;
		Zip = zip;
		Country = country;
		District = district;
		Address = address;
		Img = img;
	}
	public MemberBean(String name, String gender, String password, String iD, String phone, String email, Date birth,
			String sname, String zip, String country, String district, String address, String img) {
		super();
		Name = name;
		Gender = gender;
		Password = password;
		ID = iD;
		Phone = phone;
		Email = email;
		Birth = birth;
		Sname = sname;
		Zip = zip;
		Country = country;
		District = district;
		Address = address;
		Img = img;
	}
	
	
}
