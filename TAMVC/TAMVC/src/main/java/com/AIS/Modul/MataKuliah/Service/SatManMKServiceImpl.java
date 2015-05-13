package com.AIS.Modul.MataKuliah.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.SatManMKRepository;
import com.sia.main.domain.EkuivalensiMK;
import com.sia.main.domain.MK;
import com.sia.main.domain.PrasyaratMK;
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

	private String [] column = {"sMMK.idSatManMK", "mk.kodeMK", "mk.namaMK", "satman.nmSatMan", "sMMK.statusSatManMK"};
	private Boolean[] searchable = {false,true,true,true,false};
	
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
			return satManMKRepo.insert(satManMK).toString();
		}
	}

	@Override
	public SatManMK findById(UUID idSatManMK) {
		// TODO Auto-generated method stub
		return satManMKRepo.findById(idSatManMK);
	}

	@Override
	public String delete(UUID idSatManMK) {
		// TODO Auto-generated method stub
		SatManMK satManMK = satManMKRepo.findById(idSatManMK);
		if(satManMK==null) return null;
		else{
			satManMK.setStatusSatManMK(true);
			satManMKRepo.update(satManMK);
			return "Ok";
		}
	}

	@Override
	public Datatable getdatatable(String sEcho, int iDisplayLength,
			int iDisplayStart, int iSortCol_0, String sSortDir_0,
			String sSearch, String filter) {
		// TODO Auto-generated method stub
		DatatableExtractParams parameter = new DatatableExtractParams(sSearch, this.column, this.searchable, iSortCol_0, sSortDir_0);
		Datatable satManMKDatatable= new Datatable();
		satManMKDatatable.setsEcho(sEcho);
		String dbFilter = "";
		if(filter != null && !filter.equals("")) dbFilter+=" AND "+filter; 
		List<SatManMK> queryResult = get("("+parameter.getWhere()+")"+dbFilter, parameter.getOrder(), iDisplayLength, iDisplayStart);
		List<String[]> aData = new ArrayList<String[]>();
		for (SatManMK satManMK : queryResult) {
			String[] satManMKString = new String[6]; 
			satManMKString[0] = satManMK.getIdSatManMK().toString();
			satManMKString[1] = String.valueOf(satManMK.getMk().getKodeMK());
			satManMKString[2] = String.valueOf(satManMK.getMk().getNamaMK()); 
			satManMKString[3] = String.valueOf(satManMK.getSatMan().getNmSatMan());
			satManMKString[4] = String.valueOf(satManMK.isStatusSatManMK());
			satManMKString[5] = String.valueOf(satManMK.isStatusSatManMK()); 
			aData.add(satManMKString);
		}
		satManMKDatatable.setAaData(aData);
		satManMKDatatable.setiTotalRecords(satManMKRepo.count(""));
		satManMKDatatable.setiTotalDisplayRecords(satManMKRepo.count("("+parameter.getWhere()+") AND "+filter));

		return satManMKDatatable;
	}

	@Override
	public List<SatManMK> get() {
		return get("");
	}

	@Override
	public List<SatManMK> get(String where) {
		return get(where,"");
	}

	@Override
	public List<SatManMK> get(String where, String order) {
		return get(where,order,-1,-1);
	}

	@Override
	public List<SatManMK> get(String where, String order, int limit, int offset) {
		return satManMKRepo.get(where, order, limit, offset);
	}
	
}
