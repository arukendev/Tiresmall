package com.tireshoppingmall.home.product;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tireshoppingmall.home.admin.order.OrderDTO;
import com.tireshoppingmall.home.auth.MemberDAO;
import com.tireshoppingmall.home.order.MainOrderController;
import com.tireshoppingmall.home.order.MainOrderDAO;
import com.tireshoppingmall.home.order.MainOrderDTO;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;

	@Autowired
	private MainOrderDAO mODAO;
	
	private boolean firstReq;

	public ProductController() {
		firstReq = true;
	}

	// @RequestMapping(value = "/product", method = RequestMethod.GET)
	// public String goProduct(HttpServletRequest request, @RequestParam int p) {
	// pDAO.clearSearch(request);
	// pDAO.getProductGroup(p, request);
	// request.setAttribute("content", "main/product/product.jsp");
	// return "index";
	// }

	@RequestMapping(value = "/product.brand", method = RequestMethod.GET)
	public String goProductBrand(HttpServletRequest request, @RequestParam String b, @RequestParam int p) {
		if (firstReq) {
			pDAO.calcAllProductGroupCount();
			firstReq = false;
		}
		if (b == "") {
			pDAO.clearSearch(request);
		} else {
			pDAO.searchProductGroup(b, request);
		}
		pDAO.getProductGroup(p, request);
		request.setAttribute("content", "main/product/product.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.brand.type", method = RequestMethod.GET)
	public String goProductType(HttpServletRequest request, @RequestParam String b, @RequestParam int p,
			@RequestParam String t) {
		pDAO.searchProductGroup(b, t, request);
		pDAO.getProductGroup(p, request);
		request.setAttribute("content", "main/product/product.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.brand.type.ajax", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody ProductGroups goProductTypeAjax(HttpServletRequest request, @RequestParam String b,
			@RequestParam int p, @RequestParam String t) {
		pDAO.searchProductGroup(b, t, request);
		return pDAO.getProductGroupJson(p, request);
	}

	@RequestMapping(value = "/product.detail", method = RequestMethod.GET)
	public String goProductDetail(HttpServletRequest request, ProductDTO pDTO) {
		pDAO.getProduct(request, pDTO);
		request.setAttribute("content", "main/product/detail.jsp");
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(
		value = "/product.size.get", 
		method = RequestMethod.POST,
		produces = "application/json;charset=utf-8"
	)
	public Sizes getProductSizes(HttpServletRequest request, ProductDTO pDTO) {
		return pDAO.getProductSizes(request, pDTO);
	}

	
	@ResponseBody
	@RequestMapping(
			value = "/kakao.popup",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8"
			)
	public String kakaoPayReady(HttpServletRequest req, PaymentDTO pDTO) {
		return pDAO.kakaoPopup(pDTO, req);
	}
	
	@RequestMapping(value = "/kakao.popup.approve.go", method = RequestMethod.GET)
	public String kakaoApproveGo(HttpServletRequest req) {
		return "main/product/kakao-approval";
	}

	@RequestMapping(value = "/kakao.popup.approve.do", method = RequestMethod.POST)
	public String kakaoApproveDo(HttpServletRequest req,MainOrderDTO mODTO) {
		pDAO.kakaoApprove(req);
		mODAO.setValues(req, mODTO);
		req.setAttribute("content", "main/product/complete.jsp");
		return "index";
	}

	@RequestMapping(value = "/kakao.popup.fail", method = RequestMethod.GET)
	public String kakaoFail(HttpServletRequest req,MainOrderDTO mODTO) {
		return "main/product/kakao-fail";
	}
	@RequestMapping(value = "/kakao.popup.cancle", method = RequestMethod.GET)
	public String kakaoCancle(HttpServletRequest req,MainOrderDTO mODTO) {
		return "main/product/kakao-cancle";
	}
	
	
	
	
	
}
