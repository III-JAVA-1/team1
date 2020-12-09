package petforum.model;

import java.io.Serializable;
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
@Table(name = "Article01")
public class ArticleBean implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer posterUid;
	@Column(name = "forumId", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String forumId;
	@Column(name = "header", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String header;
	private Timestamp updatedTime;
	@Column(name = "content", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String content;
	private Integer viewing;
	private Integer reply;
	//private Integer memberId;
	private Integer isHide = 0;//預設無違規不隱藏	
	
//	多對一，多的一方有外鍵
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="petforum_U_Id",referencedColumnName = "U_Id")
	//外鍵:"U_Id"為MemberBean01主鍵
	MemberBean memberBean;//mappedBy = "memberBean01"是參考這裡的
	
	
	public ArticleBean() {
		
	}
	
	public ArticleBean(Integer posterUid ,String forumId, String header, Timestamp updatedTime, String content ,Integer memberId) {
		this.posterUid = posterUid;
		this.forumId = forumId;
		this.header = header;
		this.updatedTime = updatedTime;
		this.content = content;
	}


	public ArticleBean(String forumId, String header, Timestamp updatedTime, String content, Integer viewing,
			Integer reply, Integer memberId, Integer isHide) {
	
		//this.posterUid = posterUid;
		this.forumId = forumId;
		this.header = header;
		this.updatedTime = updatedTime;
		this.content = content;
		this.viewing = viewing;
		this.reply = reply;
		this.isHide = isHide;
	}

	public Integer getPosterUid() {
		return posterUid;
	}

	public void setPosterUid(Integer posterUid) {
		this.posterUid = posterUid;
	}

	public String getForumId() {
		return forumId;
	}

	public void setForumId(String forumId) {
		this.forumId = forumId;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public Timestamp getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Timestamp updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getViewing() {
		return viewing;
	}

	public void setViewing(Integer viewing) {
		this.viewing = viewing;
	}

	public Integer getReply() {
		return reply;
	}

	public void setReply(Integer reply) {
		this.reply = reply;
	}


	public Integer getIsHide() {
		return isHide;
	}

	public void setIsHide(Integer isHide) {
		this.isHide = isHide;
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
		builder.append("ArticleBean [posterUid=");
		builder.append(posterUid);
		builder.append(", forumId=");
		builder.append(forumId);
		builder.append(", header=");
		builder.append(header);
		builder.append(", updatedTime=");
		builder.append(updatedTime);
		builder.append(", content=");
		builder.append(content);
		builder.append(", viewing=");
		builder.append(viewing);
		builder.append(", reply=");
		builder.append(reply);
		builder.append(", isHide=");
		builder.append(isHide);
//		builder.append(", memberBean=");
//		builder.append(memberBean);
		builder.append("]");
		return builder.toString();
	}

	
}
