package com.AIS.Modul.MataKuliah.Model;

import java.util.UUID;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="cap_pemb")
public class CapPemb{
	
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@org.hibernate.annotations.Type(type="pg-uuid")
	@Column(name="id_cap_pemb")
	private UUID idCapPemb;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_kurikulum")
	private Kurikulum kurikulum;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id_sat_man")
	private SatMan satMan;
	
	@Column(name="nm_cap_pemb")
	private String nmCapPemb;
	
	@Column(name="deskripsi_cap_pemb")
	private String deskripsiCapPemb;

	public UUID getIdCapPemb() {
		return idCapPemb;
	}

	public void setIdCapPemb(UUID idCapPemb) {
		this.idCapPemb = idCapPemb;
	}

	public Kurikulum getKurikulum() {
		return kurikulum;
	}

	public void setKurikulum(Kurikulum kurikulum) {
		this.kurikulum = kurikulum;
	}

	public SatMan getSatMan() {
		return satMan;
	}

	public void setSatMan(SatMan satMan) {
		this.satMan = satMan;
	}

	public String getNmCapPemb() {
		return nmCapPemb;
	}

	public void setNmCapPemb(String nmCapPemb) {
		this.nmCapPemb = nmCapPemb;
	}

	public String getDeskripsiCapPemb() {
		return deskripsiCapPemb;
	}

	public void setDeskripsiCapPemb(String deskripsiCapPemb) {
		this.deskripsiCapPemb = deskripsiCapPemb;
	}
	
	/*@OneToMany(fetch=FetchType.LAZY, mappedBy="indukCapPemb")
	private List<SubCapPemb> subCapPembInduk;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="anakCapPemb")
	private List<SubCapPemb> subCapPembAnak;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="capPembMK")
	private List<DetailCapPembMK> detailCapPembMKs;*/
	
}