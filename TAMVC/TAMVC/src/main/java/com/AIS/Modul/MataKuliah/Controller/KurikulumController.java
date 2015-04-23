package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.AIS.Modul.MataKuliah.Model.Kurikulum;
import com.AIS.Modul.MataKuliah.Model.SatMan;
import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.KurikulumService;
import com.AIS.Modul.MataKuliah.Service.SatManService; 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/kurikulum")
public class KurikulumController {
	 
	@Autowired
	private KurikulumService kurikulumServ;
	 
	@Autowired
	private SatManService satManServ;
	
	private static final Logger logger = LoggerFactory.getLogger(KurikulumController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		Kurikulum kurikulum = new Kurikulum();
		List<SatMan> satManList = satManServ.findAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ViewKurikulum");
		mav.addObject("kurikulum", kurikulum);
		mav.addObject("satManList", satManList);
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
			@RequestParam("aStatusKurikulum") String aStatusKurikulum
            ) {
		String filter = "CAST( k.aStatusKurikulum as string) LIKE '%"+aStatusKurikulum+"%'";
		Datatable kurikulumDatatable = kurikulumServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch,filter);
		return kurikulumDatatable;
	}
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("kurikulum") Kurikulum kurikulum,
            BindingResult result, Map<String, Object> model) {
		AjaxResponse response = new AjaxResponse();

		logger.info(String.valueOf(kurikulum.getThnMulai()));
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
        response.setData(kurikulumServ.save(kurikulum));
        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
        else 
        {
        	response.setStatus("error");
        	response.setMessage("Kurikulum sudah ada");
        }
        return response;
    }
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse edit(@RequestParam("idKurikulum") UUID idKurikulum) {
		AjaxResponse response;
		Kurikulum kurikulum = kurikulumServ.findById(idKurikulum);
		if(kurikulum == null) response = new AjaxResponse("error","Data tidak ditemukan",null);
		else response = new AjaxResponse("ok","Data ditemukan",kurikulum);
        return response;
    }
	
	@RequestMapping(value = "/deletemany", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse deleteMany(@RequestParam("idKurikulum[]") UUID[] idKurikulum) {
		AjaxResponse response;
		for (UUID uuid : idKurikulum) {
			kurikulumServ.delete(uuid);
		}
		response = new AjaxResponse("ok","Data dihapus",null);
        return response;
    }
	/*@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView showKurikulum(){
		ModelAndView mav = new ModelAndView(); 
		List<Kurikulum> kurikulumList = kurikulumServ.findAll();
		mav.addObject("kurikulums", kurikulumList);
		mav.setViewName("Kurikulum");
		return mav;
	}*/
	/*@RequestMapping(value="/tambah", method=RequestMethod.GET)
	public ModelAndView showSatManOption(){
		ModelAndView mav = new ModelAndView();
		List<SatMan> satManList = satManServ.findAll();
		mav.addObject("satMans", satManList);
		mav.setViewName("TambahKurikulum");
		return mav;
	}
	
	//tambah kurikulum
	@RequestMapping(value="/tambah/aksi", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/ubah/{idKurikulum}", method=RequestMethod.GET)
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
		@RequestMapping(value="/ubah/aksi/{idKurikulum}", method=RequestMethod.POST)
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
		@RequestMapping(value="/ubah/aktif/{idKurikulum}", method=RequestMethod.GET)
		public ModelAndView changeStatus(@PathVariable String idKurikulum){
			ModelAndView mav = new ModelAndView(); 
			kurikulumServ.activateKurikulum(kurikulumServ.convertToUUID(idKurikulum));
			mav.setViewName("redirect:/kurikulum");
			return mav;
		}
	//end of aktif kurikulum
		
	//hapus kurikulum
		@RequestMapping(value="/ubah/hapus/{idKurikulum}", method=RequestMethod.GET)
		public ModelAndView deactivateKurikulum(@PathVariable String idKurikulum){
			ModelAndView mav = new ModelAndView();
			kurikulumServ.deleteKurikulum(kurikulumServ.convertToUUID(idKurikulum));
			mav.setViewName("redirect:/kurikulum");
			return mav;
		}
		//end of hapus kurikulum
*/}
