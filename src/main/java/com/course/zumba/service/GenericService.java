package com.course.zumba.service;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

public interface GenericService<T> {
int insert(T element); 
	
	int update(T element);
	
	List<T> findAll(Class<T> classElement);
	
	T findById(int id, Class<T> classElement);
	
	int deleteById(int id, Class<T> classElement);
}
