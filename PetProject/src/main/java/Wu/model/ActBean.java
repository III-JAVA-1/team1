package Wu.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Active2")
public class ActBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer act_no;
	
	private String act_name;
	private Date starttime;
	private Date endtime;
	private String act_content;
	private String act_organize;
	private String act_orgman;
	private String act_orgphone;
	private String act_type;
	public Integer getAct_no() {
		return act_no;
	}
	public void setAct_no(Integer act_no) {
		this.act_no = act_no;
	}
	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getAct_content() {
		return act_content;
	}
	public void setAct_content(String act_content) {
		this.act_content = act_content;
	}
	public String getAct_organize() {
		return act_organize;
	}
	public void setAct_organize(String act_organize) {
		this.act_organize = act_organize;
	}
	public String getAct_orgman() {
		return act_orgman;
	}
	public void setAct_orgman(String act_orgman) {
		this.act_orgman = act_orgman;
	}
	public String getAct_orgphone() {
		return act_orgphone;
	}
	public void setAct_orgphone(String act_orgphone) {
		this.act_orgphone = act_orgphone;
	}
	public String getAct_type() {
		return act_type;
	}
	public void setAct_type(String act_type) {
		this.act_type = act_type;
	}
	public ActBean(Integer act_no, String act_name, Date starttime, Date endtime, String act_content,
			String act_organize, String act_orgman, String act_orgphone, String act_type) {
		super();
		this.act_no = act_no;
		this.act_name = act_name;
		this.starttime = starttime;
		this.endtime = endtime;
		this.act_content = act_content;
		this.act_organize = act_organize;
		this.act_orgman = act_orgman;
		this.act_orgphone = act_orgphone;
		this.act_type = act_type;
	}

}
