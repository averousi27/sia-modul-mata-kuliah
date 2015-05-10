package com.AIS.Modul.MataKuliah.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.SubCapPembRepository;
import com.sia.main.domain.CapPemb;
import com.sia.main.domain.SubCapPemb;

@Service
public class SubCapPembServiceImpl implements SubCapPembService {

	@Autowired
	private SubCapPembRepository subCapPembRepo;
	
	@Override
	public CapPemb findParent(CapPemb childSubCapPemb) {
		// TODO Auto-generated method stub
		UUID idCapPemb = childSubCapPemb.getIdCapPemb();
		return subCapPembRepo.findParent(idCapPemb);
	}

	@Override
	public String save(SubCapPemb subCapPembNew) {
		// TODO Auto-generated method stub
		if(subCapPembNew.getIdSubCapPemb() != null)
		{
			//update
			subCapPembRepo.update(subCapPembNew);
			return subCapPembNew.getIdSubCapPemb().toString();
		}
		else
		{
			//insert 
			return subCapPembRepo.insert(subCapPembNew).toString();
		}
	}
 
}