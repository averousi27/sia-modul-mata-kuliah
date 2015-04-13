package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;

@Controller
public class HomeController {
	
	@Autowired
	private KurikulumService kurikulumServ;
	
	@RequestMapping(value="/kurikulum", method=RequestMethod.GET)
	public ModelAndView showKurikulum(){
		ModelAndView mav = new ModelAndView(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		mav.addObject("kurikulums", kurikulumList);
		mav.setViewName("Kurikulum");
		return mav;
	}
	
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
