package com.course.zumba.service;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.course.zumba.dao.GenericDao;
import com.course.zumba.dao.GenericDaoImpl;

public class GenericServiceImpl<T> implements GenericService<T> {
	private GenericDao<T> dao;

	public GenericServiceImpl() throws ClassNotFoundException, SQLException {
			dao = new GenericDaoImpl<T>();
	}

	@Override
	public int insert(T element) {
		try {
			return dao.insert(element);
		} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}

	@Override
	public int update(T element) {
		try {
			return dao.update(element);
		} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}

	@Override
	public List<T> findAll(Class<T> classElement) {
		try {
			return dao.findAll(classElement);
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | NoSuchMethodException
				| SecurityException | IllegalArgumentException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}
		
		return new ArrayList<>();
	}

	@Override
	public T findById(int id, Class<T> classElement) {
		try {
			return dao.findById(id, classElement);
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | InstantiationException
				| SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int deleteById(int id, Class<T> classElement) {
		try {
			return dao.deleteById(id, classElement);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	
}
