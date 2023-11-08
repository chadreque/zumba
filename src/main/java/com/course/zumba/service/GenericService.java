package com.course.zumba.service;

import java.util.List;

public interface GenericService<T,V> {
int insert(T element); 
	
	int update(T element);
	
	List<T> findAll(Class<T> classElement);
	
	public List<V> findAllByQuery(String query, Class<V> returnClass, Object... statementParams);
	
	T findById(int id, Class<T> classElement);
	
	int deleteById(int id, Class<T> classElement);
	
	int deleteByPramCondition(Class<T> classElement, String [] params, Object... valueParams);
}
