package com.course.zumba.constant;

public enum DatabaseHelper{
	DRIVER_CLASS("com.mysql.cj.jdbc.Driver"),
	URL("jdbc:mysql://localhost:3306/zumba"),
	USERNAME("root"),
	PASSWORD("root");
	
	private final String property;
	
	DatabaseHelper(String property) {
		this.property = property;
	}

	public String getProperty() {
		return property;
	}

}
