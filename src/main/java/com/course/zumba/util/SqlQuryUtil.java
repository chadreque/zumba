package com.course.zumba.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class SqlQuryUtil {

	static int reorderPosition = -1;

	public static void injectSatemntInQueryForInsert(StringBuilder sql, List<Method> methods) {
		for (int i = 0; i < methods.size(); i++)
			sql.append("?").append((i + 1) != methods.size() ? ", " : ")");
	}

	public static void setPreparedStatementValue(Map<Integer, Object> statement, PreparedStatement preparedStatement) throws SQLException {
		for (Map.Entry<Integer, Object> statementValue : statement.entrySet()){
			System.out.println("key: " + statementValue.getKey() + " - value: " + statementValue.getValue());
			preparedStatement.setObject(statementValue.getKey(), statementValue.getValue());
		}
	}
	
	public static void injectColumnsInQuery(String operation, StringBuilder sql, Object element, List<Method> methods, Map<Integer, Object> statement)
			throws IllegalAccessException, InvocationTargetException {
		for (int i = 0; i < methods.size(); i++) {
			if(operation.equalsIgnoreCase("update") ) {
				preperColumnForUpdate(i, sql, element, methods, statement);
				continue;
			}
			
			System.out.println("Checking next statement 1");
			if(operation.equalsIgnoreCase("insert") ) {
				preperColumnForInsertion(i, sql, element, methods, statement);
				continue;
			}
		
			System.out.println("Checking next statement 2");
			
		}
	}
	

	private  static void preperColumnForInsertion(int index, StringBuilder sql, Object element, List<Method> methods, Map<Integer, Object> statement)
			throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		sql.append(methods.get(index).getName().substring(3).toLowerCase());
		sql.append((index + 1) != methods.size() ? ", " : ")");

		statement.put((index + 1), methods.get(index).invoke(element, null));

	}
	
	private static void preperColumnForUpdate(int index, StringBuilder sql, Object element, List<Method> methods, Map<Integer, Object> statement)
			throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {

		if (methods.get(index).getName().contains("Id")) {
			int lastPosition = methods.size();
			statement.put(lastPosition, methods.get(index).invoke(element, null));
			reorderPosition = (index + 1);
			return;
		}

		int position = reorderPosition == -1 ? (index + 1) : statement.size();
		

		sql.append(methods.get(index).getName().substring(3).toLowerCase())
		.append(position != (methods.size() - 1) ? " = ?, " : " = ?");

		statement.put(position, methods.get(index).invoke(element, null));

	}
}
