package com.course.zumba.service;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.course.zumba.dao.GenericDao;
import com.course.zumba.dao.GenericDaoImpl;
import com.course.zumba.model.Batch;

public class GenericServiceImpl<T, V> implements GenericService<T, V> {
	private GenericDao<T, V> dao;

	public GenericServiceImpl() throws ClassNotFoundException, SQLException {
		dao = new GenericDaoImpl<T, V>();
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
			List<T> list = dao.findAll(classElement);
			list.stream().forEach(al -> System.out.println("el: " + al.toString()));
			return list;
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | NoSuchMethodException
				| SecurityException | IllegalArgumentException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}

		return new ArrayList<>();
	}

	public List<V> findAllByQuery(String query, Class<V> returnClass, Object... statementParams) {
		try {
			return dao.findAllByQuery(query, returnClass, statementParams);
		} catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| SQLException e) {
			e.printStackTrace();
		}

		return null;
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

	@Override
	public int deleteByPramCondition(Class<T> classElement, String [] params, Object... valueParams) {
		try {
			return dao.deleteByPramCondition(classElement, params, valueParams);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}

}
