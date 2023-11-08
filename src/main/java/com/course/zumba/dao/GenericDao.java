package com.course.zumba.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import com.course.zumba.model.Batch;

public interface GenericDao<T, V> {
	int insert(T element) throws IllegalAccessException, InvocationTargetException, SQLException ;
	
	int update(T element) throws IllegalAccessException, InvocationTargetException, SQLException ;
	
	List<T> findAll(Class<T> classElement)
			throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException,
			NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException ;
	
	public List<V> findAllByQuery(String query, Class<V> returnClass, Object... statementParams) throws SQLException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
		
	T findById(int id, Class<T> classElement) throws SQLException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException ;
	
	int deleteById(int id, Class<T> classElement) throws SQLException ;
	
	int deleteByPramCondition(Class<T> classElement, String [] params, Object... valueParams)  throws SQLException ;
}
