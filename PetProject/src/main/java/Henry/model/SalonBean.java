package Henry.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="SalonShop")

public class SalonBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer salon_id;
	
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String name;
	@Column(columnDefinition = "nvarchar(50)", nullable = true)
	private String adderss;
	@Column(columnDefinition = "nvarchar(100)", nullable = true)
	private String phone;
	
	
}
