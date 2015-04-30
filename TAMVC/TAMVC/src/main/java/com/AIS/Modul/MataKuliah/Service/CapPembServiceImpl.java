package com.AIS.Modul.MataKuliah.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.CapPembRepository;
import com.sia.main.domain.*;

@Service
public class CapPembServiceImpl implements CapPembService {

	@Autowired
	private CapPembRepository capPembRepo;
	
	@Override
	public List<CapPemb> findAll() {
		// TODO Auto-generated method stub
		return capPembRepo.findAll();
	}

	@Override
	public CapPemb findById(UUID idCapPemb) {
		// TODO Auto-generated method stub
		return capPembRepo.findById(idCapPemb);
	}

	@Override
	public void addCapPemb(CapPemb capPemb) {
		// TODO Auto-generated method stub
		capPembRepo.addCapPemb(capPemb);
	}

	@Override
	public void editCapPemb(CapPemb capPemb, UUID idCapPemb) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CapPemb> findListByTahunAndSatMan(UUID idKurikulum, UUID idSatMan) {
		// TODO Auto-generated method stub
		/*List<CapPemb> capPembAll = findAll();
		List<CapPemb> capPembTemp = new ArrayList<CapPemb>();
		for(CapPemb cp : capPembAll){
			if(cp.getKurikulum().getIdKurikulum().equals(idKurikulum) && (cp.getSatMan().getIdSatMan().equals(idSatMan))){
					capPembTemp.add(cp);
				}
		}
		/*for(CapPemb cpt : capPembTemp){
			System.out.println(cpt.getNmCapPemb() + "" + cpt.getDeskripsiCapPemb());
		}*/
		//return capPembTemp;
		return capPembRepo.findListByTahunSatMan(idKurikulum, idSatMan);
	}

	@Override
	public UUID convertToUUID(String source) {
		// TODO Auto-generated method stub
		return UUID.fromString(source);
	}

	@Override
	public CapPemb findObjByTahunAndSatMan(UUID idKurikulum, UUID idSatMan) {
		// TODO Auto-generated method stub
		return null;
	}

	/*@Override
	public CapPemb findObjByTahunAndSatMan(UUID idKurikulum, UUID idSatMan) {
		List<CapPemb> capPembAll = findAll();
		for(CapPemb cp : capPembAll){
			if(cp.getKurikulum().getIdKurikulum().equals(idKurikulum) && (cp.getSatMan().getIdSatMan().equals(idSatMan))){
					return cp;
				}
		}
		return null;
	}*/

}
