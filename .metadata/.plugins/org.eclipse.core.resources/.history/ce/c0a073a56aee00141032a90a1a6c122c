package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Repository;

import com.AIS.Modul.MataKuliah.Model.CapPemb;

public interface CapPembRepository {
	public List<CapPemb> findAll();
	public CapPemb findById(UUID idCapPemb);
	public void addCapPemb(CapPemb capPemb);
	public void editCapPemb(CapPemb capPemb, UUID idCapPemb);
	public List<CapPemb> findListByTahunSatMan(UUID idKurikulum, UUID idSatMan);
}
