package com.AIS.Modul.MataKuliah.Service;

import java.util.List;
import java.util.UUID;

import com.AIS.Modul.MataKuliah.Model.CapPemb; 

public interface CapPembService {
	public List<CapPemb> findAll();
    public CapPemb findById(UUID idCapPemb);
 
    public void addCapPemb(CapPemb CapPemb);
    public void editCapPemb(CapPemb capPemb, UUID idCapPemb);
    public List<CapPemb> findByTahunAndSatMan(UUID idKurikulum, UUID idSatMan);
    public UUID convertToUUID(String source);
}