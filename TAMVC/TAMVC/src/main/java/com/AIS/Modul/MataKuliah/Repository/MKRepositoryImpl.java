package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.Kurikulum;
import com.sia.main.domain.MK;
import com.sia.main.domain.PrasyaratMK;

@Repository
public class MKRepositoryImpl implements MKRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public long count(String where) {
		// TODO Auto-generated method stub
		String dbWhere ="";
		if(where != "") dbWhere = " WHERE "+where;
		Query query = sessionFactory.getCurrentSession().createQuery(
		        "select count(*) from MK mk inner join mk.kurikulum kur left join mk.rumpunMK rumpunMK"+dbWhere);
		Long count = (Long)query.uniqueResult();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MK> get(String where, String order, int limit, int offset) {
		String dbWhere ="";
		String dbOrder ="";
		if(where != "") dbWhere = " WHERE "+where;
		if(order != "") dbOrder = " ORDER BY "+order;
		 
		Query query = sessionFactory.getCurrentSession().createQuery("select mk from MK mk inner join mk.kurikulum kur left join mk.rumpunMK rumpunMK "+dbWhere+dbOrder); 
		if(limit != -1 && limit>0) {
			query.setFirstResult(offset);
			if(offset < 0) offset = 0;
			query.setMaxResults(limit);
		}
		
		return query.list();
	}

	@Override
	public void update(MK mk) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(mk);
		tx.commit(); 
		session.flush();
		session.close();
	}

	@Override
	public UUID insert(MK mk) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(mk);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public MK findById(UUID idMK) {
		// TODO Auto-generated method stub
		List<MK> queryResult = sessionFactory.getCurrentSession().createQuery("select mk from MK mk inner join mk.kurikulum kur left join mk.rumpunMK rumpunMK  WHERE mk.idMK='"+idMK.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MK> findAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("select mk from MK mk inner join mk.kurikulum kur left join mk.rumpunMK rumpunMK  where mk.statusMK = true").list();
		
	}
}
