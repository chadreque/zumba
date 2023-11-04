package com.course.zumba.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static com.course.zumba.constant.DatabaseHelper.DRIVER_CLASS;
import static com.course.zumba.constant.DatabaseHelper.URL;
import static com.course.zumba.constant.DatabaseHelper.USERNAME;
import static com.course.zumba.constant.DatabaseHelper.PASSWORD;

public class Database {

	public static final Connection connect() throws ClassNotFoundException, SQLException {

		Class.forName(DRIVER_CLASS.getProperty());

		Connection connection = DriverManager.getConnection(
				URL.getProperty(), 
				USERNAME.getProperty(),
				PASSWORD.getProperty()
		);

		return connection;
	}

}
