package com.tireshoppingmall.home.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {
	
	@Autowired
	CartDAO cDAO;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String goCart(ArrayList<CartDTO> cList, HttpServletRequest req) {
		if (req.getSession().getAttribute("cartSession") == null) {
			req.getSession().setAttribute("cartSession", cList);
		}
		req.setAttribute("content", "main/product/cart.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart.add", method = RequestMethod.POST)
	public int addCart(ArrayList<CartDTO> cList, CartDTO cDTO, HttpServletRequest req) {
		if (req.getSession().getAttribute("cartSession") == null) {
			req.getSession().setAttribute("cartSession", cList);
		}
		return cDAO.addCart(cDTO, req);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart.delete", method = RequestMethod.POST)
	public int deleteCart(CartDTO cDTO, HttpServletRequest req) {
		return cDAO.deleteCart(cDTO, req);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart.update", method = RequestMethod.POST)
	public int updateCart(CartDTO cDTO, HttpServletRequest req) {
		return cDAO.updateCart(cDTO, req);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart.pay", method = RequestMethod.POST)
	public int directPay(ArrayList<CartDTO> cList, CartDTO cDTO, HttpServletRequest req) {
		if (req.getSession().getAttribute("cartSession") == null) {
			req.getSession().setAttribute("cartSession", cList);
		}
		return cDAO.directPay(cDTO, req);
	}
}
