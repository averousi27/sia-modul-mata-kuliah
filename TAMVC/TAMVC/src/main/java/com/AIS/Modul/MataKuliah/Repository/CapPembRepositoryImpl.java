package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.AIS.Modul.MataKuliah.Model.CapPemb;


@Repository
public class CapPembRepositoryImpl implements CapPembRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<CapPemb> findAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from CapPemb").list();
	}

	@Override
	public CapPemb findById(UUID idCapPemb) {
		// TODO Auto-generated method stub
		return (CapPemb)sessionFactory.getCurrentSession().get(CapPemb.class, idCapPemb);
	}

	@Override
	public void addCapPemb(CapPemb capPemb) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(capPemb);
		
	}

	@Override
	@Transactional
	public void editCapPemb(CapPemb capPemb, UUID idCapPemb) {
		
	}

}
