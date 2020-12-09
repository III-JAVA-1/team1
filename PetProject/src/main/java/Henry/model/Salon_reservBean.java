package Henry.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.print.attribute.standard.MediaSize.Other;

@Entity
@Table(name="Salon_reserv")
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
	private Date date ;
	@Column(columnDefinition = "nvarchar(300)", nullable = true)
	private String other;
	@Column(columnDefinition = "int", nullable = true)
	private Integer memberid;
	
	
	

	
	
	

}
