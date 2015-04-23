package com.AIS.Modul.MataKuliah.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.AIS.Modul.MataKuliah.Model.CapPemb;
import com.AIS.Modul.MataKuliah.Model.Kurikulum;


@Repository
public class CapPembRepositoryImpl implements CapPembRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
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

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CapPemb> findListByTahunSatMan(UUID idKurikulumTxt, UUID idSatManTxt) {
		/*// TODO Auto-generated method stub
		//return sessionFactory.getCurrentSession().createQuery("FROM CapPemb CP WHERE CP.Kurikulum.idKurikulum=:idKurikulum AND CP.idSatMan=:idSatMan").list(); 
		List<CapPemb> capPembTemp = new ArrayList<CapPemb>();
 		Query query = sessionFactory.getCurrentSession().createQuery("SELECT * FROM CapPemb CP WHERE CP.Kurikulum.idKurikulum=:idKurikulum AND CP.idSatMan=:idSatMan"); 
 		query.setParameter("idKurikulum", idKurikulumTxt);
 		query.setParameter("idSatMan", idSatManTxt);
 		capPembTemp = query.list();
		return capPembTemp;*/
		List<CapPemb> queryResult = sessionFactory.getCurrentSession().createQuery("from CapPemb WHERE kurikulum.idKurikulum='"+idKurikulumTxt.toString()+"' AND satMan.idSatMan='"+idSatManTxt.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult;
	}

}
