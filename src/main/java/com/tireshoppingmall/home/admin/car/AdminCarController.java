package com.tireshoppingmall.home.admin.car;

import javax.servlet.http.HttpServletRequest;
// import com.tireshoppingmall.home.admin.AdminMenuSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminCarController {
	
	private boolean firstReq;

	@Autowired
	private CarDAO cDAO;

	
	public AdminCarController() {
		firstReq = true;
	}
	
	//admin.car.go
	@RequestMapping(value = "/admin.car.go", method = RequestMethod.GET)

	public String carGo(HttpServletRequest req) {
	
		if (firstReq) {
			cDAO.calcAllCarCount();
			firstReq = false;
		}
		CarDTO.CarPaging(req);
		cDAO.getAllCar(1,req);
		
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car.jsp");
		return "admin/master";	
	}
	

	
	
	//admin.car.reg.go
	@RequestMapping(value = "/admin.car.reg.go", method = RequestMethod.GET)
	public String carregGo(HttpServletRequest req) {
		
		cDAO.getallCarBrands(req);
		
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car_reg.jsp");
		return "admin/master";
	}
	
	
	@RequestMapping(value = "/admin.car.reg.do", method = RequestMethod.POST)
	public String carRegdo(CarDTO c, HttpServletRequest req) {
		
		cDAO.regCar(c, req);
		cDAO.getAllCar(1, req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/admin.car.update.do", method = RequestMethod.POST)
	public String carupdatedo(MultipartFile file,CarDTO c, HttpServletRequest req) {
		
		cDAO.updateCar(file,c, req);
		cDAO.getAllCar(1, req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car.jsp");
		return "admin/master";
	}
	
	
	@RequestMapping(value = "/admin.car.delete.do", method = RequestMethod.GET)
	public String cardeletedo(CarDTO c, HttpServletRequest req) {
		
		cDAO.deletecar(c,req);
		cDAO.getAllCar(1, req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car.jsp");
		return "admin/master";
	}
	
	
	@RequestMapping(value = "/car.search.do", method = RequestMethod.GET)
	public String carsearchdo(CarDTO c, HttpServletRequest req) {
		
		cDAO.searchcar(c,req);	//세션
		cDAO.getAllCar(1, req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car.jsp");
		return "admin/master";
	}
	
	
	@RequestMapping(value = "/car.page.change", method = RequestMethod.GET)
	public String PagingCar(CarDTO c, HttpServletRequest req, @RequestParam int p) {
		
		cDAO.getAllCar(p, req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/brand.delete.do", method = RequestMethod.GET)
	public String branddeletedo(CarDTO c, HttpServletRequest req) {
		cDAO.deletebrand(c,req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car_brand.jsp");
		return "admin/master";
	}
	
	
	
	//카 브랜드 작업
	//admin.car.brand.go
	@RequestMapping(value = "/admin.car.brand.go", method = RequestMethod.GET)
	public String carBrandGo(CarDTO c,HttpServletRequest req) {
		//AdminMenuSession menuSession
		cDAO.getallCarBrands(req);
		cDAO.getallBrandCount(c,req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car_brand.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/reg.brand.do", method = RequestMethod.GET)
	public String brandregdo(CarDTO c, HttpServletRequest req) {
		
		cDAO.regbrand(c, req);
		cDAO.getallCarBrands(req);
		cDAO.getallBrandCount(c,req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car_brand.jsp");
		return "admin/master";
	}
	
	
	@RequestMapping(value = "/update.brand.do", method = RequestMethod.GET)
	public String brandupdatedo(CarDTO c, HttpServletRequest req) {
		
		cDAO.updatebrand(c, req);
		cDAO.getallCarBrands(req);
		cDAO.getallBrandCount(c,req);
		req.setAttribute("subMenuPage", "car/car_subMenu.jsp");
		req.setAttribute("contentPage", "car/car_brand.jsp");
		return "admin/master";
	}
	
	
}
