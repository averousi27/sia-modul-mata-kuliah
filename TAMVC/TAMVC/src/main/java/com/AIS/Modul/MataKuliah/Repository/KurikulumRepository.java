package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.SatMan;

public interface KurikulumRepository {
	public List<Kurikulum> findAll();
    public Kurikulum findById(UUID idKurikulum);
    public void addKurikulum(Kurikulum kurikulum);
    public void editKurikulum(Kurikulum kurikulum, UUID idKurikulum); 
}
