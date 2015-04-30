package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.SatMan;

@Repository
public class SatManRepositoryImpl implements SatManRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<SatMan> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from SatMan").list();
	}

	@Override
	@Transactional
	public SatMan findById(UUID idSatMan) {
		return (SatMan) sessionFactory.getCurrentSession().get(SatMan.class, idSatMan);
	}

	@Override
	public void addSatMan(SatMan satMan) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editSatMan(SatMan satMan, UUID idSatMan) {
		// TODO Auto-generated method stub
		
	}

}
