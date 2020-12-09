package i19.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import Gusty.model.MemberBean;

@Entity
@Table(name="MOM")
public class MomBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer momId;	
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String petContent;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String experience;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String notices;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String title;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String pic;	
	private Integer proPrice1;
	private Integer proPrice2;
	private Integer proPrice3;
	private Integer proPrice4;
	
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType1;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType2;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType3;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType4;
	@Column(columnDefinition = "nvarchar(MAX)", nullable = true)
	private String bodyType5;
	
	
	//@OneToOne(cascade = CascadeType.ALL,mappedBy = "momBean")
	@OneToOne(mappedBy = "momBean",cascade = CascadeType.ALL)
	private MemberBean memberBean;
	
	public MomBean() {

	}

	public MomBean(String petContent, String experience, String notices, String title, String pic,
			Integer proPrice1, Integer proPrice2, Integer proPrice3, Integer proPrice4, String bodyType1,
			String bodyType2, String bodyType3, String bodyType4, String bodyType5 , MemberBean memberBean) {
		super();
		this.petContent = petContent;
		this.experience = experience;
		this.notices = notices;
		this.title = title;
		this.pic = pic;
		this.proPrice1 = proPrice1;
		this.proPrice2 = proPrice2;
		this.proPrice3 = proPrice3;
		this.proPrice4 = proPrice4;
		this.bodyType1 = bodyType1;
		this.bodyType2 = bodyType2;
		this.bodyType3 = bodyType3;
		this.bodyType4 = bodyType4;
		this.bodyType5 = bodyType5;
		this.memberBean = memberBean;
	}

	public Integer getMomId() {
		return momId;
	}

	public void setMomId(Integer momId) {
		this.momId = momId;
	}

	public String getPetContent() {
		return petContent;
	}

	public void setPetContent(String petContent) {
		this.petContent = petContent;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getNotices() {
		return notices;
	}

	public void setNotices(String notices) {
		this.notices = notices;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Integer getProPrice1() {
		return proPrice1;
	}

	public void setProPrice1(Integer proPrice1) {
		this.proPrice1 = proPrice1;
	}

	public Integer getProPrice2() {
		return proPrice2;
	}

	public void setProPrice2(Integer proPrice2) {
		this.proPrice2 = proPrice2;
	}

	public Integer getProPrice3() {
		return proPrice3;
	}

	public void setProPrice3(Integer proPrice3) {
		this.proPrice3 = proPrice3;
	}

	public Integer getProPrice4() {
		return proPrice4;
	}

	public void setProPrice4(Integer proPrice4) {
		this.proPrice4 = proPrice4;
	}

	public String getBodyType1() {
		return bodyType1;
	}

	public void setBodyType1(String bodyType1) {
		this.bodyType1 = bodyType1;
	}

	public String getBodyType2() {
		return bodyType2;
	}

	public void setBodyType2(String bodyType2) {
		this.bodyType2 = bodyType2;
	}

	public String getBodyType3() {
		return bodyType3;
	}

	public void setBodyType3(String bodyType3) {
		this.bodyType3 = bodyType3;
	}

	public String getBodyType4() {
		return bodyType4;
	}

	public void setBodyType4(String bodyType4) {
		this.bodyType4 = bodyType4;
	}

	public String getBodyType5() {
		return bodyType5;
	}

	public void setBodyType5(String bodyType5) {
		this.bodyType5 = bodyType5;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}



	
}

