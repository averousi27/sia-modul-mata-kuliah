package com.AIS.Modul.MataKuliah.Model;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="mk") 
public class MK {
	
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@org.hibernate.annotations.Type(type="pg-uuid")
	@Column(name="id_mk")
	private UUID idMK; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id_kurikulum")
	private Kurikulum kurikulum;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id_rumpun_mk")
	private RumpunMK rumpunMK;
	
	@Column(name="kode_mk")
	@NotEmpty(message="Kode mata kuliah tidak boleh kosong")
	private String kodeMK;
	
	@Column(name="nm_mk")
	@NotEmpty(message="Nama mata kuliah tidak boleh kosong")
	private String nmMK;
	   
	@Column(name="deskripsi_mk")
	private String deskripsiMK;
	
	@Column(name="jumlah_sks_mk")
	@Min(value = 0,message = "Nilai minimal untuk Minimal Pertemuan Pembelajaran adalah 0000")
    @Max(value = 999,message="Nilai maksimal untuk Minimal Pertemuan Pembelajaran adalah 9999")
	@NotEmpty(message="Jumlah sks mata kuliah tidak boleh kosong")
	private Integer jmlSKSMK;
	
	@Column(name="tingkat_pemb")
	@NotEmpty(message="Tingkat pembelajaran mata kuliah tidak boleh kosong")
	private Integer tingkatPemb;
	
	@Column(name="a_sifat_mk")
	@NotEmpty(message="Sifat mata kuliah tidak boleh kosong")
	private boolean aSifatMK;
	
	public UUID getIdMK() {
		return idMK;
	}

	public void setIdMK(UUID idMK) {
		this.idMK = idMK;
	}

	public Kurikulum getKurikulum() {
		return kurikulum;
	}

	public void setKurikulum(Kurikulum kurikulum) {
		this.kurikulum = kurikulum;
	}

	public RumpunMK getRumpunMK() {
		return rumpunMK;
	}

	public void setRumpunMK(RumpunMK rumpunMK) {
		this.rumpunMK = rumpunMK;
	}

	public String getKodeMK() {
		return kodeMK;
	}

	public void setKodeMK(String kodeMK) {
		this.kodeMK = kodeMK;
	}

	public String getNmMK() {
		return nmMK;
	}

	public void setNmMK(String nmMK) {
		this.nmMK = nmMK;
	}

	public String getDeskripsiMK() {
		return deskripsiMK;
	}

	public void setDeskripsiMK(String deskripsiMK) {
		this.deskripsiMK = deskripsiMK;
	}

	public Integer getJmlSKSMK() {
		return jmlSKSMK;
	}

	public void setJmlSKSMK(Integer jmlSKSMK) {
		this.jmlSKSMK = jmlSKSMK;
	}

	public Integer getTingkatPemb() {
		return tingkatPemb;
	}

	public void setTingkatPemb(Integer tingkatPemb) {
		this.tingkatPemb = tingkatPemb;
	}

	public boolean isaSifatMK() {
		return aSifatMK;
	}

	public void setaSifatMK(boolean aSifatMK) {
		this.aSifatMK = aSifatMK;
	}

	public boolean isaStatusRumpunMK() {
		return aStatusRumpunMK;
	}

	public void setaStatusRumpunMK(boolean aStatusRumpunMK) {
		this.aStatusRumpunMK = aStatusRumpunMK;
	}

	@Column(name="a_status_rumpun_mk")
	private boolean aStatusRumpunMK;
}
