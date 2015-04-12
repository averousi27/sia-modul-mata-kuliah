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
    boolean editKurikulumAction(UUID idKurikulum, UUID idSatMan, String tahunMulai, String tahunAkhir, Boolean statusKurikulum);
    public UUID convertToUUID(String source);
}
