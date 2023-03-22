package com.tireshoppingmall.home.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;

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
}
