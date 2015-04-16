package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.SatMan;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.SatManService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KurikulumController {
	 
	@Autowired
	private KurikulumService kurikulumServ;
	 
	@Autowired
	private SatManService satManServ;
	 
	@RequestMapping(value="/kurikulum", method=RequestMethod.GET)
	public ModelAndView showKurikulum(){
		ModelAndView mav = new ModelAndView(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		mav.addObject("kurikulums", kurikulumList);
		mav.setViewName("Kurikulum");
		return mav;
	}
	@RequestMapping(value="/kurikulum/tambah", method=RequestMethod.GET)
	public ModelAndView showSatManOption(){
		ModelAndView mav = new ModelAndView();
		List<SatMan> satManList = satManServ.findAll();
		mav.addObject("satMans", satManList);
		mav.setViewName("TambahKurikulum");
		return mav;
	}
	
	//tambah kurikulum
	@RequestMapping(value="/kurikulum/tambah/aksi", method=RequestMethod.POST)
	public ModelAndView addKurikulumAction(String nmKurikulumTxt, String idSatManTxt, String tahunMulaiTxt, 
			String tahunAkhirTxt, Boolean statusKurikulumOpt){
		ModelAndView mav = new ModelAndView();
		Boolean flag = kurikulumServ.addKurikulumAction(satManServ.convertToUUID(idSatManTxt), nmKurikulumTxt, 
				tahunMulaiTxt, tahunAkhirTxt, statusKurikulumOpt);
		if(flag){
			mav.setViewName("redirect:/kurikulum");
		}
		else{
		mav.setViewName("redirect:/kurikulum/tambah");
		}
		return mav;
	}
	//end of tambah kurikulum
	
	@RequestMapping(value="kurikulum/ubah/{idKurikulum}", method=RequestMethod.GET)
	public ModelAndView getKurikulumData(@PathVariable UUID idKurikulum){
		ModelAndView mav = new ModelAndView();
		Kurikulum kurikulumUbah = kurikulumServ.findById(idKurikulum);
		mav.addObject("kurikulumObj", kurikulumUbah);
		List<SatMan> satManList = satManServ.findAll();
		mav.addObject("satMans", satManList);
		mav.setViewName("UbahKurikulum");
		return mav;
	}
	//ubah kurikulum
		@RequestMapping(value="kurikulum/ubah/aksi/{idKurikulum}", method=RequestMethod.POST)
		public ModelAndView changeKurikulumAction(@PathVariable String idKurikulum, String idSatManTxt, String nmKurikulumTxt, String tahunMulaiTxt, 
				String tahunAkhirTxt, Boolean statusKurikulumOpt){
			ModelAndView mav = new ModelAndView();
			Boolean flag = kurikulumServ.editKurikulumAction(kurikulumServ.convertToUUID(idKurikulum), satManServ.convertToUUID(idSatManTxt), nmKurikulumTxt, 
					tahunMulaiTxt, tahunAkhirTxt, statusKurikulumOpt);
			if(flag){
				mav.setViewName("redirect:/kurikulum");
			}
			else{
				mav.setViewName("redirect:kurikulum/ubah/" + kurikulumServ.convertToUUID(idKurikulum));
			}
			return mav;
		}
	//end of ubah kurikulum
		
	//aktifkan kurikulum
		@RequestMapping(value="kurikulum/ubah/aktif/{idKurikulum}", method=RequestMethod.GET)
		public ModelAndView changeStatus(@PathVariable String idKurikulum){
			ModelAndView mav = new ModelAndView(); 
			kurikulumServ.activateKurikulum(kurikulumServ.convertToUUID(idKurikulum));
			mav.setViewName("redirect:/kurikulum");
			return mav;
		}
	//end of aktif kurikulum
		
	//hapus kurikulum
		@RequestMapping(value="kurikulum/ubah/hapus/{idKurikulum}", method=RequestMethod.GET)
		public ModelAndView deactivateKurikulum(@PathVariable String idKurikulum){
			ModelAndView mav = new ModelAndView();
			kurikulumServ.deleteKurikulum(kurikulumServ.convertToUUID(idKurikulum));
			mav.setViewName("redirect:/kurikulum");
			return mav;
		}
		//end of hapus kurikulum
}
