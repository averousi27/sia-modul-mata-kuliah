package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Service.EkuivalensiMKService;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.MKService; 
import com.sia.main.domain.MK;
import com.sia.main.domain.PrasyaratMK;

@Controller
@RequestMapping("/matakuliah/ekuivalensi")
public class EkuivalensiMKController {
	
	@Autowired
	private MKService mkServ;
	
	@Autowired
	private EkuivalensiMKService ekuivalensiMKServ;
	
	@Autowired
	private KurikulumService kurikulumServ;
	
	private static final Logger logger = LoggerFactory.getLogger(EkuivalensiMKController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		PrasyaratMK pMK = new PrasyaratMK();  
		List<MK> mkList = mkServ.findAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("mkList", mkList);
		mav.addObject("pMK", pMK);
		mav.setViewName("ViewPrasyaratMK"); 
		return mav;
	}
}
