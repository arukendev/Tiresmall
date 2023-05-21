package com.tireshoppingmall.home.admin.order;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminOrderController {
	
	private boolean orderFirstReq;
	
	@Autowired
	private OrderDAO oDAO;
	
	public AdminOrderController() {
		orderFirstReq = true;
	}
	
	//admin.order.go
	@RequestMapping(value = "/admin.order.go", method = RequestMethod.GET)
	public String orderGo(HttpServletRequest req) {
		if(orderFirstReq) {
			oDAO.calcAllOrderCount();
			orderFirstReq = false;
		}
		OrderSearchDTO.clearsearch(req);
		oDAO.getOrder(1, req);
		req.setAttribute("contentPage", "order/order.jsp");
		return "admin/master";
	}
	
	@RequestMapping(value = "/search.order.do", method = RequestMethod.GET)
	public String search(HttpServletRequest req, OrderSearchDTO osDTO) {
		
		oDAO.searchOrder(osDTO, req);
		oDAO.getOrder(1, req);
		req.setAttribute("contentPage", "order/order.jsp");
		return "admin/master";
	}

	@RequestMapping(value = "/update.order.do", method = RequestMethod.GET)
	public String updateOrder(HttpServletRequest req, OrderUpdateDTO ouDTO) {
		oDAO.updateOrder(req, ouDTO);
		return "redirect:admin.order.go";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete.order.do", method = RequestMethod.GET)
	public int deleteOrder(HttpServletRequest req, @RequestParam("o_no") String o_no) {
		
		return oDAO.deleteOrder(req, o_no);
	}
	
	@RequestMapping(value = "/order.page.change", method = RequestMethod.GET)
	public String pagingOrder(HttpServletRequest req, @RequestParam int p) {
		System.out.println(p);
		oDAO.getOrder(p, req);
		req.setAttribute("contentPage", "order/order.jsp");
		return "admin/master";
	}
	
	
}
