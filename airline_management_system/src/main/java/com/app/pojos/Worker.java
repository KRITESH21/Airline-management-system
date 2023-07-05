package com.app.pojos;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "workers")
public class Worker extends BaseEntity {

	private String name;
	private String post;
	private String duty;
	private String email;
	private String mobile;
public Worker() {
	// TODO Auto-generated constructor stub
}
	public Worker(String name, String post, String duty, String email, String mobile) {
		super();
		this.name = name;
		this.post = post;
		this.duty = duty;
		this.email = email;
		this.mobile = mobile;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}

	@Override
	public String toString() {
		return "Worker [name=" + name + ", post=" + post + ", duty=" + duty + ", email=" + email + ", mobile=" + mobile
				+ "]";
	}
		
}
