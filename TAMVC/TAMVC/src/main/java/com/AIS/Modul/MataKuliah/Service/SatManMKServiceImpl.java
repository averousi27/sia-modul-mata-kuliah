package com.AIS.Modul.MataKuliah.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.SatManMKRepository;
import com.sia.main.domain.MK;
import com.sia.main.domain.SatMan;
import com.sia.main.domain.SatManMK;

@Service
public class SatManMKServiceImpl implements SatManMKService {
	
	@Autowired
	private MKService mkServ;
	
	@Autowired
	private SatManService satManServ;
	
	@Autowired
	private SatManMKRepository satManMKRepo;

	@Override
	public String save(SatManMK satManMK) {
		// TODO Auto-generated method stub
		if(satManMK.getIdSatManMK()!= null)
		{
			//update
			
			satManMKRepo.update(satManMK);
			return satManMK.getIdSatManMK().toString();
		}
		else
		{
			//insert
//	        kurikulum.setaStatusKurikulum(true);
			return satManMKRepo.insert(satManMK).toString();
		}
	}
}
