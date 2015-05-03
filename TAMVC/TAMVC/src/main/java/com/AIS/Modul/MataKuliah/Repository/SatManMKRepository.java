package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.SatManMK;

public interface SatManMKRepository {

	public void update(SatManMK satManMK);

	public UUID insert(SatManMK satManMK);

	public SatManMK findById(UUID idSatManMK);
	public long count(String string);

	public List<SatManMK> get(String where, String order, int limit, int offset); 

}
