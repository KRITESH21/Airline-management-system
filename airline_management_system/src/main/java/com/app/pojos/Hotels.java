package com.app.pojos;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.tomcat.util.codec.binary.Base64;

@Entity
@Table(name="hotels")
public class Hotels extends BaseEntity {

	private String title;
	private String type;
	private String rating;
	private String mobile;
	private String km;
	private String city;
	@Transient
	private String imgUtility;
	@Lob
	@Column(name = "profile_image", length = 10000000)
	private byte[] image;
	
	public Hotels() {
		// TODO Auto-generated constructor stub
	}
	public Hotels(String title, String type, String rating, String mobile, String km, String city, byte[] image) {
		super();
		this.title = title;
		this.type = type;
		this.rating = rating;
		this.mobile = mobile;
		this.km = km;
		this.city = city;
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getKm() {
		return km;
	}
	public void setKm(String km) {
		this.km = km;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getImgUtility() throws UnsupportedEncodingException {

		byte[] encodeBase64 = Base64.encodeBase64(getImage());
		String base64Encoded = new String(encodeBase64, "UTF-8");
		return base64Encoded;
	}
	public void setImgUtility(String imgUtility) {
		this.imgUtility = imgUtility;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "Hotels [title=" + title + ", type=" + type + ", rating=" + rating + ", mobile=" + mobile + ", km=" + km
				+ ", city=" + city + ", imgUtility=" + imgUtility + ", image=" + Arrays.toString(image) + "]";
	}
	
	
	
}
