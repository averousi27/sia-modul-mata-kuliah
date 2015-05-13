package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.CapPemb;
import com.sia.main.domain.SubCapPemb;

@Repository
public class SubCapPembRepositoryImpl implements SubCapPembRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	 
	@Override
	public long count(String where) {
		// TODO Auto-generated method stub
		String dbWhere ="";
		if(where != "") dbWhere = " WHERE " +where;
		Query query = sessionFactory.getCurrentSession().createQuery(
		        "select count(*) from SubCapPemb scp "
		        + "join scp.capPemb child "
		        + "join scp.capPemb parent " +dbWhere);
		Long count = (Long)query.uniqueResult();
		return count;
	}
 
	@SuppressWarnings("unchecked")
	@Override
	public List<SubCapPemb> get(String where, String order, int limit, int offset) {
		// TODO Auto-generated method stub
		String dbWhere ="";
		String dbOrder ="";
		if(where != "") dbWhere = " WHERE "+where;
		if(order != "") dbOrder = " ORDER BY "+order;
		 
		Query query = sessionFactory.getCurrentSession().createQuery("select scp from SubCapPemb scp " 
				+ "join scp.capPemb child "
		        + "join scp.capPemb parent "+dbWhere+dbOrder);
		if(limit != -1 && limit>0) {
			query.setFirstResult(offset);
			if(offset < 0) offset = 0;
			query.setMaxResults(limit);
		}
		
		return query.list();
	}

	@Override
	public void update(SubCapPemb subCapPemb) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(subCapPemb);
		tx.commit();
		session.flush();
		session.close();
	}

	@Override
	public UUID insert(SubCapPemb subCapPemb) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(subCapPemb);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}
 
	@SuppressWarnings("unchecked")
	@Override
	public SubCapPemb findById(UUID idSubCapPemb) {
		// TODO Auto-generated method stub
		List<SubCapPemb> queryResult = sessionFactory.getCurrentSession().createQuery("select scp from SubCapPemb scp "
				+ "join scp.capPemb child "
				+ "join scp.capPemb parent  WHERE  scp.idSubCapPemb='"+idSubCapPemb.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	} 
	@SuppressWarnings("unchecked")
	@Override
	public List<SubCapPemb> findAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("select scp from SubCapPemb scp WHERE scp.statusHapusSubCapPemb = false").list();

	}
	
	@SuppressWarnings("unchecked")
	public SubCapPemb findParent(CapPemb childSubCapPemb) {
		// TODO Auto-generated method stub
		List<SubCapPemb> queryResult = (List<SubCapPemb>) sessionFactory.getCurrentSession().createQuery("select scp from SubCapPemb scp "
				+ "join scp.childCapPemb child "
				+ "join scp.parentCapPemb parent  WHERE scp.childCapPemb = '"+ childSubCapPemb+"'");
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public CapPemb findParent(UUID idCapPemb) {
//		// TODO Auto-generated method stub
//		List<SubCapPemb> queryResult = (List<SubCapPemb>) sessionFactory.getCurrentSession().createQuery("select scp from SubCapPemb scp "
//				+ "join scp.childCapPemb child "
//				+ "join scp.parentCapPemb parent  WHERE scp.idCapPemb = '"+ idCapPemb.toString()+"'");
//		if(queryResult.size()==0) return null;
//		return queryResult.get(0);
		List<SubCapPemb> scpList = findAll();
		for (SubCapPemb scp : scpList) {
			if( scp.getChildCapPemb().getIdCapPemb().equals(idCapPemb)){
				return scp.getParentCapPemb();
			}
		}
		return null;
	} 
}
