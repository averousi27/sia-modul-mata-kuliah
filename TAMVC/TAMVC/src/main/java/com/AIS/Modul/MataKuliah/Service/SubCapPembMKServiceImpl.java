package com.AIS.Modul.MataKuliah.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.SubCapPembMKRepository;
import com.sia.main.domain.CapPemb;
import com.sia.main.domain.CapPembMK;

@Service
public class SubCapPembMKServiceImpl implements SubCapPembMKService {
	 
	@Autowired
	private SubCapPembMKRepository subCapPembMKRepo; 

	@Override
	public CapPemb findByCapPembMK(CapPembMK capPembMK) {
		// TODO Auto-generated method stub
		UUID idCapPembMK = capPembMK.getIdCapPembMK();
		return subCapPembMKRepo.findByCapPembMK(idCapPembMK);
	}
}
