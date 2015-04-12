package com.AIS.Modul.MataKuliah.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="rumpun_mk")
public class RumpunMK{
	
	@Id
	@Column(name="id_rumpun_mk")
	private String idRumpunMK;
	
	@Column(name="nama_rumpun_mk")
	private String namaRumpunMK;
	
	@Column(name="status_rumpun_mk")
	private Boolean statusRumpunMK;
}
