package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.CapPemb;
import com.sia.main.domain.CapPembMK;
import com.sia.main.domain.SubCapPembMK;

public interface CapPembMKRepository {

	public long count(String where);

	public List<CapPembMK> get(String where, String order, int limit, int offset);

	public List<CapPemb> findAll();

	public CapPembMK findById(UUID idCapPembMK);

	public UUID insert(CapPembMK capPembMK);

	public void update(CapPembMK capPembMK);

	public List<CapPemb> findParent(CapPembMK capPembMK);


}
