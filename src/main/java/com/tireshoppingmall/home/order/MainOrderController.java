package com.tireshoppingmall.home.order;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainOrderController {
	@Autowired
	MainOrderDAO mODAO;
	
	@RequestMapping(value = "/pay.go", method = RequestMethod.GET)
	public String goPay(HttpServletRequest req) {
		req.setAttribute("content", "main/product/pay.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/pay.complete", method = RequestMethod.POST)
	public String completePay(HttpServletRequest req, MainOrderDTO mODTO) {
		System.out.println(mODTO);
		mODAO.setValues(req, mODTO);
		req.setAttribute("content", "main/product/complete.jsp");
		return "index";
	}
}
