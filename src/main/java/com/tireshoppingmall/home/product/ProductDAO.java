package com.tireshoppingmall.home.product;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private ProductGroupOption pgo;
	
	private int allProductGroupCount;
	
	public int getAllProductGroupCount() {
		return allProductGroupCount;
	}

	public void setAllProductGroupCount(int allProductGroupCount) {
		this.allProductGroupCount = allProductGroupCount;
	}



	public void getProductGroup(int pageNo, HttpServletRequest request) {
		
		int count = pgo.getProductGroupCountPerPage();	// 지금 16
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);
        
        ProductSelector search = (ProductSelector) request.getSession().getAttribute("search");
        int productGroupCount = 0;

        if (search == null) {
            search = new ProductSelector("", "", new BigDecimal(start), new BigDecimal(end));
            productGroupCount = allProductGroupCount;
        } else {
            search.setStart(new BigDecimal(start));
            search.setEnd(new BigDecimal(end));
            productGroupCount = ss.getMapper(ProductMapper.class).getProductGroupCount(search);
        }

        List<ProductGroupDTO> pGroups = ss.getMapper(ProductMapper.class).getProductGroup(search);
        for (ProductGroupDTO pGroup : pGroups) {
        		if(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)!=null) {
				pGroup.setMinInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)));
        		}
        		if(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)!=null) {
        			pGroup.setMaxInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)));
        		}
        		if(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)!=null) {
        			pGroup.setMinPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)));
        		}
        		if(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)!=null) {
        			pGroup.setMaxPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)));
        		}
		}
        
        int pageCount = (int) Math.ceil(productGroupCount / (double) count);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("theNumber", productGroupCount);
        request.setAttribute("pGroups", pGroups);
        request.setAttribute("curPage", pageNo);
		
	}

	public void searchProductGroup(String b, HttpServletRequest request) {
		ProductSelector search = new ProductSelector(b, "", new BigDecimal(0), new BigDecimal(0));
		request.getSession().setAttribute("search", search);
	}
	
	public void calcAllProductGroupCount() {
		ProductSelector pSel = new ProductSelector("", "", null, null);
		allProductGroupCount = ss.getMapper(ProductMapper.class).getProductGroupCount(pSel);
		System.out.println(allProductGroupCount);
	}

	public void clearSearch(HttpServletRequest request) {
		request.getSession().setAttribute("search", null);
	}

	public void searchProductGroup(String b, String t, HttpServletRequest request) {
		ProductSelector search = new ProductSelector(b, t, new BigDecimal(0), new BigDecimal(0));
		request.getSession().setAttribute("search", search);
	}

	public ProductGroups getProductGroupJson(int pageNo, HttpServletRequest request) {
		int count = pgo.getProductGroupCountPerPage();
        int start = (pageNo - 1) * count + 1;
        int end = start + (count - 1);
		
        ProductSelector search = (ProductSelector) request.getSession().getAttribute("search");
        int productGroupCount = 0;
        
        search.setStart(new BigDecimal(start));
        search.setEnd(new BigDecimal(end));
        productGroupCount = ss.getMapper(ProductMapper.class).getProductGroupCount(search);
        
		List<ProductGroupDTO> pGroups = ss.getMapper(ProductMapper.class).getProductGroup(search);
		
        for (ProductGroupDTO pGroup : pGroups) {
    		if(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)!=null) {
			pGroup.setMinInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinInchOfGroup(pGroup)));
    		}
    		if(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)!=null) {
    			pGroup.setMaxInch(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxInchOfGroup(pGroup)));
    		}
    		if(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)!=null) {
    			pGroup.setMinPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMinPriceOfGroup(pGroup)));
    		}
    		if(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)!=null) {
    			pGroup.setMaxPrice(Integer.parseInt(ss.getMapper(ProductMapper.class).getMaxPriceOfGroup(pGroup)));
    		}
        }
        
        int pageCount = (int) Math.ceil(productGroupCount / (double) count);
		return new ProductGroups(pGroups, pageCount, productGroupCount, pageNo);
	}

	public void getProduct(HttpServletRequest request, ProductDTO pDTO) {
		ProductDTO product = ss.getMapper(ProductMapper.class).getProduct(pDTO);
		request.setAttribute("product", product);
	}

	public Sizes getProductSizes(HttpServletRequest request, ProductDTO pDTO) {
		return new Sizes(ss.getMapper(ProductMapper.class).getProductSizes(pDTO));
	}
		


}
