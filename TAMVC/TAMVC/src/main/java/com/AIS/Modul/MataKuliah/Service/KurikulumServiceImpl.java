package com.AIS.Modul.MataKuliah.Service;

import java.util.List;
import java.util.UUID;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Repository.KurikulumRepository;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Service
public class KurikulumServiceImpl implements KurikulumService {

	@Autowired
	private KurikulumRepository kurikulumRepo;
	
	@Autowired
	private SatManService satManServ;
	
	
	@Override
	public List<Kurikulum> findAll() {
		return kurikulumRepo.findAll();
	}

	@Override
	public Kurikulum findById(UUID idKurikulum) {
		return kurikulumRepo.findById(idKurikulum);
	
	}

	@Override
	public void editKurikulum(Kurikulum kurikulum, UUID idKurikulum) {
		kurikulumRepo.editKurikulum(kurikulum, idKurikulum);
		
	}

	@Override
	public void addKurikulum(Kurikulum kurikulum) {
		kurikulumRepo.addKurikulum(kurikulum);
		
	}

	@Override
	public boolean addKurikulumAction(UUID idSatMan, String nmKurikulum,
			String thnMulai, String thnAkhir, Boolean aStatusKurikulum) {
		if(idSatMan != null && thnMulai != null 
				&& thnAkhir != null && aStatusKurikulum != null){
			Kurikulum kurikulum = new Kurikulum();
			//kurikulum.setIdKurikulum(UUID.randomUUID());
			kurikulum.setSatMan(satManServ.findById(idSatMan));
			kurikulum.setNmKurikulum(nmKurikulum);
			kurikulum.setThnMulai(thnMulai);
			kurikulum.setThnAkhir(thnAkhir);
			kurikulum.setaStatusKurikulum(aStatusKurikulum);
			
			this.addKurikulum(kurikulum);
			return true;
		}
		return false;
	}

	@Override
	public boolean editKurikulumAction(UUID idKurikulum, UUID idSatMan, String thnMulai,
			String thnAkhir, Boolean aStatusKurikulum) {
		if(idSatMan != null && thnMulai != null 
				&& thnAkhir != null && aStatusKurikulum != null){
			Kurikulum kurikulum = kurikulumRepo.findById(idKurikulum);
			kurikulum.setSatMan(satManServ.findById(idSatMan));
			kurikulum.setThnMulai(thnMulai);
			kurikulum.setThnAkhir(thnAkhir);
			kurikulum.setaStatusKurikulum(aStatusKurikulum);
			this.editKurikulum(kurikulum, idKurikulum);
			
			return true;
		}
		return false;
	}

	@Override
	public UUID convertToUUID(String source) {
		return UUID.fromString(source);
	}
	
	
}
