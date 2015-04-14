package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.SatMan;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.SatManService;

@Controller
public class CapPembController {

	@Autowired
	private KurikulumService kurikulumServ;
	
	@Autowired
	private SatManService satManServ;
	
	@RequestMapping(value="capaianbelajar/satuanmanajemen", method=RequestMethod.GET)
	public ModelAndView showCapPembSatMan(){
		ModelAndView mav = new ModelAndView();
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		mav.addObject("kurikulums", kurikulumList);
		List<SatMan> satManList = satManServ.findAll();
		mav.addObject("satMans", satManList);
		mav.setViewName("CapPembSatMan");
		return mav;
	}
	
	@RequestMapping(value="view/{idKurikulum}-{idSatMan}", method=RequestMethod.GET)
	public ModelAndView showCapPemb(@PathVariable String idKurikulum, String idSatMan){
		ModelAndView mav = new ModelAndView();
		UUID UUIDKurikulum = kurikulumServ.convertToUUID(idKurikulum);
		UUID UUIDSatMan = satManServ.convertToUUID(idSatMan);
		mav.addObject(kurikulumServ.findById(UUIDKurikulum));
		mav.addObject(satManServ.findById(UUIDSatMan));
		mav.setViewName("CapPembSatMan");
		return mav;
		
	}
}
