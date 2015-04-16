package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Model.CapPemb;
import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.SatMan;
import com.AIS.Modul.MataKuliah.Service.CapPembService;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.SatManService;

@Controller
public class CapPembController {
		
	@Autowired
	private KurikulumService kurikulumServ;
	
	@Autowired 
	private SatManService satManServ;

	@Autowired 
	private CapPembService capPembServ;
	
	@RequestMapping(value="capaianbelajar/satuanmanajemen", method=RequestMethod.GET)
	public ModelAndView showCapPembSatMan(){
		ModelAndView mav = new ModelAndView(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		List<SatMan> satManList	= satManServ.findAll();
		mav.addObject("kurikulums", kurikulumList);
		mav.addObject("satmans", satManList);
		mav.setViewName("CapPembSatMan");
		return mav;
	}
	
	@RequestMapping(value="capaianbelajar/satuanmanajemen/view", method=RequestMethod.GET)
	public @ResponseBody List<CapPemb> showCapPemb(@PathVariable String idKurikulumTxt, @PathVariable String idSatManTxt){
		//ModelAndView mav = new ModelAndView();
		//System.out.println(idKurikulumTxt + " " +idSatManTxt);
		List<CapPemb> capPembList = capPembServ.findByTahunAndSatMan(capPembServ.convertToUUID(idKurikulumTxt), 
				capPembServ.convertToUUID(idSatManTxt));
		//mav.addObject("cappembs", capPembList);
		//mav.setViewName("redirect:/capaianbelajar/satuanmanajemen"); 
		return capPembList;
	}
	
	/*@RequestMapping(value="capaianbelajar/satuanmanajemen/tambah/{idKurikulum}/{idSatMan}", method=RequestMethod.GET)
	public ModelAndView getData(@PathVariable String idKurikulum, @PathVariable String idSatMan){
		ModelAndView mav = new ModelAndView();
		mav.addObject("kurikulumObj",kurikulumServ.findById(kurikulumServ.convertToUUID(idKurikulum)));
		mav.addObject("satManObj", satManServ.findById(satManServ.convertToUUID(idSatMan)));
		List<SatMan> satManList	= satManServ.findAll();
		mav.addObject("satmans", satManList);
		mav.setViewName("TambahCapaianBelajar");
		return mav;
	}*/
}
