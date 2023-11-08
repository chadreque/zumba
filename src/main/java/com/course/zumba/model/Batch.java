package com.course.zumba.model;

import java.io.Serializable;

public class Batch  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String name;
	
	private String  instructor;
	
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
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	
	@Override
	public String toString() {
		return "Batch [id=" + id + ", name=" + name + ", instructor=" + instructor + "]";
	}
	
}
