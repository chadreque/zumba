package com.course.zumba.dao;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.course.zumba.util.Database;
import com.course.zumba.util.SqlQuryUtil;

public class GenericDaoImpl<T> implements GenericDao<T> {

	private PreparedStatement preparedStatement;
	private Map<Integer, Object> statement;

	private Connection connection;

	public GenericDaoImpl() throws ClassNotFoundException, SQLException {
//		connection = Database.connect();
		statement = new HashMap<Integer, Object>();

	}

	@Override
	public int insert(T element)
			throws IllegalAccessException, InvocationTargetException, SQLException, SecurityException {
		if (connection == null)
			return -1;

		List<Method> methods = Arrays.asList(element.getClass().getDeclaredMethods()).stream()
				.filter(method -> method.getName().contains("get")).collect(Collectors.toList());

		StringBuilder sql = new StringBuilder("INSERT INTO " + element.getClass().getSimpleName() + " (");

		SqlQuryUtil.injectColumnsInQuery("insert", sql, element, methods, statement);

		sql.append(" values (");

		SqlQuryUtil.injectSatemntInQueryForInsert(sql, methods);

		preparedStatement = connection.prepareStatement(sql.toString());

		SqlQuryUtil.setPreparedStatementValue(statement, preparedStatement);

		return preparedStatement.executeUpdate();
	}

	@Override
	public int update(T element) throws IllegalAccessException, InvocationTargetException, SQLException {
		if (connection == null)
			return -1;

		List<Method> methods = Arrays.asList(element.getClass().getDeclaredMethods()).stream()
				.filter(method -> method.getName().contains("get")).collect(Collectors.toList());
		
		
		System.out.println("methods.size(): " + methods.size());
		StringBuilder sql = new StringBuilder("UPDATE " + element.getClass().getSimpleName() + " SET ");

		SqlQuryUtil.injectColumnsInQuery("update", sql, element, methods, statement);

		sql.append(" WHERE id = ?");

		preparedStatement = connection.prepareStatement(sql.toString());

		SqlQuryUtil.setPreparedStatementValue(statement, preparedStatement);

		return preparedStatement.executeUpdate();
	}

	@Override
	public List<T> findAll(Class<T> classElement)
			throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException,
			NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {


		Connection connection = Database.connect();
		
		StringBuilder sql = new StringBuilder("SELECT * FROM ").append(classElement.getSimpleName());

		preparedStatement = connection.prepareStatement(sql.toString());

		List<T> list = new ArrayList<T>();

		ResultSet resultSet = preparedStatement.executeQuery();

		List<Method> methods = Arrays.asList(classElement.getDeclaredMethods()).stream()
				.filter(method -> method.getName().contains("set")).collect(Collectors.toList());

		while (resultSet.next()) {
			T instance = classElement.newInstance();

			for (Method method : methods) {
				Object value = resultSet.getObject(method.getName().substring(3).toLowerCase());
				method.invoke(instance, value);
			}

			list.add(instance);
		}

		return list;
	}

	@Override
	public T findById(int id, Class<T> classElement) throws SQLException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, InstantiationException {
		StringBuilder sql = new StringBuilder("SELECT * FROM ").append(classElement.getSimpleName())
				.append(" where id = ?");

		preparedStatement = connection.prepareStatement(sql.toString());

		preparedStatement.setInt(1, id);

		ResultSet resultSet = preparedStatement.executeQuery();

		List<Method> methods = Arrays.asList(classElement.getDeclaredMethods()).stream()
				.filter(method -> method.getName().contains("set")).collect(Collectors.toList());

		T resultInstance = null;

		while (resultSet.next()) {
			resultInstance = classElement.newInstance();

			for (Method method : methods) {
				Object value = resultSet.getObject(method.getName().substring(3).toLowerCase());

				method.invoke(resultInstance, value);
			}
		}

		return resultInstance;
	}

	@Override
	public int deleteById(int id, Class<T> classElement) throws SQLException {
		StringBuilder sql = new StringBuilder("DELETE FROM ").append(classElement.getSimpleName())
				.append(" where id = ?");

		preparedStatement = connection.prepareStatement(sql.toString());

		preparedStatement.setInt(1, id);

		return preparedStatement.executeUpdate();
	}
}
