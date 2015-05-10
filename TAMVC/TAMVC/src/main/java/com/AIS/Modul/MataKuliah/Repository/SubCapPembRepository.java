package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;
 

import com.sia.main.domain.CapPemb;
import com.sia.main.domain.SubCapPemb;

public interface SubCapPembRepository {

	public long count(String where);

	public List<SubCapPemb> get(String where, String order, int limit, int offset);

	public void update(SubCapPemb subCapPemb);

	public UUID insert(SubCapPemb subCapPemb);

	public SubCapPemb findById(UUID idSubCapPemb);

	public List<SubCapPemb> findAll();

	public SubCapPemb findParent(CapPemb childSubCapPemb);

	public CapPemb findParent(UUID idCapPemb);
}
