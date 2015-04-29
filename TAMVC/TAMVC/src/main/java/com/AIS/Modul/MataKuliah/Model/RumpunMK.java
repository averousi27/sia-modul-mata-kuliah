package com.AIS.Modul.MataKuliah.Model;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id; 
import javax.persistence.Table; 
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="rumpun_mk") 
public class RumpunMK {
 
		@Id
		@GeneratedValue(generator="uuid")
		@GenericGenerator(name = "uuid", strategy = "uuid2")
		@org.hibernate.annotations.Type(type="pg-uuid")
		@Column(name="id_rumpun_mk")
		private UUID idRumpunMK; 
		
		@Column(name="nm_rumpun_mk")
		@NotEmpty(message="Nama rumpun mata kuliah tidak boleh kosong")
		private String nmRumpunMK;
		   
		@Column(name="a_status_rumpun_mk")
		private boolean aStatusRumpunMK;

		public UUID getIdRumpunMK() {
			return idRumpunMK;
		}

		public void setIdRumpunMK(UUID idRumpunMK) {
			this.idRumpunMK = idRumpunMK;
		}

		public String getNmRumpunMK() {
			return nmRumpunMK;
		}

		public void setNmRumpunMK(String nmRumpunMK) {
			this.nmRumpunMK = nmRumpunMK;
		}

		public boolean isaStatusRumpunMK() {
			return aStatusRumpunMK;
		}

		public void setaStatusRumpunMK(boolean aStatusRumpunMK) {
			this.aStatusRumpunMK = aStatusRumpunMK;
		}
}
