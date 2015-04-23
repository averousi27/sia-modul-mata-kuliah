package com.AIS.Modul.MataKuliah.Service;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Controller.KurikulumController;

import java.util.List;
import java.util.UUID;

public interface KurikulumService {
	public List<Kurikulum> findAll();
    public Kurikulum findById(UUID idKurikulum);
 
    public void addKurikulum(Kurikulum kurikulum);
    public void editKurikulum(Kurikulum kurikulum, UUID idKurikulum);
	boolean addKurikulumAction(UUID idSatMan, String nmKurikulum, String tahunMulai, String tahunAkhir, Boolean statusKurikulum);
    boolean editKurikulumAction(UUID idKurikulum, UUID idSatMan, String nmKurikulum, String tahunMulai, String tahunAkhir, Boolean statusKurikulum);
    public UUID convertToUUID(String source);
    public void activateKurikulum(UUID idKurikulum);
    public void deleteKurikulum(UUID idKurikulum);
    public Datatable getdatatable(String sEcho,int iDisplayLength, int iDisplayStart, int iSortCol_0, String sSortDir_0, String sSearch, String filter);
	public List<Kurikulum> get(String where, String order, int limit, int offset);
	public List<Kurikulum> get();
	public List<Kurikulum> get(String where);
	public List<Kurikulum> get(String where, String order);

}
