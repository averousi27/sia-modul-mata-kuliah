package com.AIS.Modul.MataKuliah.Repository;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class MKRepositoryImpl implements MKRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public long count(String where) {
		// TODO Auto-generated method stub
		String dbWhere ="";
		if(where != "") dbWhere = " WHERE "+where;
		Query query = sessionFactory.getCurrentSession().createQuery(
		        "select count(*) from MK temp join temp.kurikulum tempkur join tempkur.rumpunMK satMan rumpunMK"+dbWhere);
		Long count = (Long)query.uniqueResult();
		return count;
	}
	

}
