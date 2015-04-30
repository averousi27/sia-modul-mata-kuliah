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
 
import com.sia.main.domain.*;
import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.RumpunMKService;
 

@Controller
@RequestMapping(value = "/matakuliah/rumpun")
public class RumpunMKController {
	
	@Autowired
	private RumpunMKService rumpunMKServ;
	  
	private static final Logger logger = LoggerFactory.getLogger(RumpunMKController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		RumpunMK rumpunMK = new RumpunMK(); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("rumpunMK", rumpunMK);
		mav.setViewName("ViewRumpunMK"); 
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
			@RequestParam("aStatusRumpunMK") String aStatusRumpunMK
            ) {
		String filter = "CAST( aStatusRumpunMK as string) LIKE '%"+aStatusRumpunMK+"%'";
		Datatable rumpunMKDatatable = rumpunMKServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch,filter);
		return rumpunMKDatatable;
	}
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("rumpunMK") RumpunMK rumpunMK, 
    		 BindingResult result, Map<String, Object> model) {
		AjaxResponse response = new AjaxResponse();   
		logger.info(String.valueOf(rumpunMK.getNmRumpunMK()));
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
        response.setData(rumpunMKServ.save(rumpunMK));
        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
        else 
        {
        	response.setStatus("error");
        	response.setMessage("Rumpun mata kuliah sudah ada");
        }
        return response;
    }
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse edit(@RequestParam("idRumpunMK") UUID idRumpunMK) {
		AjaxResponse response;
		RumpunMK rumpunMK = rumpunMKServ.findById(idRumpunMK);
		rumpunMK.setaStatusRumpunMK(rumpunMK.isaStatusRumpunMK());
		System.out.println("ini status sblm diupdate1 "+rumpunMK.isaStatusRumpunMK());
		if(rumpunMK == null) response = new AjaxResponse("error","Data tidak ditemukan",null);
		else response = new AjaxResponse("ok","Data ditemukan",rumpunMK);
        return response;
    } 
	
	@RequestMapping(value = "/deletemany", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse deleteMany(@RequestParam("idRumpunMK[]") UUID[] idRumpunMK) {
		AjaxResponse response;
		for (UUID uuid : idRumpunMK) {
			rumpunMKServ.delete(uuid);
		}
		response = new AjaxResponse("ok","Data dihapus",null);
        return response;
    }
}
