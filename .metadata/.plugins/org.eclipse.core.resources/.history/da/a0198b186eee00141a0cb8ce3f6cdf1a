package com.AIS.Modul.MataKuliah.Model;

import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min; 
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="kurikulum")
public class Kurikulum{
	
	@Id
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@org.hibernate.annotations.Type(type="pg-uuid")
	@Column(name="id_kurikulum")
	private UUID idKurikulum;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id_sat_man")
	private SatMan satMan;
	
	@Column(name="nm_kurikulum")
	private String nmKurikulum;
	 
	@NotEmpty(message="Tahun mulai kurikulum tidak boleh kosong")
	@Min(value = 0000,message = "Nilai minimal untuk Minimal Pertemuan Pembelajaran adalah 0000")
    @Max(value = 9999,message="Nilai maksimal untuk Minimal Pertemuan Pembelajaran adalah 9999")
	@Column(name="thn_mulai")
	private String thnMulai;

	@NotEmpty(message="Tahun berakhirnya kurikulum tidak boleh kosong") 
	@Min(value = 0000,message = "Nilai minimal untuk Minimal Pertemuan Pembelajaran adalah 0000")
    @Max(value = 9999,message="Nilai maksimal untuk Minimal Pertemuan Pembelajaran adalah 9999")
	@Column(name="thn_akhir")
	private String thnAkhir;
	  
	@Column(name="a_status_kurikulum")
	private boolean aStatusKurikulum;
	
	public UUID getIdKurikulum() {
		return idKurikulum;
	}

	public void setIdKurikulum(UUID idKurikulum) {
		this.idKurikulum = idKurikulum;
	}

	public SatMan getSatMan() {
		return satMan;
	}

	public void setSatMan(SatMan satMan) {
		this.satMan = satMan;
	}

	public String getNmKurikulum() {
		return nmKurikulum;
	}

	public void setNmKurikulum(String nmKurikulum) {
		this.nmKurikulum = nmKurikulum;
	}

	public String getThnMulai() {
		return thnMulai;
	}

	public void setThnMulai(String thnMulai) {
		this.thnMulai = thnMulai;
	}

	public String getThnAkhir() {
		return thnAkhir;
	}

	public void setThnAkhir(String thnAkhir) {
		this.thnAkhir = thnAkhir;
	}

	public boolean getaStatusKurikulum() {
		return aStatusKurikulum;
	}

	public void setaStatusKurikulum(boolean aStatusKurikulum) {
		this.aStatusKurikulum = aStatusKurikulum;
	}
	

}