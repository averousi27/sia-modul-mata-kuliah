package com.AIS.Modul.MataKuliah.Service;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.MK;
import com.sia.main.domain.SatMan;
import com.sia.main.domain.SatManMK;

public interface SatManMKService {

	public String save(SatManMK satManMK);

	public SatManMK findById(UUID idSatManMK);

	public String delete(UUID uuid);

	public Datatable getdatatable(String sEcho, int iDisplayLength,
			int iDisplayStart, int iSortCol_0, String sSortDir_0,
			String sSearch, String filter);

	List<SatManMK> get();

	List<SatManMK> get(String where);

	List<SatManMK> get(String where, String order);

	List<SatManMK> get(String where, String order, int limit, int offset);

}
