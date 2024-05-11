package com.tireshoppingmall.home.order;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tireshoppingmall.home.admin.store.BranchDTO;
import com.tireshoppingmall.home.admin.tire.TireDTO;
import com.tireshoppingmall.home.product.PaymentDTO;


@Controller
public class MainOrderController {
	@Autowired
	MainOrderDAO mODAO;
	
	@RequestMapping(value = "/pay.go", method = RequestMethod.GET)
	public String goPay(HttpServletRequest req) {
		mODAO.getCarInfo(req);
		req.setAttribute("content", "main/product/pay.jsp");
		return "index";
	}
	//pay.store.change
	@ResponseBody
	@RequestMapping(
			value = "pay.store.change",
			method = RequestMethod.GET,
			produces = "application/json;charset=utf-8"
			)
	public BranchDTO payStoreChange(int b_id) {
		return mODAO.payStoreChage(b_id);
	}
	
	@RequestMapping(value = "/pay.complete", method = RequestMethod.POST)
	public String completePay(HttpServletRequest req, MainOrderDTO mODTO) {
		System.err.println(mODTO);
		mODAO.setValues(req, mODTO);
		req.setAttribute("content", "main/product/complete.jsp");
		return "index";
	}
}
