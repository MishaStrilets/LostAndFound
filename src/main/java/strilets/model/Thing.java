package strilets.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "THING")
public class Thing {

	public Thing() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotBlank
	@Size(max = 20)
	@Column(name = "NAME")
	private String name;

	@Size(max = 30)
	@Column(name = "PLACE")
	private String place;

	@Size(max = 10)
	@Column(name = "DATE")
	private String date;

	@NotBlank
	@Size(max = 15)
	@Column(name = "PHONE_NUMBER")
	private String phoneNumber;

	@NotBlank
	@Size(max = 10)
	@Column(name = "LOST_OR_FOUND")
	private String lostOrFound;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getLostOrFound() {
		return lostOrFound;
	}

	public void setLostOrFound(String lostOrFound) {
		this.lostOrFound = lostOrFound;
	}

}
