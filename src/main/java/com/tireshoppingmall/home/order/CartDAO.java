package com.tireshoppingmall.home.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class CartDAO {

	public int addCart(CartDTO cDTO, HttpServletRequest req) {
		ArrayList<CartDTO> cList = (ArrayList<CartDTO>) req.getSession().getAttribute("cartSession");
		for (CartDTO cartSession : cList) {
			if (cartSession.getTi_id() == cDTO.getTi_id()) {
				return 0;
			}
		}
		cList.add(cDTO);
		return 1;
	}

	public int deleteCart(CartDTO cDTO, HttpServletRequest req) {
		ArrayList<CartDTO> cList = (ArrayList<CartDTO>) req.getSession().getAttribute("cartSession");
		for (CartDTO cartSession : cList) {
			if (cartSession.getTi_id() == cDTO.getTi_id()) {
				cList.remove(cartSession);
			}
		}
		return 1;
	}
	
	public int updateCart(CartDTO cDTO, HttpServletRequest req) {
		ArrayList<CartDTO> cList = (ArrayList<CartDTO>) req.getSession().getAttribute("cartSession");
		for (CartDTO cartSession : cList) {
			if (cartSession.getTi_id() == cDTO.getTi_id()) {
				cartSession.setTi_stock(cDTO.getTi_stock());
				cartSession.setTi_allpricegp(cDTO.getTi_allpricegp());
				cartSession.setTi_allpricefac(cDTO.getTi_allpricefac());
			}
		}
		return 1;
	}

	public int directPay(CartDTO cDTO, HttpServletRequest req) {
		ArrayList<CartDTO> cList = (ArrayList<CartDTO>) req.getSession().getAttribute("cartSession");
		if (cList.size() >= 1) {
			cList.clear();
		}
		cList.add(cDTO);
		return 1;
	}
}
