package com.course.zumba.dao;

import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.course.zumba.model.Batch;
import com.course.zumba.model.Participant;

public class GenericDaoImplTest {

//	@Test
	public void testInsertion() {
		
		try {
			Participant participant = new Participant();
			participant.setName("Testando");
			participant.setContact("646084589");
			participant.setEmail("teste@gmail.com");

			GenericDaoImpl<Participant, Void> daodaoParticipant = new GenericDaoImpl<Participant, Void>();
			int participantID = daodaoParticipant.insert(participant); 
		
//			Batch batch = new Batch();
//			batch.setName("Zumba 4");
//			batch.setTotaalParticipants(10);
//			
//			GenericDaoImpl<Batch> daoBatch = new GenericDaoImpl<Batch>();
			
//			int batchID = daoBatch.insert(batch); 
			
			assertTrue(participantID > 0); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
//	@Test
	public void testUpdate() {
		
		try {
			Participant participant = new Participant();
			participant.setId(9);
			participant.setName("Maria Moises Tebete Micajo");
			participant.setContact("846084589");
			participant.setEmail("maria.t.micajogmail.com");

			GenericDao<Participant, Void> dao = new GenericDaoImpl<Participant, Void>();
			int id = dao.update(participant); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
//	@Test
	public void testSelectAll() {
		GenericDao<Participant, Void> dao;
		try {
			dao = new GenericDaoImpl<Participant, Void>();
			List<Participant> participants = dao.findAll(Participant.class);
			
//			participants.stream().forEach(p -> System.out.println("Participant: " + p));
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		}
		
		
	}
	
	@Test
	public void testFindAllByQuery() {
		GenericDao<Participant, Participant> dao;
		String query = "select distinct p.* from participant p where p.name = ?";
		try {
			dao = new GenericDaoImpl<Participant, Participant>();
			List<Participant> batchs = dao.findAllByQuery(query, Participant.class, "safdsf34we");
			
//			batchs.stream().forEach(b -> System.out.println("Batch: " + b));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
//	@Test
	public void testSelectById() {
		GenericDaoImpl<Participant, Void> dao;
		try {
			dao = new GenericDaoImpl<Participant, Void>();
			Participant participants = dao.findById(21, Participant.class);
			
			System.out.println("Participant: " + participants);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testDelete() {
		GenericDaoImpl<Participant, Void> dao;
		try {
			dao = new GenericDaoImpl<Participant, Void>();
			int deleted = dao.deleteById(10, Participant.class);
			
			System.out.println("deleted id: " + deleted);
			
			assertTrue(deleted == 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
