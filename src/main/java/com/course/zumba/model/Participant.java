package com.course.zumba.model;

import java.io.Serializable;

public class Participant implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String name;
	
	private String contact;
	
	private String email;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Participant [id=" + id + ", name=" + name + ", contact=" + contact + ", email=" + email + "]";
	}
}
