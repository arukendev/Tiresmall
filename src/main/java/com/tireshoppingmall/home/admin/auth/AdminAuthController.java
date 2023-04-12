package com.tireshoppingmall.home.admin.auth;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminAuthController {

	private boolean firstReq;
	
	@Autowired
	private AuthDAO aDAO;
	
	public AdminAuthController() {
		firstReq = true;
	}

	//admin.auth.go
	@RequestMapping(value = "/admin.auth.go", method = RequestMethod.GET)
	public String authGo(HttpServletRequest req) {
		
		if (firstReq) {
			aDAO.calcAllAuthCount();
			firstReq = false;
		}	
		AuthDTO.AuthPagsing(req);
		aDAO.getAllAuth(1,req);
		

		req.setAttribute("contentPage", "auth/auth.jsp");
		return "admin/master";
	}
	
	//admin.searchAuth.do
	@RequestMapping(value = "/admin.searchAuth.do", method = RequestMethod.POST)
	public String searchAuthDo(HttpServletRequest req,AuthDTO aDTO) {
		
		aDAO.authPasing(aDTO, req);
		aDAO.getAllAuth(1,req);
		
		req.setAttribute("contentPage", "auth/auth.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/auth.page.change", method = RequestMethod.GET)
	public String Paging(HttpServletRequest req, @RequestParam int p) {
		
		aDAO.getAllAuth(p, req);
		
		req.setAttribute("contentPage", "auth/auth.jsp");
		return "admin/master";
	}
	
	//auth.delete.go
	@RequestMapping(value = "/auth.delete.go", method = RequestMethod.GET)
	public String authDeleteGo(HttpServletRequest req,AuthDTO aDTO) {	
		aDAO.authDelete(req,aDTO);	
		return "redirect:admin.auth.go";
	}
	
	//admin.update.go
	@RequestMapping(value = "/admin.update.go", method = RequestMethod.POST)
	public String updateAuthDo(HttpServletRequest req,AuthDTO aDTO) {	
		
		aDAO.updateAuth(req,aDTO);
		aDAO.getAllAuth(1,req);	
		
		req.setAttribute("contentPage", "auth/auth.jsp");
		return "admin/master";
	}
}
