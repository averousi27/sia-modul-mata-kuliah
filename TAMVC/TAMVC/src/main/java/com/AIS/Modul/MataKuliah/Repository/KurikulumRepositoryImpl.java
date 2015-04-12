package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.Kurikulum;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class KurikulumRepositoryImpl implements KurikulumRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Kurikulum> findAll() {
		 return sessionFactory.getCurrentSession().createQuery("from Kurikulum").list();
	}
	
	@Override
	@Transactional
	public Kurikulum findById(UUID idKurikulum) {
		return (Kurikulum) sessionFactory.getCurrentSession().get(Kurikulum.class, idKurikulum);
	}

	@Override
	@Transactional
	public void addKurikulum(Kurikulum kurikulum) {
		sessionFactory.getCurrentSession().save(kurikulum);
		
	}

	@Override
	@Transactional
	public void editKurikulum(Kurikulum kurikulum, UUID idKurikulum) {
		// TODO Auto-generated method stub
		
	}
	
}
