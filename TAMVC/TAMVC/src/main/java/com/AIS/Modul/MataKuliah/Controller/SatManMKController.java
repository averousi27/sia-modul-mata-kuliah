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

import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.SatManMKService; 
import com.AIS.Modul.MataKuliah.Service.SatManService;
import com.sia.main.domain.EkuivalensiMK;
import com.sia.main.domain.Kurikulum;
import com.sia.main.domain.MK;
import com.sia.main.domain.SatMan;
import com.sia.main.domain.SatManMK;

@Controller
@RequestMapping("/matakuliah/satuanmanajemen")
public class SatManMKController {
	
	@Autowired
	private MKService mkServ;
	
	@Autowired
	private KurikulumService kurikulumServ;
	
	@Autowired
	private SatManService satManServ;
	
	@Autowired
	private SatManMKService satManMKServ;
	
	private static final Logger logger = LoggerFactory.getLogger(SatManMKController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		SatManMK satManMK = new SatManMK();  
		List<MK> mkList = mkServ.findAll();
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		List<SatMan> satManList = satManServ.findAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("mkList", mkList);
		mav.addObject("kurikulumList", kurikulumList);
		mav.addObject("satManList", satManList);
		mav.addObject("satManMK", satManMK);
		mav.setViewName("ViewSatManMK"); 

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
			@RequestParam("statusSatManMK") String statusSatManMK) 
	{
		String filter = "CAST(sMMK.statusSatManMK as string) LIKE '%"+statusSatManMK+"%' ";
		Datatable satManMKDatatable = satManMKServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch,filter);
		
		return satManMKDatatable;
	}
	
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("satManMK") SatManMK satManMK, 
    		@RequestParam("idMK") UUID idMK, @RequestParam("idSatMan") UUID idSatMan, 
    		 BindingResult result, Map<String, Object> model) {   
		MK mk = mkServ.findById(idMK);
		SatMan satMan = satManServ.findById(idSatMan);
		satManMK.setMk(mk);
		satManMK.setSatMan(satMan);
		AjaxResponse response = new AjaxResponse();   
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
        response.setData(satManMKServ.save(satManMK));
        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
        else 
        {
        	response.setStatus("error");
        	response.setMessage("Mata kuliah untuk satuan manajemen sudah ada");
        }
        return response;
    }
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse edit(@RequestParam("idSatManMK") UUID idSatManMK) {
		AjaxResponse response;
		SatManMK satManMK = satManMKServ.findById(idSatManMK);
		if(satManMK == null) response = new AjaxResponse("error","Data tidak ditemukan",null);
		else response = new AjaxResponse("ok","Data ditemukan",satManMK);
        return response;
    } 
	
	@RequestMapping(value = "/deletemany", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse deleteMany(@RequestParam("idSatManMK[]") UUID[] idSatManMK) {
		AjaxResponse response;
		for (UUID uuid : idSatManMK) {
			satManMKServ.delete(uuid);
		}
		response = new AjaxResponse("ok","Data dihapus",null);
        return response;
    }
}
