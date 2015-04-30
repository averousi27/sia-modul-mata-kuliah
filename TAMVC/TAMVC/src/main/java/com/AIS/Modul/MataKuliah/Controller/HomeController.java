package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sia.main.domain.*;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;

@Controller
public class HomeController {
	
	@Autowired
	private KurikulumService kurikulumServ;
	
	
	/*@RequestMapping(value="matakuliah/satuanmanajemen", method=RequestMethod.GET)
	public ModelAndView showMKSatMan(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MataKuliah");
		return mav;
	}*/
	
	@RequestMapping(value="/masterpagetabel", method=RequestMethod.GET)
	public ModelAndView showTabel(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("datatable");
		return mav;
	}
	@RequestMapping(value="/masterpage", method=RequestMethod.GET)
	public ModelAndView showKomponen(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("formcomponent");
		return mav;
	}
}
