package com.course.zumba.constant;

public class Query {
	
	public static final String findAllBatchParticipantByParticipant = 
			"select distinct b.*  "
			+ "from batchparticipant as bp "
			+ "inner join batch as b on b.id = bp.bid "
			+ "inner join participant as p on bp.pid = p.id "
			+ "where p.id = ?;";
	
	public static final String queryParticpantNameAndEmail = "select distinct * from "
			+ "participant where "
			+ "name = ? and email = ?";


	public static final String queryUserByUsernameAndPassword = "select * from "
			+ "user where "
			+ "username = ? and password = ?";
}
