package com.AIS.Modul.MataKuliah.Repository;


import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.SatManMK;

@Repository
public class SatManMKRepositoryImpl implements SatManMKRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void update(SatManMK satManMK) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(satManMK);
		tx.commit();
		session.flush();
		session.close();
	}

	@Override
	public UUID insert(SatManMK satManMK) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(satManMK);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

}
