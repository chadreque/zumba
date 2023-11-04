package com.course.zumba.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

public interface GenericDao<T> {
	int insert(T element) throws IllegalAccessException, InvocationTargetException, SQLException ;
	
	int update(T element) throws IllegalAccessException, InvocationTargetException, SQLException ;
	
	List<T> findAll(Class<T> classElement)
			throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException,
			NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException ;
	
	T findById(int id, Class<T> classElement) throws SQLException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException ;
	
	int deleteById(int id, Class<T> classElement) throws SQLException ;
}
