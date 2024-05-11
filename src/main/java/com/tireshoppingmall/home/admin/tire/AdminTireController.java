package com.tireshoppingmall.home.admin.tire;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class AdminTireController {
	
	@Autowired
	TireDAO tDAO;
	
	private boolean tireFirstReq;
	private boolean tireCharacteristicsFirstReq;

	public AdminTireController() {
		tireFirstReq=true;
		tireCharacteristicsFirstReq=true;
	}
	
	
	//admin.tire.go
	@RequestMapping(value = "/admin.tire.go", method = RequestMethod.GET)
	public String tireGo(HttpServletRequest req) {

		if (tireFirstReq) {
			tDAO.calcAllTireCount();
			tireFirstReq = false;
		}	
		
		TireDTO.TirePagsing(req);
		tDAO.getAllTireGroup(1,req);

	
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire.jsp");
		return "admin/master";
	}
	//admin.tire.search.do
	@RequestMapping(value = "/admin.tire.search.do", method = RequestMethod.GET)
	public String searchTireDo(HttpServletRequest req,TireDTO tDTO) {
		
		tDAO.tirePasing(tDTO, req);
		tDAO.getAllTireGroup(1,req);
		
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire.jsp");
		return "admin/master";
	}
	
	//페이징 췌인징
	@RequestMapping(value = "/tire.page.change", method = RequestMethod.GET)
	public String Paging(HttpServletRequest req, @RequestParam int p) {
		
		tDAO.getAllTireGroup(p, req);
		
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire.jsp");
		return "admin/master";
	}

	@ResponseBody
	@RequestMapping(value = "admin.tire.print.onoff", method = RequestMethod.GET)
	public int tirePrintOnOff(TireDTO tDTO) {	
		
		return tDAO.tirePrintOnOff(tDTO);
	}
	
	//admin.tire.sedan.recommend
	@ResponseBody
	@RequestMapping(value = "admin.tire.sedan.recommend", method = RequestMethod.GET)
	public int tireSedanRecommend(TireDTO tDTO) {	
		
		return tDAO.tireSedanRecommend(tDTO);
	}	
	
	//admin.tire.sev.recommend
	@ResponseBody
	@RequestMapping(value = "admin.tire.suv.recommend", method = RequestMethod.GET)
	public int tireSuvRecommend(TireDTO tDTO) {	
		
		return tDAO.tireSuvRecommend(tDTO);
	}
	//admin.tire.group.dcrate.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.group.dcrate.change", method = RequestMethod.GET)
	public int tireGroupDcrateChange(TireDTO tDTO) {	
		
		return tDAO.tireGroupDcrateChange(tDTO);
	}
	
	
	
	//admin.tire.reg.go
	@RequestMapping(value = "/admin.tire.reg.go", method = RequestMethod.GET)
	public String tireRegGo(HttpServletRequest req) {
		
		
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire_reg.jsp");
		return "admin/master";
	}
	//admin.tire.reg.do
	@RequestMapping(value = "/admin.tire.reg.do", method = RequestMethod.POST)
	public String tireRegDo(@RequestParam("file") MultipartFile file,MultipartHttpServletRequest files,HttpServletRequest req,TireListDTO tDTO) {

		
		tDAO.tireRegDo(tDTO,req,file,files);
		
		
		TireDTO.TirePagsing(req);
		tDAO.getAllTireGroup(1,req);
			
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire.jsp");
		return "admin/master";
	}
	
	//admin.tire.update.go
	@RequestMapping(value = "/admin.tire.update.go", method = RequestMethod.GET)
	public String tireUpdateGo(HttpServletRequest req,TireDTO tDTO) {		
		
		tDAO.getTireItem(tDTO,req);
			
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire_update.jsp");
		return "admin/master";
	}
	//admin.tire.update.do
	@RequestMapping(value = "/admin.tire.update.do", method = RequestMethod.POST)
	public String tireUpdateDo(MultipartFile file,MultipartHttpServletRequest files,HttpServletRequest req,TireListDTO tDTO) {		

		tDAO.tireUpdate(file,files,req,tDTO);
		
		TireDTO.TirePagsing(req);
		tDAO.getAllTireGroup(1,req);
			
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire.jsp");
		return "admin/master";
			
	}
	//admin.tire.size.delete
	@ResponseBody
	@RequestMapping(value = "admin.tire.size.delete", method = RequestMethod.GET)
	public int adminTireSizeDelete(TireDTO tDTO) {	
		return tDAO.tireSizeDelte(tDTO);
	}
	//admin.tire.size.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.size.change", method = RequestMethod.GET)
	public int adminTireSizeChange(TireDTO tDTO) {	
		return tDAO.tireSizeChange(tDTO);
	}
	//admin.tire.marking.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.marking.change", method = RequestMethod.GET)
	public int adminTireMarkingChange(TireDTO tDTO) {	
		return tDAO.tireMarckingChange(tDTO);
	}
	//admin.tire.pricefac.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.pricefac.change", method = RequestMethod.GET)
	public int adminTirePirceChange(TireDTO tDTO) {	
		return tDAO.tirePriceChange(tDTO);
	}
	//admin.tire.stock.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.stock.change", method = RequestMethod.GET)
	public int adminTireStockChange(TireDTO tDTO) {	
		return tDAO.tireStockChange(tDTO);
	}
	//admin.tire.size.newInsert.reg
	@ResponseBody
	@RequestMapping(value = "admin.tire.size.newInsert.reg", method = RequestMethod.GET)
	public int adminTireSizeNewInsertReg(TireDTO tDTO) {	
		return tDAO.adminTireSizeNewInsertReg(tDTO);
	}
	
	
	
	//admin.tire.delete.go
	@RequestMapping(value = "/admin.tireGroup.delete.go", method = RequestMethod.GET)
	public String tireGroupDeleteGo(HttpServletRequest req,TireDTO tg) {	
		
		tDAO.deleteTireGroup(req,tg);
		TireDTO.TirePagsing(req);
		tDAO.getAllTireGroup(1,req);
			
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire.jsp");
		return "admin/master";
	}
	
	//admin.tire.img.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.img.change", method = RequestMethod.POST)
	public int adminTireImgChange(TireDTO tDTO,@RequestParam("file") MultipartFile file) {	
		System.out.println("여긴옴?");
		return tDAO.tireImgChange(tDTO,file);
	}
	//admin.tire.imgs.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.imgs.change", method = RequestMethod.POST)
	public int adminTireImgsChange(TireDTO tDTO, MultipartHttpServletRequest files) {	
		return tDAO.tireImgsChange(tDTO,files);
	}
	
	
	
	
	
	
	
	
	
	
	
	//admin.tire.brand.go
	@RequestMapping(value = "/admin.tire.brand.go", method = RequestMethod.GET)
	public String tireBrandGo(HttpServletRequest req) {
		

		tDAO.getTireBrand(req);

		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire_brand.jsp");
		return "admin/master";
	}
	//admin.tire.brand.delete.go
	@RequestMapping(value = "/admin.tire.brand.delete.go", method = RequestMethod.GET)
	public String tireBrandDeleteGo(HttpServletRequest req,TireDTO tb) {
		

		tDAO.deleteTireBrand(req,tb);
		tDAO.getTireBrand(req);
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire_brand.jsp");
		return "admin/master";
	}
	//admin.tire.brand.print.onoff
	@ResponseBody
	@RequestMapping(value = "admin.tire.brand.print.onoff", method = RequestMethod.GET)
	public int tireSBrandPrintOnoff(TireDTO tDTO) {	
		
		return tDAO.tireSBrandPrintOnoff(tDTO);
	}
	
	//admin.tire.brand.name.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.brand.name.change", method = RequestMethod.GET)
	public int tireSBrandNameChange(TireDTO tDTO) {	
		return tDAO.tireSBrandNameChange(tDTO);
	}
	
	//admin.tire.brand.order.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.brand.order.change", method = RequestMethod.GET)
	public int tireSBrandOrderChange(TireDTO tDTO) {	
		System.out.println("여긴옴??223");
		return tDAO.tireBrandOrderChange(tDTO);
	}
	//admin.tire.brand.img.change
	@ResponseBody
	@RequestMapping(value = "admin.tire.brand.img.change", method = RequestMethod.POST)
	public int tireSBrandImgChange(TireDTO tDTO, MultipartFile[] file) {	
		System.out.println("여긴옴??223");
		
		return tDAO.tireBrandImgChange(file,tDTO);

		
		
		
		
		//여기 수정중

		
		
		
	}
/*	 @Autowired
     	FileUploadService serviceFile;
	  
	  
	  public Map<String,Object> uploadFiles(MultipartFile[] uploadFiles){
	    
        Map<String,Object> resultMap=new HashMap<String,Object>();
        
        boolean fileUpload = serviceFile.uploadFile(uploadFiles);
        
        if(fileUpload) {
            resultMap.put("result", "success");
        }else {
            resultMap.put("result", "fail");
        }
        
        return resultMap;
        
    }*/
	
	
	//admin.tire.brand.reg
	@RequestMapping(value = "/admin.tire.brand.reg", method = RequestMethod.GET)
	public String tireBrandTRegDo(@RequestParam("file") MultipartFile file, HttpServletRequest req,TireDTO tDTO) {
		

		tDAO.regTireBrand(req,tDTO, file);
		tDAO.getTireBrand(req);
		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire_brand.jsp");
		return "admin/master";
	}
	
	
	
	//admin.tire.charicteristic.go
	@RequestMapping(value = "/admin.tire.charicteristic.go", method = RequestMethod.GET)
	public String tireCharicteristicGo(HttpServletRequest req) {
		
		

		if (tireCharacteristicsFirstReq) {
			tDAO.calcAllTireCount();
			tireCharacteristicsFirstReq = false;
		}	
		

		req.setAttribute("subMenuPage", "tire/tire_subMenu.jsp");
		req.setAttribute("contentPage", "tire/tire_charicteristic.jsp");
		return "admin/master";
	}
	
	
}
