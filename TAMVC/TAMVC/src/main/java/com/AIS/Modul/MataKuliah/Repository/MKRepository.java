package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.MK;

public interface MKRepository {

	public long count(String string);

	public List<MK> get(String where, String order, int limit, int offset);

	public void update(MK mk);

	public UUID insert(MK mk);

	public MK findById(UUID idMK);
	
}
