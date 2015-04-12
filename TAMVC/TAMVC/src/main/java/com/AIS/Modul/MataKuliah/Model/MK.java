package com.AIS.Modul.MataKuliah.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="mk")
public class MK{
	
	@Id
	@Column(name="id_mk")
	private String idMK;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_rumpun_mk")
	private RumpunMK rumpunMK;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_kurikulum")
	private Kurikulum kurikulum;
	
	@Column(name="kode_mk")
	private String kodeMK;
	
	@Column(name="nama_mk")
	private String namaMK;
	
	@Column(name="deskripsi_mk")
	private String deskripsiMK;
	
	@Column(name="jumlah_sks")
	private Integer jumlahSKS;
	
	@Column(name="tingkat_pemb")
	private Integer tingkatPemb;
	
	@Column(name="sifat_mk")
	private Boolean sifatMK;
	
	@Column(name="status_mk")
	private Boolean statusMK;

	public String getIdMK() {
		return idMK;
	}

	public void setIdMK(String idMK) {
		this.idMK = idMK;
	}

	public RumpunMK getRumpunMK() {
		return rumpunMK;
	}

	public void setRumpunMK(RumpunMK rumpunMK) {
		this.rumpunMK = rumpunMK;
	}

	public Kurikulum getKurikulum() {
		return kurikulum;
	}

	public void setKurikulum(Kurikulum kurikulum) {
		this.kurikulum = kurikulum;
	}

	public String getKodeMK() {
		return kodeMK;
	}

	public void setKodeMK(String kodeMK) {
		this.kodeMK = kodeMK;
	}

	public String getNamaMK() {
		return namaMK;
	}

	public void setNamaMK(String namaMK) {
		this.namaMK = namaMK;
	}

	public String getDeskripsiMK() {
		return deskripsiMK;
	}

	public void setDeskripsiMK(String deskripsiMK) {
		this.deskripsiMK = deskripsiMK;
	}

	public Integer getJumlahSKS() {
		return jumlahSKS;
	}

	public void setJumlahSKS(Integer jumlahSKS) {
		this.jumlahSKS = jumlahSKS;
	}

	public Integer getTingkatPemb() {
		return tingkatPemb;
	}

	public void setTingkatPemb(Integer tingkatPemb) {
		this.tingkatPemb = tingkatPemb;
	}

	public Boolean getSifatMK() {
		return sifatMK;
	}

	public void setSifatMK(Boolean sifatMK) {
		this.sifatMK = sifatMK;
	}

	public Boolean getStatusMK() {
		return statusMK;
	}

	public void setStatusMK(Boolean statusMK) {
		this.statusMK = statusMK;
	}
	
	
	
	
}