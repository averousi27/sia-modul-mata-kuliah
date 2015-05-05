package com.AIS.Modul.MataKuliah.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sia.main.domain.*;
import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.CapPembService;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.SatManService;

@Controller
@RequestMapping(value="/capaianbelajar/satuanmanajemen")
public class CapPembController {
		
	@Autowired
	private KurikulumService kurikulumServ;
	
	@Autowired 
	private SatManService satManServ;

	@Autowired 
	private CapPembService capPembServ;
	
	private static final Logger logger = LoggerFactory.getLogger(CapPembController.class);
	
	/*@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView showCapPembSatMan(@RequestParam ("idSatMan") UUID idSatMan) {
		ModelAndView mav = new ModelAndView(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		List<SatMan> satManList	= satManServ.findAll();
		UUID idSatManNew = satManServ.findById(idSatMan).getIdSatMan();
		List<CapPemb> capPembList = capPembServ.findBySatMan(idSatManNew);
		mav.addObject("kurikulums", kurikulumList);
		mav.addObject("satmans", satManList);
		mav.addObject("capPembList", capPembList);
		mav.setViewName("ViewCapaianSatMan");
		return mav;
	}*/
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView showCapPembSatMan() {
		ModelAndView mav = new ModelAndView(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		List<SatMan> satManList	= satManServ.findAll(); 
		CapPemb capPemb = new CapPemb();
		mav.addObject("kurikulumList", kurikulumList);
		mav.addObject("satManList", satManList);
		mav.addObject("capPemb", capPemb);
		mav.setViewName("ViewCapaianSatMan");
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
			@RequestParam("statusHapusCapPemb") String statusHapusCapPemb
            ) {
		String filter = "CAST( cp.statusHapusCapPemb as string) LIKE '%"+statusHapusCapPemb+"%'";
		Datatable capPembDatatable = capPembServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch,filter);
		return capPembDatatable;
	}	
	
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("capPemb") CapPemb capPemb, 
    		@RequestParam ("idKurikulum") UUID idKurikulum, @RequestParam ("idSatMan") UUID idSatMan, 
    		BindingResult result, Map<String, Object> model) {
		AjaxResponse response = new AjaxResponse();
		SatMan satManObj = satManServ.findById(idSatMan); 
		Kurikulum kur = kurikulumServ.findById(idKurikulum);
		capPemb.setSatMan(satManObj);
		capPemb.setKurikulum(kur);
        if (result.hasErrors()) {
        	response.setStatus("error");
        	List<FieldError> fieldError = result.getFieldErrors();
        	String message ="";
    		if(fieldError.get(0).isBindingFailure()) message += "Salah satu input tidak valid";
    		else message += fieldError.get(0).getDefaultMessage();
        	for(int i=1;i<fieldError.size();i++)
        	{
        		if(fieldError.get(i).isBindingFailure()) message += "<br/>Salah satu input tidak valid";
        		else message += "<br/>"+fieldError.get(i).getDefaultMessage();
        	}
        	response.setMessage(message);
        	response.setData(fieldError);
            return response;
        }
        response.setData(capPembServ.save(capPemb));
        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
        else 
        {
        	response.setStatus("error");
        	response.setMessage("Capaian Pembelajaran sudah ada");
        }
        return response;
    }
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse edit(@RequestParam("idCapPemb") UUID idCapPemb) {
		AjaxResponse response;
		CapPemb capPemb = capPembServ.findById(idCapPemb);
		if(capPemb == null) response = new AjaxResponse("error","Data tidak ditemukan",null);
		else response = new AjaxResponse("ok","Data ditemukan",capPemb);
        return response;
    }
	
	@RequestMapping(value = "/deletemany", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse deleteMany(@RequestParam("idCapPemb[]") UUID[] idCapPemb) {
		AjaxResponse response;
		for (UUID uuid : idCapPemb) {
			capPembServ.delete(uuid);
		}
		response = new AjaxResponse("ok","Data dihapus",null);
        return response;
    }
	/* 
	@RequestMapping(value="/satuanmanajemen/view/{idKurikulum}/{idSatMan}", method=RequestMethod.GET)
	public @ResponseBody List<CapPemb> showCapPemb(@PathVariable String idKurikulum, @PathVariable String idSatMan){
		//ModelAndView mav = new ModelAndView();
		System.out.println(idSatMan);
		List<CapPemb> capPembList = new ArrayList<CapPemb>();
		capPembList = capPembServ.findListByTahunAndSatMan(capPembServ.convertToUUID(idKurikulum), capPembServ.convertToUUID(idSatMan));
		//System.out.println(capPembList.);
		for(CapPemb cpt : capPembList){
			System.out.println("k" + cpt.getKurikulum().getIdKurikulum() + "sm" + cpt.getSatMan().getIdSatMan()
						+ cpt.getNmCapPemb() + "" + cpt.getDeskripsiCapPemb());
		}
		//mav.addObject("cappembs", capPembList);
		//mav.setViewName("redirect:/capaianbelajar/satuanmanajemen"); 
		return capPembList;
	}*/
}
