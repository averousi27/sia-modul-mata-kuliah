package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
  
import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.MK;
import com.AIS.Modul.MataKuliah.Model.RumpunMK;
import com.AIS.Modul.MataKuliah.Model.SatMan;
import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.RumpunMKService;

@Controller
@RequestMapping(value = "/matakuliah")
public class MKController {
	 
	@Autowired
	private KurikulumService kurikulumServ;
	
	@Autowired
	private RumpunMKService rumpunMKServ;
	
	@Autowired
	private MKService mkServ;
	
	private static final Logger logger = LoggerFactory.getLogger(MKController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		MK mk = new MK(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		List<RumpunMK> rumpunMKList = rumpunMKServ.findAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("kurikulumList", kurikulumList);
		mav.addObject("rumpunMKList", rumpunMKList);
		mav.addObject("mk", mk);
		mav.setViewName("ViewMK"); 
		return mav;
	}
	@RequestMapping(value = "/json", method = RequestMethod.POST)
	public @ResponseBody Datatable json(
			@RequestParam("sEcho") String sEcho, 
			@RequestParam("iDisplayLength") int iDisplayLength,
            @RequestParam("iSortCol_0") int iSortCol_0,
            @RequestParam("sSortDir_0") String sSortDir_0,
            @RequestParam("sSearch") String sSearch,
			@RequestParam("iDisplayStart") int iDisplayStart,
			@RequestParam("aStatusMK") String aStatusMK
            ) {
		String filter = "CAST(k.aStatusMK as string) LIKE '%"+aStatusMK+"%'";
		Datatable rumpunMKDatatable = mkServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch, filter);
		return rumpunMKDatatable;
	} 
}
