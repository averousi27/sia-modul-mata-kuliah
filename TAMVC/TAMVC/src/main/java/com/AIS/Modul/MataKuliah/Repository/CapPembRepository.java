package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Repository;

import com.sia.main.domain.*;

public interface CapPembRepository {
	 
	public List<CapPemb> findBySatMan(UUID idSatMan);
	
	public long count(String where);

	public List<CapPemb> get(String where, String order, int limit, int offset);

	public void update(CapPemb capPemb);

	public UUID insert(CapPemb capPemb);

	public CapPemb findById(UUID idCapPemb);

	public List<CapPemb> findAll();
}
